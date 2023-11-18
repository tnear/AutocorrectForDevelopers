import unittest
from Rule import Rule

# ex: ":*:valeu::value" <- the '*' denotes a prefix rule
class TestMatchPrefix(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        prefixRules = [rule for rule in self.rules if rule.prefixMatch]
        self.prefixRuleList = [rule.oldText for rule in prefixRules]

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 2300)
        self.assertGreater(len(self.prefixRuleList), 340)

    def test_replace(self):
        # prefix rules (":*:") match regardless of end char
        hasEndChar = True
        for inputText in self.prefixRuleList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.prefixMatch)

        hasEndChar = False
        for inputText in self.prefixRuleList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.prefixMatch)

    def test_explicit(self):
        for inputText, expectedText in EXPLICIT_TESTS.items():
            newText, rule = Rule.getReplacementText(self.rules, inputText, False)
            self.assertEqual(newText, expectedText)
            self.assertNotEqual(newText, inputText,
                'These tests are meant to match beyond what is specified in the rule')
            self.assertTrue(rule.prefixMatch)
            self.assertFalse(rule.suffixMatch)

    def test_allPrefixRulesHaveTests(self):
        # every prefix test in ahk script should have an entry in EXPLICIT_TESTS
        testKeys = list(EXPLICIT_TESTS.keys())
        for prefix in self.prefixRuleList:
            if prefix == '.cmo':
                continue # todo: lift limitation for prefix + suffix + case sensitive rules

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
    'grpahs': 'graphs', 'grahping': 'graphing', 'gorups': 'groups', 'gropus': 'groups', 'imoprted': 'imported',
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
    'resluts': 'results', 'rigthVarName': 'rightVarName', 'saefty': 'safety', 'scheudled': 'scheduled',
    'scritped': 'scripted', 'sripting': 'scripting', 'sritped': 'scripted', 'scirpted': 'scripted', 'seraching': 'searching',
    'seperate': 'separate', 'signlaing': 'signaling', 'std:;string': 'std::string',
    'sdt::list': 'std::list', 'sdt:;set': 'std::set', 'stD::sort': 'std::sort',
    'sucessful': 'successful', 'sueprclass': 'superclass', 'synchornous': 'synchronous',
    'sytsemic': 'systemic', 'thoguhtful': 'thoughtful', 'trnasformed': 'transformed',
    'viistor': 'visitor', 'wieghted': 'weighted', 'owrkflows': 'workflows',
    'wirter': 'writer', 'yeidled': 'yielded', 'yeilds': 'yields', 'yoruself': 'yourself',
    'tehcnology': 'technology', 'yorus': 'yours',
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
    'acknwoledgement': 'acknowledgement', 'ackonwledgement': 'acknowledgement', 'elmental': 'elemental', 'pahtlib': 'pathlib',
    'sovler': 'solver', 'entialment': 'entailment', 'ifnormation': 'information', 'reulsts': 'results',
    'calcualtion': 'calculation', 'caluclation': 'calculation', 'initalise': 'initialise', 'proceessing': 'processing',
    'porcessor': 'processor', 'preporcessor': 'preprocessor', 'wokrer': 'worker', 'foudn': 'found', 'reurtned': 'returned',
    'orhtogonal': 'orthogonal', 'prjoection': 'projection', 'ocnfigure': 'configure',
    'assocaitive': 'associative', 'opwerpoint': 'powerpoint', 'rsulted': 'resulted', 'proecdurally': 'procedurally',
    'clutsering': 'clustering', 'memroize': 'memorize', 'commitee': 'committee', 'resulets': 'results', 'osrted': 'sorted',
    'borwsing': 'browsing', 'brwoser': 'browser', 'rueslts': 'results', 'icnremented': 'incremented',
    'collumns': 'columns', 'knwos': 'knows', 'konws': 'knows', 'nkows': 'knows',
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
    'excpetion': 'exception', 'cmoputes': 'computes', 'defauilted': 'defaulted', 'defautls': 'defaults',
    'excetpion': 'exception', 'packaegs': 'packages', 'represneted': 'represented', 'reprsented': 'represented',
    'reutnred': 'returned', 'wrties': 'writes', 'fuctions': 'functions', 'quetsions': 'questions',
    'dfiferential': 'differential', 'resluets': 'results', 'seuqence': 'sequence', 'monitros': 'monitors',
    'repliacs': 'replicas', 'rquries': 'requires', 'sysetms': 'systems', 'crahsed': 'crashed', 'carshed': 'crashed',
    'documentns': 'documents', 'documnts': 'documents', 'resuelts': 'results', 'transofrms': 'transforms',
    'dpulicate': 'duplicate', 'reviists': 'revisits', 'frquency': 'frequency', 'oeprator': 'operator', 'stakcs': 'stacks',
    'satcks': 'stacks', 'asser(': 'assert(', 'messsages': 'messages', 'reqruies': 'requires', 'irghtNode': 'rightNode',
    'cancles': 'cancels', 'clsuters': 'clusters', 'mangaer': 'manager', 'maanger': 'manager',
    'conitnue': 'continue', 'evaulation': 'evaluation', 'proflier': 'profiler', 'adress': 'address', 'imapct': 'impact',
    'elemtens': 'elements', 'odrered': 'ordered', 'benhcmark': 'benchmark', 'benchamrk': 'benchmark',
    'consturct': 'construct', 'ilsten': 'listen', 'proudcer': 'producer', 'prdoucer': 'producer', 'prodcuer': 'producer',
    'unlokc': 'unlock', 'condiions': 'conditions', 'bnehcmark': 'benchmark', 'opereats': 'operates',
    'benchmakr': 'benchmark', 'bnechmark': 'benchmark', 'ofcus': 'focus',
}

if __name__ == '__main__':
    unittest.main()
