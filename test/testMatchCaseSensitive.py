import unittest
from Rule import Rule

class TestMatchCaseSensitive(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        caseSensitiveRules = [rule for rule in self.rules if rule.caseSensitive and not rule.suffixMatch]
        caseSensitiveNoPrefix = [rule for rule in caseSensitiveRules if not rule.prefixMatch]
        caseSensitivePrefix = [rule for rule in caseSensitiveRules if rule.prefixMatch]
        self.caseSensitiveNoPrefixList = [rule.oldText for rule in caseSensitiveNoPrefix]
        self.caseSensitivePrefixList = [rule.oldText for rule in caseSensitivePrefix]

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 1000)
        self.assertGreater(len(self.caseSensitiveNoPrefixList), 30)
        self.assertGreater(len(self.caseSensitivePrefixList), 6)

    # ex: ":C:itn::int"
    def test_noPrefixMatch(self):
        hasEndChar = True
        for inputText in self.caseSensitiveNoPrefixList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.caseSensitive)
            self.assertFalse(rule.prefixMatch)

        # non-prefix rules need an ending character
        hasEndChar = False
        for inputText in self.caseSensitiveNoPrefixList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

    # ex: ":C*:mkae_::make_"
    def test_prefixMatch(self):
        hasEndChar = True
        for inputText in self.caseSensitivePrefixList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.caseSensitive)
            self.assertTrue(rule.prefixMatch)

        # prefix rules do not need an ending character
        hasEndChar = False
        for inputText in self.caseSensitivePrefixList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.caseSensitive)
            self.assertTrue(rule.prefixMatch)

if __name__ == '__main__':
    unittest.main()
