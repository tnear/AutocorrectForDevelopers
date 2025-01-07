import unittest
from Rule import Rule

# ex: ":*:valeu::value" <- the '*' denotes a prefix rule
class TestMatchPrefix(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        prefixRules = [rule for rule in cls.rules if rule.prefixMatch]
        cls.prefixRuleList = [rule.oldText for rule in prefixRules]

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 5100)
        self.assertGreater(len(self.prefixRuleList), 700)

    def test_replace(self):
        # prefix rules (":*:") match regardless of end char
        startIdx = 0
        hasEndChar = True
        for inputText in self.prefixRuleList:
            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.prefixMatch)

        startIdx = 0
        hasEndChar = False
        for inputText in self.prefixRuleList:
            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.prefixMatch)

    def test_explicit(self):
        for inputText, expectedText in EXPLICIT_TESTS.items():
            newText, rule, _ = Rule.getReplacementText(self.rules, inputText, False)
            self.assertEqual(newText, expectedText)
            self.assertNotEqual(newText, inputText,
                'These tests are meant to match beyond what is specified in the rule')
            self.assertTrue(rule.prefixMatch)
            self.assertFalse(rule.suffixMatch)

    def test_allPrefixRulesHaveTests(self):
        # every prefix test in ahk script should have an entry in EXPLICIT_TESTS
        testKeys = list(EXPLICIT_TESTS)
        for prefix in self.prefixRuleList:
            testList = [x for x in testKeys if x.startswith(prefix)]
            self.assertGreater(len(testList), 0, f'The prefix "{prefix}" does not have an automated test')

