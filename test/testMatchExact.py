import unittest
from Rule import Rule

# ex: "::abc::def"
class TestMatchExact(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        exactMatchRules = [rule for rule in self.rules
                           if not rule.prefixMatch and not rule.suffixMatch and not rule.backspace and
                           not rule.caseSensitive and not rule.backspace]
        self.exactMatchList = [rule.oldText for rule in exactMatchRules]

    def test_ruleLength(self):
        self.assertGreater(len(self.rules), 2600)
        self.assertGreater(len(self.exactMatchList), 1600)

    def test_replace(self):
        hasEndChar = True
        for inputText in self.exactMatchList:
            # these rules are case insensitive, so test with a capital first letter
            inputText = inputText.capitalize()

            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)
            self.assertFalse(rule.prefixMatch)
            self.assertFalse(rule.suffixMatch)
            self.assertFalse(rule.backspace)

        # without ending char, these should not be replaced
        hasEndChar = False
        for inputText in self.exactMatchList:
            newText, rule = Rule.getReplacementText(self.rules, inputText, hasEndChar)
            self.assertEqual(newText, inputText)
            self.assertIsNone(rule)

    def test_explicit(self):
        for inputText, expectedText in EXPLICIT_TESTS.items():
            newText, rule = Rule.getReplacementText(self.rules, inputText, True)
            self.assertEqual(inputText, rule.oldText)
            self.assertEqual(expectedText, rule.newText)
            self.assertEqual(expectedText, newText)

# Explicitly test these pairs. Usually this is done for bug fixes
EXPLICIT_TESTS = {
    'apges': 'pages',
}

if __name__ == '__main__':
    unittest.main()
