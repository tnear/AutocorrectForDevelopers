import unittest
from Rule import Rule

class TestMatchNone(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 3400)
        self.assertGreater(len(MATCH_NONE_LIST), 60)

    def test_replace(self):
        for inputText in MATCH_NONE_LIST:
            newText, rule, _ = Rule.getReplacementText(self.rules, inputText, True)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

# words which should not be changed by AHK (but are NOT whitelisted)
MATCH_NONE_LIST = [
    'valid', 'firmwaer', 'FRO', 'ITN', 'INOT', 'LINUX', 'NTO', 'SIE_T', 'SIZET', 'SIZE_T', 'SIZE-T',
    'WSA', 'YUO', 'JAVAScritp', 'std::', 'MKAE_', 'AMKE_', 'PyThOn', 'overidealize',
    'overidentify', 'ADN', 'NAD', 'HTE', 'TEH', 'CNA', 'HSA', 'hwo', 'quantitiy', # incorrectly converted to 'quantiity'
    'OFR', 'Push+Back', 'STD:;', 'SDT::', 'SDT:;', 'STD;:', 'code', 'doesnt', # interferes with "doesnt'"
    'end', 'Pop+Back', 'CAES', 'MAEK_', 'Grammer', 'APGE', 'forsome', 'cant', 'ZEOR', 'AUOT', 'ONDE', 'SendInput',
    'exponentiation', 'ISZE', 'ILNE', 'Fales', 'complier', 'hwo', # ambiguous between 'who' and 'how'
    'from', 'form', 'Alvie', 'Horus', 'triangle', 'highlighting', 'sightings', 'braek', # break/brake
    'fro', 'Then', 'Shatner', 'escond', 'halted', 'lien', 'spraed', # spread/spared
]

if __name__ == '__main__':
    unittest.main()
