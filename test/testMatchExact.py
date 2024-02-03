import unittest
from Rule import Rule

# ex: "::abc::def"
class TestMatchExact(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        self.exactMatchRules = [rule for rule in self.rules
                           if not rule.prefixMatch and not rule.suffixMatch and not rule.backspace and
                           not rule.caseSensitive and not rule.backspace]
        self.exactMatchList = [rule.oldText for rule in self.exactMatchRules]

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 3600)
        self.assertGreater(len(self.exactMatchList), 2300)

    def test_replace(self):
        hasEndChar = True
        startIdx = 0
        for inputText in self.exactMatchList:
            # these rules are case insensitive, so test with a capital first letter
            inputText = inputText.capitalize()

            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, rule.newText)
            self.assertFalse(rule.prefixMatch)
            self.assertFalse(rule.suffixMatch)
            self.assertFalse(rule.backspace)

        # without ending char, these should not be replaced
        hasEndChar = False
        startIdx = 0
        for inputText in self.exactMatchList:
            newText, rule, startIdx = Rule.getReplacementText(self.rules, inputText, hasEndChar, startIdx)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

    def test_explicit(self):
        for inputText, expectedText in EXPLICIT_TESTS.items():
            newText, rule, _ = Rule.getReplacementText(self.rules, inputText, True)
            self.assertEqual(inputText, rule.oldText)
            self.assertEqual(expectedText, rule.newText)
            self.assertEqual(expectedText, newText)

    # tool to find most common suffixes which get autocorrected
    def test_mostCommonSuffixes(self):
        suffixes = {}
        suffixLen = 4
        for rule in self.exactMatchRules:
            if len(rule.oldText) < suffixLen or len(rule.newText) < suffixLen:
                continue # does not have enough characters

            # get each suffix
            oldSuffix = rule.oldText[-suffixLen:]
            newSuffix = rule.newText[-suffixLen:]

            # check if the rule changes the suffix
            if oldSuffix != newSuffix:
                # if so, increment its count
                if oldSuffix not in suffixes:
                    suffixes[oldSuffix] = 0
                suffixes[oldSuffix] += 1

        # sort by values (most common suffixes)
        sortedSuffixes = sorted(suffixes.items(), key=lambda item: item[1], reverse=True)

        # ignore these whitelisted suffixes
        whitelist = ['tner', 'ners', 'raed']
        sortedSuffixes = [x for x in sortedSuffixes if x[0] not in whitelist]

        # ensure the most common suffix is below some threshold. If this asserts, then
        # there is likely a missing suffix rule
        assert sortedSuffixes[0][1] <= 8, f'Check if suffix "{sortedSuffixes[0][0]}" needs a suffix rule'

# Explicitly test these pairs. Although every rule is iterated over automatically,
# this section is useful for bug fixes to ensure the behavior does not regress.
EXPLICIT_TESTS = {
    'apges': 'pages', 'somehting': 'something', 'thraed': 'thread', 'declraed': 'declared', 'piotn': 'point',
    'piotns': 'points', 'breakpiotn': 'breakpoint',
}

if __name__ == '__main__':
    unittest.main()
