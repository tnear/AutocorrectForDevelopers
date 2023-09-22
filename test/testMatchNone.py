import unittest
from Rule import Rule

class TestMatchNone(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 2000)
        self.assertGreater(len(MATCH_NONE_LIST), 50)

    def test_replace(self):
        for inputText in MATCH_NONE_LIST:
            newText, rule = Rule.getReplacementText(self.rules, inputText, True)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

# words which should not be changed by AHK (but are NOT whitelisted)
MATCH_NONE_LIST = [
    'valid', 'firmwaer', 'FRO', 'ITN', 'INOT', 'LINUX', 'NTO', 'SIE_T', 'SIZET', 'SIZE_T', 'SIZE-T',
    'TYPENAEM', 'TYEPOF', 'WSA', 'YUO', 'JAVAScritp', 'std::', 'MKAE_', 'AMKE_', 'PyThOn', 'overidealize',
    'overidentify', 'ADN', 'NAD', 'HTE', 'TEH', 'CNA', 'HSA', 'hwo', 'quantitiy', # incorrectly converted to 'quantiity'
    'OFR', 'Push+Back', 'STD:;', 'SDT::', 'SDT:;', 'STD;:', 'code', 'doesnt', # interferes with "doesnt'"
    'end', 'Pop+Back', 'CAES', 'MAEK_', 'Grammer', 'APGE', 'forsome', 'cant', 'ZEOR', 'AUOT', 'ONDE', 'SendInput',
    'exponentiation', 'ISZE', 'ELFT', 'ILNE', 'fiel', 'hwo', # ambiguous between 'who' and 'how'
]

if __name__ == '__main__':
    unittest.main()
