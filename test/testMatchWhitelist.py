import unittest
import Rule

class TestMatchWhitelist(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        file = 'AutocorrectForDevelopers.ahk'
        self.RULES = Rule.Rule.fileToRuleList(file)

    def test_replace(self):
        hasEndChar = True
        for inputText in MATCH_WHITELIST_LIST:
            newText, rule = Rule.Rule.getReplacementText(self.RULES, inputText, hasEndChar)
            self.assertEqual(newText, inputText)
            self.assertTrue(rule, rule.backspace)

        hasEndChar = False
        for inputText in MATCH_WHITELIST_LIST:
            newText, rule = Rule.Rule.getReplacementText(self.RULES, inputText, hasEndChar)
            self.assertEqual(newText, inputText)
            self.assertTrue(rule, rule.backspace)

# ex: ":b0:atie::"
MATCH_WHITELIST_LIST = [
    'atie', 'catie'
]

if __name__ == '__main__':
    unittest.main()
