import unittest
from Rule import Rule

# ex:: ":C?:bilty::bility"
class TestMatchPrefix(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        # get all suffix rules. note: backspace rules should be ignored because they are whitelisted
        suffixRules = [rule for rule in self.rules if rule.suffixMatch and not rule.backspace]
        self.suffixRuleList = [rule.oldText for rule in suffixRules]

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 2100)
        self.assertGreater(len(self.suffixRuleList), 200)

    def test_replace(self):
        hasEndChar = True
        for inputText in self.suffixRuleList:
            # suffix rules need a prefix which isn't whitelisted
            inputText = 'prefix' + inputText

            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.suffixMatch)

        # suffix rules are NOT autocorrected unless they have an end char
        hasEndChar = False
        for inputText in self.suffixRuleList:
            # suffix rules need a prefix which isn't whitelisted
            inputText = 'prefix' + inputText

            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

    def test_noThreeLetterSuffixes(self):
        threeLetterSuffixes = [rule for rule in self.suffixRuleList if len(rule) <= 3]
        threeLetterSuffixes.sort()

        # permit only these 3-letter suffixes
        assert threeLetterSuffixes == ['ign', 'nig']

    def test_noRedundantSuffixes(self):
        # ensures that no suffix string ends with another string in the list
        # ex: a suffix rule for '-paegs=>-pages' is unnecessary if there is already a rule for '-aegs=>-ages'
        for i, s1 in enumerate(self.suffixRuleList):
            for j, s2 in enumerate(self.suffixRuleList):
                hasRedundantSuffix = i != j and s1.endswith(s2)
                self.assertFalse(hasRedundantSuffix, f'Found redundant suffix: "{s2}" in "{s1}"')

    def test_explicit(self):
        for inputText, expectedText in EXPLICIT_TESTS.items():
            _, rule = Rule.getReplacementText(self.rules, inputText, True)

            # perform the string replacement
            newText = inputText.replace(rule.oldText, rule.newText)

            # verify the replaced string
            self.assertEqual(newText, expectedText)
            self.assertTrue(rule.suffixMatch, f'Failed for input text: "{inputText}"')

    def test_allSuffixRulesHaveTests(self):
        # every suffix test in ahk script should have an entry in EXPLICIT_TESTS
        testKeys = list(EXPLICIT_TESTS.keys())
        for suffix in self.suffixRuleList:
            if suffix == '.cmo':
                continue  # todo: lift limitation for prefix + suffix + case sensitive rules

            testList = [x for x in testKeys if x.endswith(suffix)]
            self.assertGreater(len(testList), 0, f'The suffix "{suffix}" does not have an automated test')


