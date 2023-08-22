import unittest
from Rule import Rule

class TestMatchNone(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        file = 'AutocorrectForDevelopers.ahk'
        self.rules = Rule.fileToRuleList(file)

    def test_ruleLength(self):
        self.assertTrue(len(self.rules) > 900)
        self.assertTrue(len(MATCH_NONE_LIST) > 14)

    def test_replace(self):
        for inputText in MATCH_NONE_LIST:
            newText, rule = Rule.getReplacementText(self.rules, inputText, True)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

# words which should not be changed by AHK (but are NOT whitelisted)
MATCH_NONE_LIST = [
    'valid', 'firmwaer', 'FRO', 'ITN', 'INOT', 'LINUX', 'NTO', 'SIE_T', 'SIZET', 'SIZE_T', 'SIZE-T',
    'TYPENAEM', 'TYEPOF', 'WSA', 'YUO', 'JAVAScritp', 'std::', 'MKAE_', 'AMKE_', 'PyThOn'
]

if __name__ == '__main__':
    unittest.main()
