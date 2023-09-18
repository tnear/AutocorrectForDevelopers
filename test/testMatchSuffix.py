import unittest
from Rule import Rule

# ex:: ":C?:bilty::bility"
class TestMatchPrefix(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        suffixRules = [rule for rule in self.rules if rule.suffixMatch]
        self.suffixRuleList = [rule.oldText for rule in suffixRules]

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 1000)
        self.assertGreater(len(self.suffixRuleList), 100)

    def test_replace(self):
        hasEndChar = True
        for inputText in self.suffixRuleList:
            # suffix rules need a prefix which isn't whitelisted
            inputText = 'prefix' + inputText

            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
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

    def test_noThreeLetterSuffixes(self):
        threeLetterSuffixes = [rule for rule in self.suffixRuleList if len(rule) <= 3]
        threeLetterSuffixes.sort()

        # permit only these 3-letter suffixes
        assert threeLetterSuffixes == ['ign', 'nig']

if __name__ == '__main__':
    unittest.main()