# explicit tests for suffix words (usually as part of bug fixes)
EXPLICIT_TESTS = {
    'availalbe': 'available', 'languaegs': 'languages', 'mkaes': 'makes', 'automaticallly': 'automatically',
    'simultaenous': 'simultaneous', 'pairty': 'parity', 'piarty': 'parity', 'emulaetd': 'emulated',
    'applictaion': 'application', 'applictaoin': 'application', 'applictaions': 'applications',
    'applictaoins': 'applications', 'mathc': 'match', 'natie': 'native', 'ntaive': 'native',
    'callbakc': 'callback', 'callbakcs': 'callbacks', 'abilties': 'abilities', 'ablities': 'abilities',
    'abilites': 'abilities', 'ablites': 'abilities', 'abilty': 'ability', 'ablity': 'ability',
    'keybaord': 'keyboard', 'keyborad': 'keyboard', 'keybaords': 'keyboards', 'keyborads': 'keyboards',
    'loctaing': 'locating', 'notificaction': 'notification',
    'notificaion': 'notification', 'notificactions': 'notifications', 'notificaions': 'notifications',
    'cahcing': 'caching', 'capactiy': 'capacity',
    'capaciyt': 'capacity', 'dependenet': 'dependent', 'dependnet': 'dependent', 'finidng': 'finding',
    'markdonw': 'markdown', 'markodwn': 'markdown', 'adjacnecy': 'adjacency', 'adjacenyc': 'adjacency',
    'simultanoeus': 'simultaneous', 'platofrm': 'platform', 'platofrms': 'platforms',
    'cryptogarphy': 'cryptography', 'cryptograhpy': 'cryptography', 'varinat': 'variant', 'initaite': 'initiate',
    'initaites': 'initiates', 'logicla': 'logical', 'effiicent': 'efficient', 'gradietn': 'gradient',
    'gradienet': 'gradient', 'gradietns': 'gradients', 'gradienets': 'gradients', 'heigth': 'height',
    'utliity': 'utility', 'fianl': 'final', 'closign': 'closing', 'strnig': 'string', 'strnigs': 'strings',
    'strigns': 'strings', 'optoinal': 'optional', 'optioanl': 'optional', 'prevouis': 'previous',
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
    'homepaeg': 'homepage', 'breakopint': 'breakpoint', 'breakopints': 'breakpoints', 'improt': 'import',
    'improts': 'imports', 'coveraeg': 'coverage', 'quadrnat': 'quadrant', 'quadrnats': 'quadrants',
    'enumeraet': 'enumerate', 'enumeraets': 'enumerates', 'securtiy': 'security', 'imprvoe': 'improve',
    'imprvoes': 'improves', 'pusehd': 'pushed', 'smahsing': 'smashing', 'messaeg': 'message',
    'ownersihp': 'ownership', 'ownersihps': 'ownerships', 'recursino': 'recursion', 'recursoin': 'recursion',
    'recuroisn': 'recursion', 'recursinos': 'recursions', 'recursoins': 'recursions', 'recuroisns': 'recursions',
    'sparstiy': 'sparsity', 'recursvie': 'recursive', 'mergesrot': 'mergesort', 'worksapce': 'workspace',
    'workspcae': 'workspace', 'worksapces': 'workspaces', 'workspcaes': 'workspaces', 'outaeg': 'outage',
    'constnat': 'constant', 'constatn': 'constant', 'constnats': 'constants', 'constatns': 'constants',
    'cathces': 'catches', 'persistenet': 'persistent', 'anotehr': 'another', 'somehting': 'something',
    'lifeitme': 'lifetime', 'lifetiem': 'lifetime', 'lifeitmes': 'lifetimes', 'lifetiems': 'lifetimes',
    'tesitng': 'testing', 'funciton': 'function', 'functino': 'function', 'functoin': 'function',
    'funciotn': 'function', 'funcitons': 'functions', 'functinos': 'functions', 'functoins': 'functions',
    'funciotns': 'functions', 'functiosn': 'functions', 'funcitonal': 'functional', 'actvie': 'active',
    'featuer': 'feature', 'featuers': 'features', 'fautls': 'faults', 'permtued': 'permuted',
    'rotues': 'routes', 'exectuion': 'execution', 'exectuions': 'executions', 'discoveyr': 'discovery',
    'activtiy': 'activity', 'softwrae': 'software', 'frameowrk': 'framework', 'framewokr': 'framework',
    'frameowrks': 'frameworks', 'framewokrs': 'frameworks', 'finishsed': 'finished', 'totalign': 'totaling',
    'scalign': 'scaling', 'agetn': 'agent', 'finishesd': 'finished', 'successfullly': 'successfully',
    'previosu': 'previous', 'accoutn': 'account', 'accoutns': 'accounts', 'updaet': 'update', 'updaets': 'updates',
    'automaticalyl': 'automatically', 'successfulyl': 'successfully', 'optoinally': 'optionally',
    'direcotry': 'directory', 'noitfy': 'notify', 'defintiion': 'definition', 'condtiioning': 'conditioning',
    'postiions': 'positions', 'poitner': 'pointer', 'poitners': 'pointers', 'passign': 'passing',
    'automtaed': 'automated', 'packgaes': 'packages', 'abiliites': 'abilities', 'stroed': 'stored',
    'ownershpi': 'ownership', 'facotyr': 'factory', 'transfomr': 'transform', 'transfomrs': 'transforms',
    'duplicaet': 'duplicate', 'anyhwere': 'anywhere', 'TreeNOde': 'TreeNode', 'broadcsat': 'broadcast',
    'efficeintly': 'efficiently', 'efficietnly': 'efficiently', 'efficienetly': 'efficiently',
    'initilaize': 'initialize', 'coroutien': 'coroutine', 'coroutiens': 'coroutines', 'relationshpis': 'relationships',
    'investigaion': 'investigation', 'investigaions': 'investigations', 'combinaion': 'combination',
    'combinaions': 'combinations', 'catpion': 'caption', 'catpions': 'captions', 'initilaized': 'initialized',
    'initilaizes': 'initializes', 'csats': 'casts', 'duplicaets': 'duplicates', 'weigths': 'weights',
    'accoutned': 'accounted', 'exproted': 'exported', 'imprvoed': 'improved', 'captuerd': 'captured',
    'transopse': 'transpose', 'statitsic': 'statistic', 'statitsics': 'statistics', 'speciifc': 'specific',
    'materila': 'material', 'GraphNdoe': 'GraphNode', 'conidtion': 'condition', 'launhicng': 'launching',
    'veriifes': 'verifies', 'visiilbity': 'visibility',
}

if __name__ == '__main__':
    unittest.main()
