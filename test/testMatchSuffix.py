import unittest
from Rule import Rule

# ex:: ":C?:bilty::bility"
class TestMatchPrefix(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        # get all suffix rules. note: backspace rules should be ignored because they are whitelisted
        suffixRules = [rule for rule in cls.rules if rule.suffixMatch and not rule.backspace]
        cls.suffixRuleList = [rule.oldText for rule in suffixRules]
        cls.suffixRuleDict = {rule.oldText : rule.newText for rule in suffixRules}

        # get all exact match rules
        exactMatchRules = [rule for rule in cls.rules
                           if not rule.prefixMatch and not rule.suffixMatch and not rule.backspace and
                           not rule.caseSensitive and not rule.backspace]
        cls.exactMatchDict = {rule.oldText : rule.newText for rule in exactMatchRules}

        # save all whitelist rules in set
        whitelistRules = [rule for rule in cls.rules if rule.backspace]
        cls.whitelistSet = {text.oldText for text in whitelistRules}

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 5100)
        self.assertGreater(len(self.suffixRuleList), 500)

    def test_replace(self):
        hasEndChar = True
        startIdx = 0
        for inputText in self.suffixRuleList:
            # suffix rules need a prefix which isn't whitelisted
            inputText = 'prefix' + inputText

            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.suffixMatch)

        # suffix rules are NOT autocorrected unless they have an end char
        hasEndChar = False
        startIdx = 0
        for inputText in self.suffixRuleList:
            # suffix rules need a prefix which isn't whitelisted
            inputText = 'prefix' + inputText

            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

    def test_noThreeLetterSuffixes(self):
        threeLetterSuffixes = [rule for rule in self.suffixRuleList if len(rule) <= 3]
        self.assertEqual(threeLetterSuffixes, [])

    def test_noRedundantSuffixRules(self):
        # ensures that no suffix string ends with another string in the list
        # ex: a suffix rule for '-paegs=>-pages' is unnecessary if there is already a rule for '-aegs=>-ages'
        for i, s1 in enumerate(self.suffixRuleList):
            for j, s2 in enumerate(self.suffixRuleList):
                hasRedundantSuffix = i != j and s1.endswith(s2)
                if hasRedundantSuffix:
                    # due to nested loop, its faster to self.fail than self.assertFalse
                    self.fail(f'Found redundant suffix rule: "{s2}" in "{s1}"')

    def test_explicit(self):
        for inputText, expectedText in EXPLICIT_TESTS.items():
            _, rule, _ = Rule.getReplacementText(self.rules, inputText, True)
            self.assertIsNotNone(rule, f'Suffix lookup failed for "{inputText}"')

            # perform the string replacement
            newText = inputText.replace(rule.oldText, rule.newText)

            # verify the replaced string
            self.assertEqual(newText, expectedText)
            self.assertTrue(rule.suffixMatch, f'Unable to find suffix for input text: "{inputText}"')

    def test_allSuffixRulesHaveTests(self):
        # every suffix test in ahk script should have an entry in EXPLICIT_TESTS
        testKeys = list(EXPLICIT_TESTS)
        for suffix in self.suffixRuleList:
            testList = [x for x in testKeys if x.endswith(suffix)]
            self.assertGreater(len(testList), 0, f'The suffix "{suffix}" does not have an automated test')

    def test_noRedundantExactMatchRule(self):
        # there is no need for a regular rule which is already encompassed by a suffix rule.
        # ex: the rule 'exectues::executes' is unnecessary with this suffix rule ':?:tues::utes'
        for oldText, newText in self.suffixRuleDict.items():
            for oldTextExact, newTextExact in self.exactMatchDict.items():
                hasRedundancy = oldTextExact.endswith(oldText) and newTextExact.endswith(newText)
                if hasRedundancy:
                    # due to nested loop, it's faster to self.fail than self.assertFalse
                    self.fail(f'Redundant exact match: "{oldTextExact}" not needed due to suffix "-{oldText}"')

    def test_suffixRulesHaveWhitelist(self):
        # every suffix needs a decision on whether it should be whitelisted.
        # ex: typing 'kcet' should not autocorrect to 'cket' even though it is a suffix rule.
        # but typing 'owrk' should autocorrect to 'work'.
        for inputText in self.suffixRuleList:
            if not inputText in NO_WHITELIST_EXCEPTIONS:
                self.assertTrue(inputText in self.whitelistSet, f'"{inputText}" does not have a whitelist (or exception).')

    def test_suffixExamplesMatchRule(self):
        file = Rule.getRelativeFileName('AutocorrectForDevelopers.ahk')

        # trim whitespace from every line in script
        with open(file, encoding='utf-8') as f:
            lines = [line.strip() for line in f]

        # get suffix lines with examples
        lines = [line for line in lines if line.startswith(':C?:') and 'ex: ' in line]
        self.assertGreater(len(lines), 200)

        for line in lines:
            # get rhs of rule, ex: get "zing" in ":C?:zign::zing   ex: ..."
            suffix = line.split('::')[1].split(' ')[0]

            # get examples at the end of the line and split into list
            _, _, example_substring = line.partition('ex: ')
            examples = example_substring.split(', ')

            # verify number of examples, uniqueness, and suffix match
            num_examples = 6
            self.assertGreaterEqual(len(examples), num_examples, f'The suffix rule "{suffix}" does not have >= 5 examples')
            self.assertEqual(len(examples), len(set(examples)), f'The suffix "{suffix}" does not contain unique examples')
            for example in examples:
                self.assertTrue(example.endswith(suffix), f'Suffix example "{example}" does not end with "{suffix}"')

