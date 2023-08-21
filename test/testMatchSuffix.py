import unittest
from Rule import Rule

# ex:: ":C?:bilty::bility"
class TestMatchPrefix(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        file = 'AutocorrectForDevelopers.ahk'
        self.rules = Rule.fileToRuleList(file)

        suffixRules = [rule for rule in self.rules if rule.suffixMatch]
        self.suffixRuleList = [rule.oldText for rule in suffixRules]

    def test_ruleLength(self):
        self.assertTrue(len(self.rules) > 900)
        self.assertTrue(len(self.suffixRuleList) > 90)

    def test_replace(self):
        hasEndChar = True
        for inputText in self.suffixRuleList:
            # suffix rules need a prefix which isn't whitelisted
            inputText = 'prefix' + inputText

            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
            self.assertFalse(rule.prefixMatch)
            self.assertTrue(rule.suffixMatch)
            self.assertTrue(rule.caseSensitive)

        # suffix rules are NOT autocorrected unless they have an end char
        hasEndChar = False
        for inputText in self.suffixRuleList:
            # suffix rules need a prefix which isn't whitelisted
            inputText = 'prefix' + inputText

            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

if __name__ == '__main__':
    unittest.main()
