import unittest
from Rule import Rule

# ex: ":b0:align::" whitelists 'align'
class TestMatchWhitelist(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        # get all rules
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        # get whitelist rules
        whitelistRules = [rule for rule in self.rules if rule.backspace and not rule.containsBackspacing]
        self.whitelistList = [text.oldText for text in whitelistRules]

    def test_ruleLength(self):
        # assert that many tests are being run
        self.assertGreater(len(self.rules), 5100)
        self.assertGreater(len(self.whitelistList), 500)

    def test_replace(self):
        # whitelists rules are never autocorrected
        startIdx = 0
        hasEndChar = True
        for inputText in self.whitelistList:
            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, inputText)
            self.assertTrue(rule.backspace)
            self.assertFalse(rule.caseSensitive)

        startIdx = 0
        hasEndChar = False
        for inputText in self.whitelistList:
            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, inputText)
            self.assertTrue(rule.backspace)
            self.assertFalse(rule.caseSensitive)

    def test_whitelistExplicit(self):
        for inputText in WHITELIST:
            newText, rule, _ = Rule.getReplacementText(self.rules, inputText, True)
            self.assertIsNotNone(rule, f'Could not find whitelist rule for "{inputText}"')
            # backspace rules preserve the original text
            self.assertEqual(newText, inputText)
            self.assertTrue(rule.backspace)

    def test_whitelistSorted(self):
        # list of suffixes which have at least one word
        suffixesWithWords = {
            'atro', 'dign', 'dner', 'dners', 'dres', 'eint', 'laize', 'lign', 'ligns', 'nace', 'naces',
            'nices', 'nign', 'ntae', 'otins', 'otry', 'ouis', 'raes', 'roed', 'rued', 'sign', 'sino', 'sinos',
            'soed', 'taul', 'tino', 'tinos', 'tued', 'utre', 'utred', 'utres',
        }

        # filter suffixes plus rules which end with them
        def shouldInclude(text):
            return text not in suffixesWithWords and not any(text.endswith(suffix) for suffix in suffixesWithWords)

        originalWhitelist = [text for text in self.whitelistList if shouldInclude(text)]

        # sort the whitelist then ensure it matches the order in the script
        sortedWhitelist = sorted(originalWhitelist)

        for original, sortedItem in zip(originalWhitelist, sortedWhitelist):
            self.assertEqual(original, sortedItem, f'Found unsorted whitelist rule: "{original}" should be after "{sortedItem}"')

# explicit tests for whitelisted words (usually as part of bug fixes)
WHITELIST = [
    'systemdesign', 'itme', 'assign', 'misalign', 'misaligns', 'variableassign',
    'gardner', 'gardners', 'cupertino', 'snig', 'fomr', # from/form
    'ligns', 'realigns',
]

if __name__ == '__main__':
    unittest.main()
