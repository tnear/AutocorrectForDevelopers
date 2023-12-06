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
        # assert that many tests are being run
        self.assertGreater(len(self.rules), 2100)
        self.assertGreater(len(self.whitelistList), 240)

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

    def test_whitelistExplicit(self):
        for inputText in WHITELIST:
            newText, rule = Rule.getReplacementText(self.rules, inputText, True)
            # backspace rules preserve the original text
            self.assertEqual(newText, inputText)
            self.assertTrue(rule.backspace)

# explicit tests for whitelisted words (usually as part of bug fixes)
WHITELIST = [
    'systemdesign', 'keyforeign', 'beign', 'itme',
    'assign', 'assigns', 'redesigns', 'misalign', 'misaligns', 'foreigns', 'pairpartner',
    'pairpartners', 'variableassign',
]

if __name__ == '__main__':
    unittest.main()