# these are suffixes which should not be whitelisted. These should be autocorrected to actual words.
NO_WHITELIST_EXCEPTIONS = {
    'aicng', 'aegs', 'allly', 'bakc', 'bakcs', 'baord', 'boadr', 'baords', 'borads', 'csated', 'csats', 'ctiy', 'ciyt',
    'citiy', 'DAta', 'daets', 'digns', 'donw', 'odwn', 'edns', 'ofrm', 'ofmr', 'ofrmed', 'formed', 'fomred',
    'ofmred', 'ofrmer', 'fomrer', 'ofmrer', 'ofrmers', 'fomrers', 'ofmrers', 'ofrming', 'fomring', 'ofmring', 'ofrms',
    'fomrs', 'ofmrs', 'getnly', 'grahpy', 'lnied', 'lnies', 'laod', 'laoded', 'laoder', 'laoding', 'laods', 'lcok',
    'lcoks', 'amrk', 'mrak', 'amrked', 'mraked', 'amrking', 'mraking', 'amrks', 'mraks', 'amte', 'amted', 'naion',
    'naions', 'NOde', 'Ndoe', 'paeg', 'pign', 'pnig', 'pigns', 'pnigs', 'opint', 'opints', 'raets', 'retn', 'irng',
    'rign', 'rnig', 'irngs', 'rigns', 'rnigs', 'shesd', 'hsed', 'sihp', 'hsip', 'hspi', 'sihps', 'shpis', 'hsips',
    'hspis', 'srot', 'osrt', 'sapce', 'spcae',
    'psace', 'sapces', 'spcaes', 'psaces', 'STring', 'tbale', 'itno', 'Vlaue', 'Vluae', 'Valeu', 'Vaule',
    'Vlaues', 'Vluaes', 'Valeus', 'Vaules', 'veyr', 'verey', 'hwere', 'wign', 'wnig', 'iwngs', 'wigns', 'wnigs',
    'owrk', 'wokr', 'owrking', 'wokring', 'owrks', 'wokrs', 'dtae', 'dtaes', 'wehre', 'lcoked', 'lokc', 'lokcs',
    'opsed', 'opses', 'psoes', 'opitn', 'opitns', 'wheer', 'pgin', 'pgins', 'iwng', 'wgin', 'wgins', 'wrok',
    'srue', 'tihng', 'emntal', 'emtnal', 'metnal', 'mnetal', 'wroks', 'wroking', 'donws', 'odwns', 'thying', 'byet',
    'byets', 'csating', 'baording', 'borading', 'boadring',
}

