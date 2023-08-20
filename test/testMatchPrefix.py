import unittest
import Rule

class TestMatchPrefix(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        file = 'AutocorrectForDevelopers.ahk'
        self.RULES = Rule.Rule.fileToRuleList(file)

    def test_replace(self):
        hasEndChar = True
        for inputText in MATCH_PREFIX_LIST:
            newText, rule = Rule.Rule.getReplacementText(self.RULES, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)

        hasEndChar = False
        for inputText in MATCH_PREFIX_LIST:
            newText, rule = Rule.Rule.getReplacementText(self.RULES, inputText, hasEndChar)
            self.assertEqual(newText, rule.newText)

# ex:: ":*:abc::def"
MATCH_PREFIX_LIST = [
    'abstarct', 'accomodat'
]

if __name__ == '__main__':
    unittest.main()
