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
        self.assertTrue(len(self.rules) > 900)
        self.assertTrue(len(self.exactMatchList) > 520)

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

if __name__ == '__main__':
    unittest.main()