# explicit tests for suffix words (usually as part of bug fixes)
EXPLICIT_TESTS = {
    'availalbe': 'available', 'languaegs': 'languages', 'automaticallly': 'automatically',
    'pairty': 'parity', 'emulaetd': 'emulated',
    'applictaion': 'application', 'applictaoin': 'application', 'applictaions': 'applications',
    'applictaoins': 'applications', 'mathc': 'match', 'ntaive': 'native',
    'callbakc': 'callback', 'callbakcs': 'callbacks', 'abilties': 'abilities', 'ablities': 'abilities',
    'abilites': 'abilities', 'ablites': 'abilities', 'abilty': 'ability', 'ablity': 'ability',
    'keybaord': 'keyboard', 'keyborad': 'keyboard', 'keybaords': 'keyboards', 'keyborads': 'keyboards',
    'loctaing': 'locating', 'notificaction': 'notification',
    'notificaion': 'notification', 'notificactions': 'notifications', 'notificaions': 'notifications',
    'cahcing': 'caching', 'capactiy': 'capacity',
    'capaciyt': 'capacity', 'dependenet': 'dependent', 'finidng': 'finding',
    'markdonw': 'markdown', 'markodwn': 'markdown', 'adjacnecy': 'adjacency', 'adjacenyc': 'adjacency',
    'simultanoeus': 'simultaneous', 'platofrm': 'platform', 'platofrms': 'platforms',
    'cryptogarphy': 'cryptography', 'cryptograhpy': 'cryptography', 'varinat': 'variant',
    'logicla': 'logical', 'effiicent': 'efficient', 'gradietn': 'gradient',
    'gradienet': 'gradient', 'gradietns': 'gradients', 'gradienets': 'gradients', 'heigth': 'height',
    'utliity': 'utility',
    'strnig': 'string', 'strnigs': 'strings', 'strign': 'string', 'strigns': 'strings',
    'optoinal': 'optional', 'optioanl': 'optional', 'prevouis': 'previous',
    'prevoius': 'previous', 'deciison': 'decision', 'deciisons': 'decisions', 'edtiing': 'editing',
    'transtiive': 'transitive', 'primtiives': 'primitives', 'recursivley': 'recursively',
    'actiivty': 'activity', 'activiyt': 'activity', 'amortiezd': 'amortized',
    'scaalble': 'scalable', 'qualtiy': 'quality', 'qualiyt': 'quality', 'uplaod': 'upload',
    'uplaoded': 'uploaded', 'uplaoder': 'uploader', 'uplaods': 'uploads', 'estiamte': 'estimate',
    'estiamtes': 'estimates', 'estimaion': 'estimation', 'estimaions': 'estimations', 'commenet': 'comment',
    'comemnt': 'comment', 'comemtn': 'comment', 'commetn': 'comment', 'commnet': 'comment',
    'comemnts': 'comments', 'comemtns': 'comments', 'commetns': 'comments', 'commenets': 'comments',
    'commeents': 'comments', 'commnets': 'comments', 'optimzie': 'optimize', 'optimzied': 'optimized',
    'optimzies': 'optimizes', 'concatentae': 'concatenate', 'concatenaet': 'concatenate',
    'concatentaes': 'concatenates', 'concatenaets': 'concatenates', 'infintiy': 'infinity',
    'segmetnation': 'segmentation', 'segmetnations': 'segmentations', 'breakpoitn': 'breakpoint',
    'breakpiont': 'breakpoint', 'breakponit': 'breakpoint', 'breakpoitns': 'breakpoints',
    'breakpionts': 'breakpoints', 'breakponits': 'breakpoints', 'compoudn': 'compound', 'compoudns': 'compounds',
    'breakopint': 'breakpoint', 'breakopints': 'breakpoints', 'improt': 'import',
    'improts': 'imports', 'coveraeg': 'coverage', 'quadrnat': 'quadrant', 'quadrnats': 'quadrants',
    'enumeraet': 'enumerate', 'enumeraets': 'enumerates', 'securtiy': 'security',
    'pusehd': 'pushed', 'smahsing': 'smashing',
    'ownersihp': 'ownership', 'ownersihps': 'ownerships', 'recursino': 'recursion', 'recursoin': 'recursion',
    'recuroisn': 'recursion', 'recursinos': 'recursions', 'recursoins': 'recursions', 'recuroisns': 'recursions',
    'sparstiy': 'sparsity', 'recursvie': 'recursive', 'mergesrot': 'mergesort', 'worksapce': 'workspace',
    'workspcae': 'workspace', 'worksapces': 'workspaces', 'workspcaes': 'workspaces', 'outaeg': 'outage',
    'constnat': 'constant', 'constatn': 'constant', 'constnats': 'constants', 'constatns': 'constants',
    'cathces': 'catches', 'persistenet': 'persistent', 'anotehr': 'another',
    'lifeitme': 'lifetime', 'lifetiem': 'lifetime', 'lifeitmes': 'lifetimes', 'lifetiems': 'lifetimes',
    'tesitng': 'testing', 'transaciton': 'transaction', 'functino': 'function', 'functoin': 'function',
    'funciotn': 'function', 'transacitons': 'transactions', 'functinos': 'functions', 'functoins': 'functions',
    'funciotns': 'functions', 'functiosn': 'functions', 'transacitonal': 'transactional', 'actvie': 'active',
    'featuer': 'feature', 'featuers': 'features', 'fautls': 'faults', 'exectued': 'executed',
    'exectuion': 'execution', 'exectuions': 'executions', 'discoveyr': 'discovery',
    'activtiy': 'activity', 'softwrae': 'software', 'frameowrk': 'framework', 'framewokr': 'framework',
    'frameowrks': 'frameworks', 'framewokrs': 'frameworks', 'totalign': 'totaling',
    'scalign': 'scaling', 'agetn': 'agent', 'finishesd': 'finished', 'successfullly': 'successfully',
    'previosu': 'previous', 'accoutn': 'account', 'accoutns': 'accounts', 'updaet': 'update', 'updaets': 'updates',
    'automaticalyl': 'automatically', 'successfulyl': 'successfully', 'optoinally': 'optionally',
    'direcotry': 'directory', 'noitfy': 'notify', 'defintiion': 'definition', 'condtiioning': 'conditioning',
    'postiions': 'positions',
    'automtaed': 'automated', 'messgaes': 'messages', 'abiliites': 'abilities', 'stroed': 'stored',
    'ownershpi': 'ownership', 'facotyr': 'factory', 'transfomr': 'transform', 'transfomrs': 'transforms',
    'duplicaet': 'duplicate', 'anyhwere': 'anywhere', 'TreeNOde': 'TreeNode', 'broadcsat': 'broadcast',
    'efficeintly': 'efficiently', 'efficietnly': 'efficiently',
    'initilaize': 'initialize', 'relationshpis': 'relationships',
    'investigaion': 'investigation', 'investigaions': 'investigations', 'combinaion': 'combination',
    'combinaions': 'combinations', 'catpion': 'caption', 'catpions': 'captions', 'initilaized': 'initialized',
    'initilaizes': 'initializes', 'csats': 'casts', 'duplicaets': 'duplicates', 'weigths': 'weights',
    'accoutned': 'accounted', 'exproted': 'exported', 'captuerd': 'captured',
    'transopse': 'transpose', 'statitsic': 'statistic', 'statitsics': 'statistics',
    'GraphNdoe': 'GraphNode', 'launhicng': 'launching',
    'veriifes': 'verifies', 'visiilbity': 'visibility', 'emulatro': 'emulator', 'emulatros': 'emulators',
    'gradeint': 'gradient', 'gradeints': 'gradients', 'averaegd': 'averaged', 'captrued': 'captured',
    'clikced': 'clicked', 'appedned': 'appended', 'appedns': 'appends', 'benchamrk': 'benchmark',
    'benchamrked': 'benchmarked', 'benchamrks': 'benchmarks', 'cloend': 'cloned', 'compsoed': 'composed',
    'trianed': 'trained', 'eraesd': 'erased', 'puhsed': 'pushed', 'cahced': 'cached', 'adatped': 'adapted',
    'tetsed': 'tested', 'lisetd': 'listed', 'gradeitn': 'gradient', 'gradeitns': 'gradients',
    'noityf': 'notify', 'csated': 'casted', 'encoidngs': 'encodings',
    'ofrmed': 'formed', 'fomred': 'formed', 'estiamted': 'estimated', 'generla': 'general', 'priavte': 'private',
    'actiavted': 'activated', 'actiavtes': 'activates', 'activaets': 'activates', 'inofrming': 'informing',
    'transfomring': 'transforming', 'dependenices': 'dependencies', 'literlas': 'literals',
    'remaisn': 'remains', 'lokcing': 'locking', 'boadr': 'board',
    'perforemd': 'performed', 'clokcs': 'clocks', 'smalelr': 'smaller', 'perofmr': 'perform',
    'perofmred': 'performed', 'perofmring': 'performing', 'perofmrs': 'performs', 'deliverey': 'delivery',
    'tikcet': 'ticket', 'tikcets': 'tickets', 'traiend': 'trained', 'curretn': 'current', 'veriifed': 'verified',
    'softawre': 'software', 'mathcer': 'matcher', 'mathcers': 'matchers',
    'lokcer': 'locker', 'lokcers': 'lockers', 'platofrmer': 'platformer', 'platfomrer': 'platformer',
    'platofmrer': 'platformer', 'platofrmers': 'platformers', 'platfomrers': 'platformers', 'platofmrers': 'platformers',
    'veriifer': 'verifier', 'veriifers': 'verifiers',
    'redner': 'render', 'redners': 'renders', 'exproter': 'exporter', 'exproters': 'exporters',
    'equaliesd': 'equalised', 'equaliesr': 'equaliser', 'speciified': 'specified',
    'speciifier': 'specifier', 'speciifiers': 'specifiers', 'speciifies': 'specifies', 'travleing': 'traveling',
    'compraes': 'compares', 'visualzie': 'visualize', 'representaitno': 'representation',
    'representaitnos': 'representations', 'direcitnoal': 'directional', 'distnace': 'distance',
    'distnaces': 'distances', 'optimzier': 'optimizer', 'functinoal': 'functional', 'opitonally': 'optionally',
    'opitnoally': 'optionally', 'optinoally': 'optionally',
    'pointesr': 'pointers', 'objectvies': 'objectives', 'sequentialy': 'sequentially', 'whitepsace': 'whitespace',
    'namepsaces': 'namespaces', 'natiely': 'natively', 'ntaively': 'natively',
    'simultanoeusly': 'simultaneously', 'urgetnly': 'urgently', 'effiicently': 'efficiently', 'optioanlly': 'optionally',
    'postiively': 'positively', 'differetnly': 'differently', 'recursviely': 'recursively', 'constnatly': 'constantly',
    'constatnly': 'constantly', 'actviely': 'actively', 'memberhsip': 'membership', 'memberhsips': 'memberships',
    'negaitvely': 'negatively', 'memberhspi': 'membership', 'memberhspis': 'memberships', 'incremeent': 'increment',
    'visualiez': 'visualize', 'visualzied': 'visualized', 'visualzier': 'visualizer', 'dispalyed': 'displayed',
    'picutre': 'picture', 'picutred': 'pictured', 'picutres': 'pictures',
    'exaclty': 'exactly', 'contaienr': 'container', 'contaienrs': 'containers', 'securitiy': 'security',
    'heihgt': 'height', 'heihgts': 'heights', 'exectuing': 'executing', 'utilitiy': 'utility', 'utiltiies': 'utilities',
    'securiyt': 'security', 'servesr': 'servers', 'funcotins': 'functions', 'laoding': 'loading',
    'indetn': 'indent', 'indenets': 'indents',
    'indetns': 'indents', 'quickosrt': 'quicksort', 'recommendadtion': 'recommendation', 'netowrking': 'networking',
    'netwokring': 'networking', 'varaible': 'variable', 'virtaul': 'virtual', 'mutaully': 'mutually',
    'regitsration': 'registration', 'replaicng': 'replacing', 'referenicng': 'referencing', 'directoreis': 'directories',
    'demontsrations': 'demonstrations', 'finlaly': 'finally', 'substirng': 'substring', 'substirngs': 'substrings',
    'augmeented': 'augmented', 'augmeneted': 'augmented', 'augmneted': 'augmented', 'angualr': 'angular',
    'abiilty': 'ability', 'misisng': 'missing', 'proceissng': 'processing', 'abiilties': 'abilities',
    'finindg': 'finding', 'finindgs': 'findings', 'softwaer': 'software', 'identiyf': 'identify',
    'comemnted': 'commented', 'myVlaue': 'myValue', 'myVluae': 'myValue', 'myValeu': 'myValue',
    'myVaule': 'myValue', 'myVlaues': 'myValues', 'myVluaes': 'myValues', 'myValeus': 'myValues', 'myVaules': 'myValues',
    'myDAta': 'myData', 'mySTring': 'myString', 'folloewr': 'follower', 'folloewrs': 'followers',
    'commentayr': 'commentary', 'acquriing': 'acquiring', 'roudning': 'rounding', 'reltaional': 'relational',
    'consntat': 'constant', 'consntats': 'constants', 'reisde': 'reside', 'reisdes': 'resides', 'moderaetly': 'moderately',
    'capacitiy': 'capacity', 'vieiwng': 'viewing',
    'experiecne': 'experience', 'expereince': 'experience', 'baselnie': 'baseline', 'baselnies': 'baselines',
    'benchamrking': 'benchmarking', 'contnetion': 'contention', 'prevoiusly': 'previously', 'prevouisly': 'previously',
    'previosuly': 'previously', 'experiecnes': 'experiences', 'expereinces': 'experiences', 'mnetions': 'mentions',
    'pipelnied': 'pipelined', 'draiwngs': 'drawings', 'benchmrak': 'benchmark',
    'benchmraked': 'benchmarked', 'benchmraking': 'benchmarking',
    'resposnive': 'responsive', 'adatpive': 'adaptive', 'statisitc': 'statistic', 'statisitcal': 'statistical',
    'statitsical': 'statistical', 'statisitcs': 'statistics', 'deviaotin': 'deviation', 'notifiaction': 'notification',
    'bookmraks': 'bookmarks', 'likning': 'linking', 'activaet': 'activate', 'producesr': 'producers',
    'formatetd': 'formatted', 'modluar': 'modular',
    'balacne': 'balance', 'balacned': 'balanced', 'balacnes': 'balances', 'packte': 'packet', 'packtes': 'packets',
    'parinsg': 'parsing', 'deadlcok': 'deadlock', 'codign': 'coding', 'sampligns': 'samplings', 'declinign': 'declining',
    'findigns': 'findings', 'openigns': 'openings', 'describign': 'describing',
    'tracign': 'tracing', 'debuggign': 'debugging', 'cachign': 'caching', 'maskign': 'masking',
    'timign': 'timing', 'timigns': 'timings', 'mappign': 'mapping', 'mappigns': 'mappings', 'testign': 'testing',
    'havign': 'having', 'drawign': 'drawing', 'drawigns': 'drawings', 'indexign': 'indexing', 'copyign': 'copying',
    'visualizign': 'visualizing', 'describnig': 'describing', 'tracnig': 'tracing', 'findnig': 'finding',
    'findnigs': 'findings', 'changnig': 'changing', 'hashnig': 'hashing', 'networknig': 'networking',
    'profilnig': 'profiling', 'profilnigs': 'profilings', 'timnig': 'timing', 'timnigs': 'timings',
    'functionnig': 'functioning', 'functionnigs': 'functionings', 'mappnig': 'mapping', 'mappnigs': 'mappings',
    'usnig': 'using', 'printnig': 'printing', 'havnig': 'having', 'viewnig': 'viewing', 'viewnigs':'viewings',
    'indexnig': 'indexing', 'copynig': 'copying', 'visualiznig': 'visualizing', 'foldesr': 'folders', 'templaet': 'template',
    'shadwoed': 'shadowed',
    'templaets': 'templates', 'lcoks': 'locks', 'upcomgin': 'upcoming', 'timgins': 'timings', 'executbale': 'executable',
    'validtae': 'validate', 'validtaes': 'validates', 'storgae': 'storage', 'anywehre': 'anywhere', 'contaeinr': 'container',
    'contaeinrs': 'containers', 'caleld': 'called', 'customsie': 'customise', 'customsied': 'customised',
    'customsier': 'customiser', 'customsies': 'customises', 'unlcoked': 'unlocked', 'condtiioned': 'conditioned',
    'comopsed': 'composed', 'unlokc': 'unlock', 'lokcs': 'locks', 'comopses': 'composes',
    'compsoes': 'composes', 'adjacecny': 'adjacency', 'validaotr': 'validator', 'validaotrs': 'validators',
    'veriyfing': 'verifying', 'membesr': 'members', 'workaruond': 'workaround', 'workaruonds': 'workarounds',
    'variabel': 'variable', 'varialbes': 'variables', 'variabels': 'variables',
    'lifeimte': 'lifetime', 'lifeimtes': 'lifetimes', 'pakcs': 'packs', 'expressiosn': 'expressions',
    'statistisc': 'statistics', 'breakopitn': 'breakpoint', 'breakopitns': 'breakpoints', 'concurrenet': 'concurrent',
    'concurrenetly': 'concurrently', 'persistenetly': 'persistently', 'everywheer': 'everywhere',
    'docekr': 'docker', 'docekrs': 'dockers', 'reverisng': 'reversing', 'describgin': 'describing',
    'advancgin': 'advancing', 'hashgin': 'hashing', 'workgin': 'working', 'samplgin': 'sampling', 'samplgins': 'samplings',
    'opengins': 'openings', 'mappgin': 'mapping', 'mappgins': 'mappings', 'routgin': 'routing',
    'havgin': 'having', 'drawgin': 'drawing', 'drawgins': 'drawings', 'fixgin': 'fixing', 'copygin': 'copying',
    'optimizgin': 'optimizing', 'finihses': 'finishes', 'framewrok': 'framework',
    'fianlly': 'finally', 'touhces': 'touches', 'searhcable': 'searchable', 'watiign': 'waiting', 'closrue': 'closure',
    'notihng': 'nothing', 'functinoed': 'functioned', 'experiemntal': 'experimental', 'experiemtnal': 'experimental',
    'experimetnal': 'experimental', 'experimnetal': 'experimental', 'netwroks': 'networks', 'netwroking': 'networking',
    'soretd': 'sorted', 'tetsing': 'testing', 'clikcable': 'clickable', 'probabyl': 'probably', 'convertilbe': 'convertible',
    'previousyl': 'previously', 'shutdonws': 'shutdowns', 'shutodwns': 'shutdowns', 'defniing': 'defining',
    'applicitaon': 'application', 'applicitaons': 'applications', 'represetns': 'represents', 'followesr': 'followers',
    'accurtaely': 'accurately', 'directroies': 'directories', 'anythying': 'anything', 'conditoinals': 'conditionals',
    'conditioanls': 'conditionals', 'documetning': 'documenting', 'technoloyg': 'technology', 'mentieond': 'mentioned',
    'applicatsion': 'application', 'applicatsions': 'applications', 'flatteend': 'flattened', 'sequecne': 'sequence',
    'sequecnes': 'sequences', 'megabyet': 'megabyte', 'kilobyets': 'kilobytes', 'meausre': 'measure',
    'assrues': 'assures', 'meausres': 'measures', 'colletcor': 'collector', 'colletcors': 'collectors',
    'measuerd': 'measured', 'cycilng': 'cycling', 'fililngs': 'fillings', 'improting': 'importing',
    'broadcsating': 'broadcasting', 'experimeneting': 'experimenting', 'experiemnting': 'experimenting',
    'experimeenting': 'experimenting', 'experimneting': 'experimenting', 'simplifeid': 'simplified',
    'onbaording': 'onboarding', 'onborading': 'onboarding', 'onboadring': 'onboarding', 'balnacer': 'balancer',
    'balacner': 'balancer', 'verfiies': 'verifies', 'connetcion': 'connection', 'connetcions': 'connections',
    'formatetr': 'formatter', 'formatetrs': 'formatters', 'forwrad': 'forward', 'forwrads': 'forwards',
    'forwraded': 'forwarded', 'wrapeprs': 'wrappers', 'develoeprs': 'developers', 'longeivty': 'longevity',
    'longeviyt': 'longevity', 'aspetc': 'aspect', 'registratn': 'registrant', 'registratns': 'registrants',
    'cryptograhpic': 'cryptographic', 'represetn': 'represent', 'accurateyl': 'accurately', 'depednable': 'dependable',
    'brihgter': 'brighter', 'adjacetn': 'adjacent', 'advisign': 'advising',
}

if __name__ == '__main__':
    unittest.main()
