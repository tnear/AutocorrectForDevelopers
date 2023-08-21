import unittest
from Rule import Rule

# ex: ":b0:align::" whitelists 'align'
class TestMatchWhitelist(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        # get all rules
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        # get whitelist rules
        whitelistRules = [rule for rule in self.rules if rule.backspace]
        self.whitelistList = [text.oldText for text in whitelistRules]

    def test_ruleLength(self):
        # assert that 140+ tests are being run
        assert(len(self.rules) > 950)
        assert(len(self.whitelistList) > 140)
        assert(len(self.rules) > len(self.whitelistList))

    def test_replace(self):
        # whitelists rules are never autocorrected
        hasEndChar = True
        for inputText in self.whitelistList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, inputText)
            self.assertTrue(rule.backspace)
            self.assertFalse(rule.caseSensitive)

        hasEndChar = False
        for inputText in self.whitelistList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, inputText)
            self.assertTrue(rule.backspace)
            self.assertFalse(rule.caseSensitive)

if __name__ == '__main__':
    unittest.main()
