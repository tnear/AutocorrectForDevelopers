import unittest
from Rule import Rule

# ex:: ":*:valeu::value"
class TestMatchPrefix(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        prefixRules = [rule for rule in self.rules if rule.prefixMatch]
        self.prefixRuleList = [rule.oldText for rule in prefixRules]

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 1100)
        self.assertGreater(len(self.prefixRuleList), 160)

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

EXPLICIT_TESTS = {
    'abstarction': 'abstraction', 'accomodating': 'accommodating',
    'algoirthms': 'algorithms', 'algorihtms': 'algorithms', 'ansewred': 'answered',
    'asertion': 'assertion', 'assrted': 'asserted', 'asssertion': 'assertion',
    'blanaced': 'balanced', 'brnaches': 'branches', 'braodcasted': 'broadcasted',
    'catagorical': 'categorical', 'chekced': 'checked',
    'comipler': 'compiler', 'conenction': 'connection', 'conector': 'connector',
    'cosntant': 'constant',
    'contianer': 'container', 'contineus': 'continues', 'ocntinued': 'continued', 'contirbutor': 'contributor',
    'contorller': 'controller', 'corectness': 'correctness',
    'dadtabase': 'database',
    'deafults': 'defaults', 'dleetes': 'deletes', 'dpeendency': 'dependency', 'dephtFirst': 'depthFirst',
    'devleoper': 'developer', 'devloeper': 'developer', 'dveloper': 'developer',
    'develoeper': 'developer', 'dififculty': 'difficulty',
    'distnict': 'distinct', 'eignevalue': 'eigenvalue', 'elemtns': 'elements', 'elemnts': 'elements',
    'elmeents': 'elements', 'evlauation': 'evaluation', 'exoprted': 'exported',
    'feasable': 'feasible',
    'fucntions': 'functions', 'funtional': 'functional', 'fnctions': 'functions',
    'grpahs': 'graphs', 'grahping': 'graphing', 'gorups': 'groups', 'gropus': 'groups', 'imoprted': 'imported',
    'incldues': 'includes', 'incdlues': 'includes', 'inofrmational': 'informational',
    'inhertiance': 'inheritance', 'inhreits': 'inherits', 'intiialize': 'initialize',
    'isntance': 'instance', 'inteligence': 'intelligence', 'itnerface': 'interface',
    'lsitener': 'listener', 'manfacturer': 'manufacturer',
    'mltithreaded': 'multithreaded', 'mjultithreaded': 'multithreaded', 'northwsetern': 'northwestern',
    'ojbects': 'objects', 'opeational': 'operational', 'operaetional': 'operational', 'pareamters': 'parameters',
    'paraemters': 'parameters', 'parameers': 'parameters', 'parmaeters': 'parameters', 'aprameters': 'parameters',
    'paramters': 'parameters', 'partitons': 'partitions', 'persitent': 'persistent',
    'pwoershell': 'powershell', 'pritnln': 'println',
    'priveleges': 'privileges', 'priviledges': 'privileges', 'probelms': 'problems', 'problmes': 'problems',
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
    'trucated': 'truncated', 'udnerstand': 'understand', 'unorderdMap': 'unorderedMap', 'unordrerdMap': 'unorderedMap',
    'udpated': 'updated', 'upadted': 'updated', 'vlaues': 'values', 'avlues': 'values', 'vluaes': 'values', 'valeus': 'values',
    'viistor': 'visitor', 'wieghted': 'weighted', 'owrkflows': 'workflows',
    'wirter': 'writer', 'yeidled': 'yielded', 'yeilds': 'yields', 'yoruself': 'yourself',
    'tehcnology': 'technology', 'yorus': 'yours',
    'Wriet-Output': 'Write-Output', 'wrietr': 'writer', 'alhpanumeric': 'alphanumeric',
    'isntructions': 'instructions', 'depenencies': 'dependencies', 'proceudral': 'procedural',
    'isnertion': 'insertion', 'proejcts': 'projects', 'ranodmize': 'randomize',
    'crytpography': 'cryptography', 'mulitply': 'multiply', 'infeasability': 'infeasibility',
    'trnasaction': 'transaction', 'algroithms': 'algorithms',
    'idnexing': 'indexing', 'rihgts': 'rights', 'docments': 'documents',
    'odcuments': 'documents', 'doucments': 'documents', 'psuedocode': 'pseudocode',
    'rleational': 'relational', 'shrotcut': 'shortcut', 'differnetial': 'differential', 'enahncement': 'enhancement',
    'derefernced': 'dereferenced', 'foudnational': 'foundational', 'paramteers': 'parameters', 'authetnicity': 'authenticity',
    'ssytematic': 'systematic', 'compormised': 'compromised', 'pasrer': 'parser', 'framgentation': 'fragmentation',
    'comapred': 'compared', 'disconencted': 'disconnected', 'allwoable': 'allowable', 'disconection': 'disconnection',
    'ohterwise': 'otherwise', 'defiend': 'defined', 'viusalization': 'visualization', 'visulaization': 'visualization',
    'expeirmented': 'experimented', 'araryfun': 'arrayfun', 'arrrayfun': 'arrayfun', 'interoplation': 'interpolation',
    'inteprolation': 'interpolation', 'exeprienced': 'experienced', 'eprformance': 'performance', 'perofrmance': 'performance',
    'pacakges': 'packages', 'packges': 'packages', 'pakcages': 'packages', 'integerates': 'integrates',
    'interperets': 'interprets', 'refatoring': 'refactoring', 'reutrning': 'returning', 'retrning': 'returning',
    'retruning': 'returning', 'retunring': 'returning', 'siwthces': 'switches', 'siwtches': 'switches', 'swiches': 'switches',
    'swtiches': 'switches',
}

if __name__ == '__main__':
    unittest.main()
