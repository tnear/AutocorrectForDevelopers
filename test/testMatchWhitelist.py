import unittest
import collections
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
        self.assertGreater(len(self.rules), 5800)
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
        suffixes_with_words = get_suffixes_with_words(self.whitelistList)
        self.assertTrue(all(item in set(self.whitelistList) for item in suffixes_with_words))

        # filter suffixes plus rules which end with them
        originalWhitelist = get_suffixes_without_words(self.whitelistList)

        # sort the whitelist then ensure it matches the order in the script
        sortedWhitelist = sorted(originalWhitelist)

        for original, sortedItem in zip(originalWhitelist, sortedWhitelist):
            self.assertEqual(original, sortedItem,
                             f'Found unsorted whitelist rule: "{original}" should be after "{sortedItem}".')

    def test_all_whitelists_have_suffix_rules(self):
        # exclude whitelist rules which are part of words
        original_whitelist = get_suffixes_without_words(self.whitelistList)

        # ensure whitelist rules have a suffix rule
        suffix_rules = {rule.oldText for rule in self.rules if rule.suffixMatch and not rule.backspace}
        for whitelist_rule in original_whitelist:
            self.assertTrue(whitelist_rule in suffix_rules,
                            f'Unable to find a suffix rule for whitelisted "{whitelist_rule}"')

    def test_no_duplicate_whitelist_rules(self):
        duplicates = [item for item, count in collections.Counter(self.whitelistList).items() if count > 1]
        if duplicates:
            self.fail(f'Found duplicate whitelist rule "{duplicates[0]}"')

def get_suffixes_without_words(whitelist_list):
    suffixes_with_words = get_suffixes_with_words(whitelist_list)

    def shouldInclude(text):
        return text not in suffixes_with_words and not any(text.endswith(suffix) for suffix in suffixes_with_words)

    result = [text for text in whitelist_list if shouldInclude(text)]
    assert len(result) > 400
    return result

# ex: return 'abel' in list of ['abel', 'label', 'x']
# because "label" ends with "abel"
def get_suffixes_with_words(whitelist_list):
    result = []

    # sort shorter words first
    sorted_words = sorted(whitelist_list, key=len)

    for i, potential_suffix in enumerate(sorted_words):
        # only need to look after this index
        for word in sorted_words[i+1:]:
            if word.endswith(potential_suffix):
                result.append(potential_suffix)
                # can safely break after one match due to sorting by length
                break

    assert len(result) > 30
    return result

# explicit tests for whitelisted words (usually as part of bug fixes)
WHITELIST = [
    'itme', 'misalign', 'misaligns',
    'gardner', 'gardners', 'cupertino', 'snig', 'fomr', # from/form
    'ligns', 'realigns', 'mylabel', 'mylabels', 'neend',
]

if __name__ == '__main__':
    unittest.main()
