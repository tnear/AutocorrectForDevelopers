import unittest
import Rule

class TestMatchExact(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        file = 'AutocorrectForDevelopers.ahk'
        self.RULES = Rule.Rule.fileToRuleList(file)

    def test_ruleLength(self):
        self.assertTrue(len(self.RULES) > 900)

    def test_replace(self):
        hasEndChar = True
        for inputText in MATCH_EXACT_LIST:
            newText, rule = Rule.Rule.getReplacementText(self.RULES, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)

        hasEndChar = False
        for inputText in MATCH_EXACT_LIST:
            newText, _ = Rule.Rule.getReplacementText(self.RULES, inputText, hasEndChar)
            self.assertEqual(newText, inputText)

# ex:: "::abc::def"
MATCH_EXACT_LIST = [
    'abotu', 'activaet', 'adjacnecy'
]

if __name__ == '__main__':
    unittest.main()
