import unittest
from Rule import Rule

class TestMatchNone(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 5200)
        self.assertGreater(len(MATCH_NONE_LIST), 90)

    def test_replace(self):
        for inputText in MATCH_NONE_LIST:
            newText, rule, _ = Rule.getReplacementText(self.rules, inputText, True)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

# words which should not be changed by AHK (but are NOT whitelisted)
MATCH_NONE_LIST = [
    'valid', 'FRO', 'ITN', 'INOT', 'NTO', 'SIE_T', 'SIZET', 'SIZE_T', 'SIZE-T',
    'WSA', 'YUO', 'JAVAScritp', 'std::', 'MKAE_', 'AMKE_', 'PyThOn', 'overidealize',
    'overidentify', 'ADN', 'NAD', 'HTE', 'TEH', 'CNA', 'HSA', 'quantitiy', # incorrectly converted to 'quantiity'
    'OFR', 'Push+Back', 'STD:;', 'SDT::', 'SDT:;', 'STD;:', 'code', 'doesnt', # interferes with "doesnt'"
    'end', 'Pop+Back', 'CAES', 'MAEK_', 'Grammer', 'APGE', 'forsome', 'cant', 'ZEOR', 'AUOT', 'ONDE', 'SendInput',
    'exponentiation', 'ISZE', 'ILNE', 'Fales', 'complier', 'hwo', # ambiguous between 'who' and 'how'
    'from', 'form', 'Alvie', 'Horus', 'triangle', 'highlighting', 'sightings',
    'fro', 'Then', 'Shatner', 'escond', 'halted', 'lien', 'rootin', 'have OT', 'spraed', # spread/spared
    'falte', 'baltes', 'hadnet', 'wordnets', 'yuo', 'Yuo', 'Gorup', 'bahs', 'clas', 'fiel', 'moer', 'rela',
    'saem', 'ture', 'nto', 'allWords', 'Stroe', 'keyforeign', 'beign', 'assigns', 'redesigns', 'foreigns',
    'moriarty', 'ign', 'bailly', 'motley', # 'tley::tely' requires too many whitelists
    'yoruba', 'konway', 'sign', 'design', 'systemdesign', 'assign', 'variableassign', 'changin', # changin'
    'ehre', 'botnet', 'cadres', 'impot', 'impots', 'loggin', # loggin'
    'hearte', 'lighthearted', 'netly', # netly -> ently often changes one typo into another typo
]

if __name__ == '__main__':
    unittest.main()
