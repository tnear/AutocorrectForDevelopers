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

if __name__ == '__main__':
    unittest.main()