EXPLICIT_TESTS = {
    'abstarction': 'abstraction', 'accomodating': 'accommodating',
    'asertion': 'assertion', 'assrted': 'asserted', 'asssertion': 'assertion',
    'brnaches': 'branches', 'braodcasted': 'broadcasted',
    'catagorical': 'categorical', 'chekced': 'checked',
    'comipler': 'compiler', 'conenction': 'connection', 'conector': 'connector',
    'cosntant': 'constant',
    'contirbutor': 'contributor',
    'contorller': 'controller', 'corectness': 'correctness',
    'dadtabase': 'database',
    'deafults': 'defaults', 'dleetes': 'deletes', 'dpeendency': 'dependency', 'dephtFirst': 'depthFirst',
    'devleoper': 'developer', 'devloeper': 'developer', 'dveloper': 'developer',
    'develoeper': 'developer', 'dififculty': 'difficulty',
    'distnict': 'distinct', 'elemtns': 'elements', 'elemnts': 'elements',
    'elmeents': 'elements', 'evlauation': 'evaluation', 'exoprted': 'exported',
    'feasable': 'feasible',
    'fucntions': 'functions', 'funtional': 'functional', 'fnctions': 'functions',
    'grpahs': 'graphs', 'grahping': 'graphing', 'gropus': 'groups', 'imoprted': 'imported',
    'inofrmational': 'informational',
    'inhertiance': 'inheritance', 'inhreits': 'inherits', 'intiialize': 'initialize',
    'isntance': 'instance', 'inteligence': 'intelligence', 'itnerface': 'interface',
    'lsitener': 'listener', 'manfacturer': 'manufacturer',
    'mltithreaded': 'multithreaded', 'mjultithreaded': 'multithreaded', 'northwsetern': 'northwestern',
    'ojbects': 'objects', 'opeational': 'operational', 'operaetional': 'operational', 'pareamters': 'parameters',
    'paraemters': 'parameters', 'parameers': 'parameters', 'parmaeters': 'parameters', 'aprameters': 'parameters',
    'paramters': 'parameters', 'partitons': 'partitions', 'persitent': 'persistent',
    'pwoershell': 'powershell',
    'probelms': 'problems', 'problmes': 'problems',
    'prblems': 'problems', 'prgoramming': 'programming', 'pesudocode': 'pseudocode',
    'qustions': 'questions', 'quetions': 'questions', 'qiucksort': 'quicksort',
    'refernces': 'references', 'registsers': 'registers', 'rmeoved': 'removed', 'reuqires': 'requires',
    'requriement': 'requirement', 'requreiment': 'requirement', 'requiers': 'requires', 'reuslts': 'results',
    'resluts': 'results', 'rigthVarName': 'rightVarName', 'scheudled': 'scheduled',
    'scritped': 'scripted', 'sripting': 'scripting', 'sritped': 'scripted', 'scirpted': 'scripted', 'seraching': 'searching',
    'seperate': 'separate', 'signlaing': 'signaling', 'std:;string': 'std::string',
    'sdt::list': 'std::list', 'sdt:;set': 'std::set', 'stD::sort': 'std::sort',
    'sucessful': 'successful', 'sueprclass': 'superclass', 'synchornous': 'synchronous',
    'sytsemic': 'systemic', 'thoguhtful': 'thoughtful', 'trnasformed': 'transformed',
    'viistor': 'visitor', 'wieghted': 'weighted', 'owrkflows': 'workflows',
    'wirter': 'writer', 'yeidled': 'yielded', 'yeilds': 'yields',
    'tehcnology': 'technology',
    'Wriet-Output': 'Write-Output', 'wrietr': 'writer',
    'isntructions': 'instructions', 'depenencies': 'dependencies', 'proceudral': 'procedural',
    'isnertion': 'insertion', 'proejcts': 'projects', 'ranodmize': 'randomize',
    'crytpography': 'cryptography', 'mulitply': 'multiply', 'infeasability': 'infeasibility',
    'trnasaction': 'transaction',
    'idnexing': 'indexing', 'rihgts': 'rights', 'docments': 'documents',
    'odcuments': 'documents', 'doucments': 'documents', 'psuedocode': 'pseudocode',
    'rleational': 'relational', 'differnetial': 'differential', 'enahncement': 'enhancement',
    'foudnational': 'foundational', 'paramteers': 'parameters', 'authetnicity': 'authenticity',
    'ssytematic': 'systematic', 'compormised': 'compromised', 'pasrer': 'parser', 'framgentation': 'fragmentation',
    'disconencted': 'disconnected', 'allwoable': 'allowable', 'disconection': 'disconnection',
    'ohterwise': 'otherwise', 'viusalization': 'visualization', 'visulaization': 'visualization',
    'expeirmented': 'experimented', 'araryfun': 'arrayfun', 'arrrayfun': 'arrayfun', 'interoplation': 'interpolation',
    'inteprolation': 'interpolation', 'exeprienced': 'experienced', 'eprformance': 'performance', 'perofrmance': 'performance',
    'pacakges': 'packages', 'packges': 'packages', 'pakcages': 'packages', 'integerates': 'integrates',
    'interperets': 'interprets', 'refatoring': 'refactoring', 'reutrning': 'returning', 'retrning': 'returning',
    'retruning': 'returning', 'retunring': 'returning', 'siwthces': 'switches', 'siwtches': 'switches', 'swiches': 'switches',
    'swtiches': 'switches', 'reudceable': 'reduceable', 'sleection': 'selection', 'seelction': 'selection',
    'prtoection': 'protection', 'wtachpoint': 'watchpoint', 'brekapoint': 'breakpoint', 'brkeapoint': 'breakpoint',
    'coutning': 'counting', 'ocunting': 'counting', 'implmeentation': 'implementation', 'implmenetation': 'implementation',
    'ocntroller': 'controller', 'recusive': 'recursive',
    'repalced': 'replaced', 'corretcion': 'correction', 'freuqently': 'frequently', 'srots': 'sorts',
    'whtiespace': 'whitespace', 'exeuction': 'execution', 'defualts': 'defaults', 'elmeetns': 'elements',
    'otpional': 'optional', 'toekns': 'tokens', 'contsraint': 'constraint', 'requsting': 'requesting',
    'reqeusting': 'requesting', 'rquesting': 'requesting', 'reuqesting': 'requesting',
    'retur ntrue': 'return true', 'rqeusting': 'requesting', 'ocnstant': 'constant',
    'reawrding': 'rewarding', 'consitsently': 'consistently', 'resutled': 'resulted',
    'difficutly': 'difficulty', 'atachment': 'attachment', 'brachned': 'branched', 'lauchning': 'launching',
    'manaegment': 'management',
    'recusrively': 'recursively', 'nuemrator': 'numerator', 'asserrtion': 'assertion', 'swithcing': 'switching',
    'remvoed': 'removed', 'quikcsort': 'quicksort', 'sytematic': 'systematic',
    'acknowlegement': 'acknowledgement', 'recurisvely': 'recursively', 'conssitency': 'consistency',
    'acknwoledgement': 'acknowledgement', 'ackonwledgement': 'acknowledgement', 'elmental': 'elemental',
    'sovler': 'solver', 'entialment': 'entailment', 'ifnormation': 'information', 'reulsts': 'results',
    'calcualtion': 'calculation', 'caluclation': 'calculation', 'initalise': 'initialise', 'proceessing': 'processing',
    'porcessor': 'processor', 'preporcessor': 'preprocessor', 'wokrer': 'worker', 'foudn': 'found', 'reurtned': 'returned',
    'orhtogonal': 'orthogonal', 'prjoection': 'projection', 'ocnfigure': 'configure',
    'assocaitive': 'associative', 'opwerpoint': 'powerpoint', 'rsulted': 'resulted', 'proecdurally': 'procedurally',
    'clutsering': 'clustering', 'memroize': 'memorize', 'commitee': 'committee', 'resulets': 'results', 'osrted': 'sorted',
    'borwsing': 'browsing', 'brwoser': 'browser', 'rueslts': 'results', 'icnremented': 'incremented',
    'collumns': 'columns',
    'interupts': 'interrupts', 'reoprting': 'reporting', 'remianing': 'remaining', 'eleemnts': 'elements',
    'saerching': 'searching', 'diffiuclty': 'difficulty', 'garphs': 'graphs',
    'preidction': 'prediction', 'contniue': 'continue',
    'dmeonstration': 'demonstration', 'detphFirst': 'depthFirst', 'recogniess': 'recognises', 'recogniezs': 'recognizes',
    'std;:cout': 'std::cout', 'hahsed': 'hashed', 'preocmputing': 'precomputing',
    'comptuer': 'computer', 'ocmputer': 'computer', 'looops': 'loops', 'winowds': 'windows', 'prevetns': 'prevents',
    'prserves': 'preserves', 'esitmation': 'estimation', 'proudction': 'production', 'publihser': 'publisher',
    'subcriber': 'subscriber', 'euqals': 'equals', 'datdabase': 'database', 'driection': 'direction', 'disocvery': 'discovery',
    'rquires': 'requires', 'liimts': 'limits', 'ocmbines': 'combines', 'duplcation': 'duplication', 'apramters': 'parameters',
    'entworks': 'networks', 'strutured': 'structured', 'structcured': 'structured',
    'strucutred': 'structured', 'insretion': 'insertion', 'rnadomize': 'randomize', 'srings': 'strings', 'stirngs': 'strings',
    'tsrings': 'strings', 'reuslets': 'results', 'rsluts': 'results', 'parittions': 'partitions', 'inserrtion': 'insertion',
    'leements': 'elements', 'memroise': 'memorise', 'defaluted': 'defaulted',
    'ocnditional': 'conditional', 'consdiers': 'considers', 'indeexes': 'indexes',
    'peformance': 'performance', 'paritcipant': 'participant', 'unsubcribed': 'unsubscribed', 'rqeuirement': 'requirement',
    'fucnitons': 'functions', 'fucntinos': 'functions', 'fucntoins': 'functions', 'fucniotns': 'functions',
    'porgramming': 'programming', 'igonre': 'ignore', 'funtcions': 'functions', 'prpeares': 'prepares', 'schedluer': 'scheduler',
    'braek;': 'break;', 'ajdusting': 'adjusting', 'dfeaulted': 'defaulted', 'reminas': 'remains', 'folows': 'follows',
    'reciever': 'receiver', 'replciate': 'replicate', 'winodws': 'windows', 'restircts': 'restricts',
    'excpetion': 'exception', 'cmoputes': 'computes', 'defautls': 'defaults',
    'excetpion': 'exception', 'packaegs': 'packages', 'represneted': 'represented', 'reprsented': 'represented',
    'reutnred': 'returned', 'wrties': 'writes', 'fuctions': 'functions', 'quetsions': 'questions',
    'dfiferential': 'differential', 'resluets': 'results', 'seuqence': 'sequence', 'monitros': 'monitors',
    'repliacs': 'replicas', 'rquries': 'requires', 'sysetms': 'systems', 'crahsed': 'crashed', 'carshed': 'crashed',
    'documentns': 'documents', 'documnts': 'documents', 'resuelts': 'results', 'transofrms': 'transforms',
    'dpulicate': 'duplicate', 'reviists': 'revisits', 'frquency': 'frequency', 'oeprator': 'operator', 'stakcs': 'stacks',
    'satcks': 'stacks', 'asser(': 'assert(', 'messsages': 'messages', 'reqruies': 'requires', 'irghtNode': 'rightNode',
    'cancles': 'cancels', 'clsuters': 'clusters', 'mangaer': 'manager', 'maanger': 'manager',
    'conitnue': 'continue', 'evaulation': 'evaluation', 'proflier': 'profiler', 'adress': 'address', 'imapct': 'impact',
    'elemtens': 'elements', 'odrered': 'ordered', 'benhcmark': 'benchmark',
    'consturct': 'construct', 'ilsten': 'listen', 'proudcer': 'producer', 'prdoucer': 'producer', 'prodcuer': 'producer',
    'condiions': 'conditions', 'bnehcmark': 'benchmark', 'opereats': 'operates',
    'benchmakr': 'benchmark', 'bnechmark': 'benchmark', 'ofcus': 'focus', 'attahcment': 'attachment', 'ofrmat': 'format',
    'preceeded': 'preceded', 'infreuqently': 'infrequently', 'infrquently': 'infrequently', 'optmial': 'optimal',
    'asesrt': 'assert', 'inesrtion': 'insertion', 'prvent': 'prevent', 'prevenet': 'prevent', 'acceess': 'access',
    'eignevalue': 'eigenvalue', 'obejct': 'object', 'compiel': 'compile', 'rseult': 'result', 'diigt': 'digit',
    'syncrhonous': 'synchronous', 'ahcieve': 'achieve', 'apporach': 'approach', 'hsard': 'shard', 'nidex': 'index',
    'ocnnect': 'connect', 'rselut': 'result', 'leran': 'learn', 'laern': 'learn', 'rseuelt': 'result', 'shaodw': 'shadow',
    'fuctnion': 'function', 'rigiht': 'right', 'refrence': 'reference', 'introuce': 'introduce', 'righit': 'right',
    'represnt': 'represent', 'decrment': 'decrement', 'foramt': 'format', 'incrment': 'increment', 'rseulet': 'result',
    'indistniguishable': 'indistinguishable', 'assesrt': 'assert', 'mtach': 'match', 'amtch': 'match',
    'progrma': 'program', 'suceed': 'succeed', 'idemoptent': 'idempotent', 'acount': 'account', 'impelement': 'implement',
    'reqiure': 'require', 'staet': 'state', 'reustl': 'result', 'alhpabet': 'alphabet', 'seuence': 'sequence',
    'prdouct': 'product', 'reuire': 'require', 'privelege': 'privilege', 'priviledge': 'privilege', 'queyr': 'query',
    'qeury': 'query', 'unsroted': 'unsorted', 'unosrted': 'unsorted', 'inerst': 'insert',
    'ranges:;': 'ranges::', 'rangeS::': 'ranges::', 'ranges;:': 'ranges::', 'reeturn': 'return',
    'otekn': 'token', 'seocnd': 'second', 'secodn': 'second', 'preprae': 'prepare',
    'dierct': 'direct', 'establihs': 'establish', 'estalbish': 'establish', 'reoslve': 'resolve', 'optizmie': 'optimize',
    'frueqen': 'frequen', 'inejct': 'inject', 'reuiqre': 'require', 'suport': 'support', 'assocate': 'associate',
    'brak;': 'break;', 'confilct': 'conflict', 'speciifc': 'specific', 'genearte': 'generate', 'releation': 'relation',
    'reuest': 'request', 'profiel': 'profile', 'qeustion': 'question', 'bleong': 'belong', 'rnaodm': 'random', 'lerna': 'learn',
    'restul': 'result', 'belogn': 'belong', 'equla': 'equal', 'apir<': 'pair<', 'addvance': 'advance', 'follwo': 'follow',
    'altenrate': 'alternate', 'invovle': 'involve', 'resovle': 'resolve', 'reaosn': 'reason', 'fasel;': 'false;',
    'relaitve': 'relative', 'replya': 'replay', 'retuern': 'return', 'reomve': 'remove', 'rmoeve': 'remove', 'fo r(': 'for (',
    'expalin': 'explain', 'distirbute': 'distribute', 'contian': 'contain', 'contina': 'contain', 'ocntain': 'contain',
    'porblem': 'problem', 'whitelsit': 'whitelist', 'permtue': 'permute', 'pemrute': 'permute', '{`n`n]': '{`n`n}',
    'configrue': 'configure', 'aproach': 'approach', 'rpelica': 'replica', 'rewtach': 'rewatch', 'brnahc': 'branch',
    'reigster': 'register', 'lisetn': 'listen', 'repilca': 'replica', 'excepet': 'except',
    'cralw': 'crawl', 'carwl': 'crawl', 'awtch': 'watch', 'differnt': 'different', 'repaly': 'replay',
    'rectnagle': 'rectangle', 'recntagle': 'rectangle', 'rectangel': 'rectangle', 'quatnity': 'quantity',
    'donwload': 'download', 'downloda': 'download', 'uploda': 'upload', 'overlfow': 'overflow', 'blaance': 'balance',
    'execucte': 'execute', 'explian': 'explain', 'resaerch': 'research', 'reserach': 'research', 'resarch': 'research',
    'compelte': 'complete', 'accumualte': 'accumulate', 'extrapoalte': 'extrapolate', 'formualte': 'formulate',
    'popualte': 'populate', 'regualte': 'regulate', 'simualte': 'simulate', 'transalte': 'translate', 'euqla': 'equal',
    'concatneate': 'concatenate', 'condtion': 'condition', 'donwlaod': 'download', 'iwndow': 'window',
    'autocompelte': 'autocomplete', 'ocncurrent': 'concurrent', 'concurent': 'concurrent', 'dyanmic': 'dynamic',
    'systme': 'system', 'reblaance': 'rebalance', 'respodn': 'respond', 'resopnd': 'respond', 'repsond': 'respond',
    'qurey': 'query', 'infomr': 'inform', 'oritent': 'orient', 'rehsape': 'reshape', 'rehspae': 'reshape',
    'deliimt': 'delimit', 'ture;': 'true;', 'glithc': 'glitch', 'occassion': 'occasion', 'agregate': 'aggregate',
    'comunicate': 'communicate', 'bakctrack': 'backtrack', 'esarch': 'search', 'surorund': 'surround',
    'corresopnd': 'correspond', 'correspodn': 'correspond', 'corespond': 'correspond', 'whle (': 'while (',
    'udpate': 'update', 'upadte': 'update', 'updadte': 'update', 'itnroduction': 'introduction', 'integeration': 'integration',
    'impelment': 'implement', 'invnetory': 'inventory', 'erturn': 'return', 'idmepotency': 'idempotency',
    'seqeuence': 'sequence', 'berak;': 'break;', 'ersult': 'result', 'idnetify': 'identify', 'cusotm': 'custom',
    'backtrakc': 'backtrack', 'visaul': 'visual', 'faeture': 'feature', 'fetaure': 'feature', 'reivew': 'review',
    'reveiw': 'review', 'appraoch': 'approach', 'cehck': 'check', 'dgiit': 'digit', 'oragnise': 'organise',
    'oragnize': 'organize', 'pari<int, int>': 'pair<int, int>', 'explina': 'explain', 'striaght': 'straight',
    'sturcture': 'structure', 'assert9': 'assert(', 'udner': 'under', 'encoutner': 'encounter',
    'docuemntation': 'documentation', 'whle(': 'while(', 'tiemstamp': 'timestamp', 'itmestamp': 'timestamp',
    'timestmap': 'timestamp', 'tirgger': 'trigger', 'intorduce': 'introduce', 'adjsut': 'adjust', 'traget': 'target',
    'resltu': 'result', 'inidcate': 'indicate', 'avdance': 'advance', 'vectro<': 'vector<', 'contets': 'contest',
    'contanier': 'container', 'accetp': 'accept', 'rpoblem': 'problem', 'partenr': 'partner', 'exatc': 'exact',
    'approahc': 'approach', 'cosnistent': 'consistent', 'accumlate': 'accumulate', 'idnicate': 'indicate',
    'inehrit': 'inherit', 'inehrti': 'inherit', 'ansewr': 'answer', 'naswer': 'answer', 'attemtp': 'attempt',
    'catgeory': 'category', 'rectnagel': 'rectangle', 'dsitribute': 'distribute',
    'enhacne': 'enhance', 'ntoify': 'notify', 'inovlve': 'involve', 'ctonain': 'contain',
    'requset': 'request', 'detemrine': 'determine', 'desturct': 'destruct', 'sytesm': 'system', 'lcoality': 'locality',
    'uqeyr': 'query', 'imorptant': 'important', 'facotr': 'factor', 'refacotr': 'refactor', 'rseutl': 'result',
    'maintian': 'maintain', 'maintina': 'maintain', 'detial': 'detail', 'idgit': 'digit', 'proofraed': 'proofread',
    'ruselt': 'result', 'extedn': 'extend', 'exetnd': 'extend', 'presetn': 'present', 'overwheml': 'overwhelm',
    'overhwelm': 'overwhelm', 'seqeunce': 'sequence', 'stinrg': 'string', 'dveelop': 'develop', 'parition': 'partition',
    'muliptle': 'multiple', 'elsatic': 'elastic', 'elstaic': 'elastic', 'uspport': 'support', 'drvier': 'driver',
    'strenght': 'strength', 'prodcut': 'product', 'mdoify': 'modify', 'paralel': 'parallel', 'parllel': 'parallel',
    'aprallel': 'parallel', 'parlalel': 'parallel', 'praallel': 'parallel', 'etxend': 'extend', 'perosn': 'person',
    'itnegration': 'integration', 'envrionment': 'environment', 'enviornment': 'environment', 'envirnoment': 'environment',
    'enviroment': 'environment', 'obesrve': 'observe', 'oreint': 'orient', 'comptuation': 'computation',
    'introudce': 'introduce', 'colelct': 'collect', 'laucnh': 'launch', 'ocntext': 'context', 'conetxt': 'context',
    'retreive': 'retrieve', 'uniqeu': 'unique', 'unqiue': 'unique', 'uniuqe': 'unique', 'uinque': 'unique',
    'uqniue': 'unique', 'unqieu': 'unique', 'uqnieu': 'unique',
    'auotmatic': 'automatic', 'montiro': 'monitor', 'devlop': 'develop', 'alocate': 'allocate',
    'appaer': 'appear', 'speicfic': 'specific', 'swtihc': 'switch', 'confiugre': 'configure', 'orgnaise': 'organise',
    'orgnaize': 'organize', 'notiifcation': 'notification', 'shcedule': 'schedule', 'adidtion': 'addition',
    'conidtion': 'condition', 'enhnacement': 'enhancement', 'interpert': 'interpret', 'parmaters': 'parameters',
    'packgae': 'package', 'crucnh': 'crunch', 'progarms': 'programs', 'eqiuvalent': 'equivalent', 'prinicple': 'principle',
    'conifgure': 'configure', 'deelte': 'delete', 'collaboarte': 'collaborate', 'decoarte': 'decorate',
    'emphaisze': 'emphasize', 'emphasiez': 'emphasize', 'emphaszie': 'emphasize', 'reisze': 'resize', 'resiez': 'resize',
    'reszie': 'resize', 'syntheisze': 'synthesize', 'synthesiez': 'synthesize', 'syntheszie': 'synthesize',
    'ot hte': 'to the', 'ot teh': 'to the', 'metnion': 'mention', 'subsytem': 'subsystem', 'insepcts': 'inspects',
    'autoamtic': 'automatic', 'subysstem': 'subsystem', 'sycnhronous': 'synchronous', 'asycnhronous': 'asynchronous',
    'dirver': 'driver', 'accpet': 'accept', 'bororws': 'borrows', 'reocmpile': 'recompile', 'recomiple': 'recompile',
    'decomiple': 'decompile', 'shfit': 'shift', 'concetp': 'concept', 'concpet': 'concept', 'conceptula': 'conceptual',
    'conceputal': 'conceptual', 'addreess': 'address', 'preproceess': 'preprocess', 'paremter': 'parameter',
    'otpino': 'option', 'cuations': 'cautions', 'satuarte': 'saturate', 'misclikc': 'misclick', 'dedutcs': 'deducts',
    'indutcs': 'inducts', 'produtcion': 'production', 'malfucntion': 'malfunction', 'trasnfer': 'transfer',
}

if __name__ == '__main__':
    unittest.main()
