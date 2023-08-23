import unittest
from Rule import Rule

# ex:: ":*:valeu::value"
class TestMatchPrefix(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        file = 'AutocorrectForDevelopers.ahk'
        self.rules = Rule.fileToRuleList(file)

        prefixRules = [rule for rule in self.rules if rule.prefixMatch]
        self.prefixRuleList = [rule.oldText for rule in prefixRules]

    def test_ruleLength(self):
        self.assertTrue(len(self.rules) > 900)
        self.assertTrue(len(self.prefixRuleList) > 180)

    def test_replace(self):
        # prefix rules (":*:") match regardless of end char
        hasEndChar = True
        for inputText in self.prefixRuleList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.prefixMatch)
            self.assertFalse(rule.suffixMatch)

        hasEndChar = False
        for inputText in self.prefixRuleList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)

    def test_explicit(self):
        for inputText, expectedText in EXPLICIT_TESTS.items():
            newText, rule = Rule.getReplacementText(self.rules, inputText, False)
            self.assertEqual(newText, expectedText)
            self.assertNotEqual(newText, inputText,
                'These tests are meant to match beyond what is specified in the rule')
            self.assertTrue(rule.prefixMatch)
            self.assertFalse(rule.suffixMatch)

EXPLICIT_TESTS = {
    'abstarction': 'abstraction', 'accomodating': 'accommodating', 'adminstrators': 'administrators',
    'algoirthms': 'algorithms', 'algorihtms': 'algorithms', 'ansewred': 'answered', 'appearences': 'appearances',
    'arugments': 'arguments', 'asertion': 'assertion', 'assrted': 'asserted', 'asssertion': 'assertion',
    'assesments': 'assessments', 'asignments': 'assignments', 'atributes': 'attributes', 'attirbutes': 'attributes',
    'attirubtes': 'attributes', 'attriubtes': 'attributes', 'bakcward': 'backward', 'backwrads': 'backwards',
    'blanaced': 'balanced', 'brnaches': 'branches', 'braodcasted': 'broadcasted', 'calenders': 'calendars',
    'catagorical': 'categorical', 'chekced': 'checked', 'chidlren': 'children', 'cihpertext': 'ciphertext',
    'comands': 'commands', 'comipler': 'compiler', 'comopnents': 'components', 'conenction': 'connection',
    'cosntant': 'constant', 'constratins': 'constraints', 'constraitns': 'constraints', 'constriants': 'constraints',
    'contianer': 'container', 'contineus': 'continues', 'ocntinued': 'continued', 'contirbutor': 'contributor',
    'contorller': 'controller', 'corectness': 'correctness', 'currenetly': 'currently', 'currrently': 'currently',
    'dahsboards': 'dashboards', 'dadtabase': 'database', 'databses': 'databases', 'databaess': 'databases',
    'deafults': 'defaults', 'dleetes': 'deletes', 'dpeendency': 'dependency', 'dephtFirst': 'depthFirst',
    'descendants': 'descendents', 'devleoper': 'developer', 'devloeper': 'developer', 'dveloper': 'developer',
    'develoeper': 'developer', 'dialgos': 'dialogs', 'diferences': 'differences', 'dififculty': 'difficulty',
    'distnict': 'distinct', 'eignevalue': 'eigenvalue', 'elemtns': 'elements', 'elemnts': 'elements',
    'elmeents': 'elements', 'evlauation': 'evaluation', 'eamples': 'examples', 'examles': 'examples',
    'exaples': 'examples', 'exmaples': 'examples', 'excetpion': 'exception', 'exoprted': 'exported',
    'expresisons': 'expressions', 'expresions': 'expressions', 'failrues': 'failures', 'feasable': 'feasible',
    'flaoting': 'floating', 'fucntions': 'functions', 'funtional': 'functional', 'fnctions': 'functions',
    'grpahs': 'graphs', 'grahping': 'graphing', 'gorups': 'groups', 'gropus': 'groups', 'imoprted': 'imported',
    'incldues': 'includes', 'incdlues': 'includes', 'inofrmational': 'informational', 'indpeendent': 'independent',
    'independantly': 'independently', 'inhertiance': 'inheritance', 'inhreits': 'inherits', 'intiialize': 'initialize',
    'isntance': 'instance', 'inteligence': 'intelligence', 'itnerface': 'interface', 'iteations': 'iterations',
    'itereations': 'iterations', 'itereators': 'iterators', 'iteators': 'iterators', 'lsitener': 'listener',
    'manfacturer': 'manufacturer', 'mathamatics': 'mathematics', 'mathmatical': 'mathematical', 'moduels': 'modules',
    'mltithreaded': 'multithreaded', 'mjultithreaded': 'multithreaded', 'nerual': 'neural', 'northwsetern': 'northwestern',
    'ojbects': 'objects', 'opeational': 'operational', 'operaetional': 'operational', 'opeators': 'operators',
    'opeartors': 'operators', 'otuputs': 'outputs', 'packtes': 'packets', 'pareamters': 'parameters',
    'paraemters': 'parameters', 'parameers': 'parameters', 'parmaeters': 'parameters', 'aprameters': 'parameters',
    'paramters': 'parameters', 'partitons': 'partitions', 'persitent': 'persistent', 'persepctive': 'perspective',
    'pidgeonhole': 'pigeonhole', 'poitners': 'pointers', 'pwoershell': 'powershell', 'pritnln': 'println',
    'priveleges': 'privileges', 'priviledges': 'privileges', 'probelms': 'problems', 'problmes': 'problems',
    'prblems': 'problems', 'prgoramming': 'programming', 'prtoocols': 'protocols', 'pesudocode': 'pseudocode',
    'queyring': 'querying', 'qustions': 'questions', 'quetions': 'questions', 'qiucksort': 'quicksort',
    'refernces': 'references', 'registsers': 'registers', 'rmeoved': 'removed', 'reuqires': 'requires',
    'requriement': 'requirement', 'requreiment': 'requirement', 'requiers': 'requires', 'reuslts': 'results',
    'resluts': 'results', 'rigthVarName': 'rightVarName', 'saefty': 'safety', 'scheudled': 'scheduled',
    'scritped': 'scripted', 'sripting': 'scripting', 'sritped': 'scripted', 'scirpted': 'scripted', 'seraching': 'searching',
    'seperate': 'separate', 'signlaing': 'signaling', 'sproadically': 'sporadically', 'std:;string': 'std::string',
    'sdt::list': 'std::list', 'sdt:;set': 'std::set', 'stD::sort': 'std::sort', 'srings': 'strings', 'stirngName': 'stringName',
    'subseuqently': 'subsequently', 'sucessful': 'successful', 'sueprclass': 'superclass', 'synchornous': 'synchronous',
    'sytsemic': 'systemic', 'thoguhtful': 'thoughtful', 'trnasformed': 'transformed', 'transiitively': 'transitively',
    'trucated': 'truncated', 'udnerstand': 'understand', 'unorderdMap': 'unorderedMap', 'unordrerdMap': 'unorderedMap',
    'udpated': 'updated', 'upadted': 'updated', 'vlaues': 'values', 'avlues': 'values', 'vluaes': 'values', 'valeus': 'values',
    'vareiables': 'variables', 'varibales': 'variables', 'viistor': 'visitor', 'wieghted': 'weighted', 'owrkflows': 'workflows',
    'wirter': 'writer', 'yeidled': 'yielded', 'yeilds': 'yields', 'yoruself': 'yourself', 'techinque': 'technique',
    'tehcnology': 'technology', 'indistniguishable': 'indistinguishable', 'repostiroy': 'repository', 'yorus': 'yours',
    'repositoroies': 'repositories', 'reposistory': 'repository', 'reopsitories': 'repositories', 'repositroy': 'repository',
    'Wriet-Output': 'Write-Output', 'wrietr': 'writer', 'lwoercase': 'lowercase', 'alhpanumeric': 'alphanumeric',
    'allphabet': 'alphabet', 'isntructions': 'instructions'
}

if __name__ == '__main__':
    unittest.main()
