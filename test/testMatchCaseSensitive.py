import unittest
from Rule import Rule

class TestMatchCaseSensitive(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        caseSensitiveRules = [rule for rule in self.rules if rule.caseSensitive and not rule.suffixMatch]
        self.caseSensitiveNoPrefixRules = [rule for rule in caseSensitiveRules if not rule.prefixMatch]
        caseSensitivePrefix = [rule for rule in caseSensitiveRules if rule.prefixMatch]
        self.caseSensitiveNoPrefixList = [rule.oldText for rule in self.caseSensitiveNoPrefixRules]
        self.caseSensitivePrefixList = [rule.oldText for rule in caseSensitivePrefix]

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 5200)
        self.assertGreater(len(self.caseSensitiveNoPrefixList), 160)
        self.assertGreater(len(self.caseSensitivePrefixList), 8)

    # ex: ":C:itn::int"
    def test_noPrefixMatch(self):
        startIdx = 0
        hasEndChar = True
        for inputText in self.caseSensitiveNoPrefixList:
            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.caseSensitive)
            self.assertFalse(rule.prefixMatch)

        # non-prefix rules need an ending character
        hasEndChar = False
        startIdx = 0
        for inputText in self.caseSensitiveNoPrefixList:
            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

    # ex: ":C*:mkae_::make_"
    def test_prefixMatch(self):
        startIdx = 0
        hasEndChar = True
        for inputText in self.caseSensitivePrefixList:
            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.caseSensitive)
            self.assertTrue(rule.prefixMatch)

        # prefix rules do not need an ending character
        startIdx = 0
        hasEndChar = False
        for inputText in self.caseSensitivePrefixList:
            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, rule.newText)
            self.assertTrue(rule.caseSensitive)
            self.assertTrue(rule.prefixMatch)

    # verify that no rules with capital letters have a forgotten case sensitive flag,
    # ex: '::THen::Then' should be case sensitive => ':C:THen::Then'
    def test_capitalizedRulesAreCaseSensitive(self):
        capitalRules = [rule for rule in self.rules if rule.oldTextLower != rule.oldText]
        self.assertTrue(len(capitalRules) > 64)
        for rule in capitalRules:
            self.assertTrue(rule.caseSensitive, f'The rule "{rule.oldText}" should be made case sensitive')

    # verify that the number if capital letters in a case sensitive rule is
    # changed by no more than 1. Ex: "NOt::not" would fail this test.
    def test_two_capital(self):
        for rule in self.caseSensitiveNoPrefixRules:
            num_upper_old = len([c for c in rule.oldText if c.isupper()])
            num_upper_new = len([c for c in rule.newText if c.isupper()])
            self.assertLessEqual(abs(num_upper_old - num_upper_new), 1,
                f'Rule "{rule.oldText}" has capitalization difference of 2+ letters');

            if rule.oldText[0].isupper():
                # detect probable issue where the first capital letter is made
                # lowercase, ex: ':C:Teh::the' (should correct to 'The')
                self.assertGreaterEqual(num_upper_new, 1,
                    f'Case sensitive rule "{rule.oldText}" removes all capital letters.')

if __name__ == '__main__':
    unittest.main()
