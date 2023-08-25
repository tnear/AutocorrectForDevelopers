import unittest
from Rule import Rule
import string

class TestRule(unittest.TestCase):

    def test_file(self):
        lines = Rule.cleanFile('AutocorrectForDevelopers.ahk')
        self.assertTrue(all([line.startswith(':') for line in lines]))

    def test_getOptionsText(self):
        opts = Rule.getOptionsText('::abc::def')
        assert opts == '::'

        opts = Rule.getOptionsText(':C:abc::def')
        assert opts == ':C:'

        opts = Rule.getOptionsText(':C?:abc::def')
        assert opts == ':C?:'

        opts = Rule.getOptionsText(':*C:abc::def')
        assert opts == ':*C:'

    def test_getOldText(self):
        oldText = Rule.getOldText('::abc::def')
        assert oldText == 'abc'

        oldText = Rule.getOldText(':b0:ABC::')
        assert oldText == 'ABC'

        oldText = Rule.getOldText(':C*:yz::123')
        assert oldText == 'yz'

        # should remove escape char, `
        oldText = Rule.getOldText(':C*:std:`;::std`:`:')
        assert oldText == 'std:;'

    def test_getNewText(self):
        newText = Rule.getNewText('::abc::def')
        assert newText == 'def'

        newText = Rule.getNewText(':b0:ABC::')
        assert newText == ''

        newText = Rule.getNewText(':C*:yz::123')
        assert newText == '123'

        # should remove escape char, `
        newText = Rule.getNewText(':C*:std:`;::std`:`:')
        assert newText == 'std::'

        # should delimit on first unescaped '::'
        newText = Rule.getNewText(':C*:sdt`:`:::std`:`:')
        assert newText == 'std::'

    def test_lineToRule(self):
        rule = Rule.lineToRule('::abc::def')
        self.assertFalse(rule.backspace)
        self.assertFalse(rule.caseSensitive)
        self.assertEqual(rule.line, '::abc::def')
        self.assertFalse(rule.prefixMatch)
        self.assertFalse(rule.suffixMatch)
        self.assertEqual(rule.oldText, 'abc')
        self.assertEqual(rule.newText, 'def')

        rule = Rule.lineToRule(':b0:abc::')
        self.assertTrue(rule.backspace)
        self.assertFalse(rule.caseSensitive)
        self.assertFalse(rule.prefixMatch)
        self.assertFalse(rule.suffixMatch)
        self.assertEqual(rule.oldText, 'abc')
        self.assertEqual(rule.newText, '')

        rule = Rule.lineToRule(':C*:abcd::123')
        self.assertFalse(rule.backspace)
        self.assertTrue(rule.caseSensitive)
        self.assertTrue(rule.prefixMatch)
        self.assertFalse(rule.suffixMatch)
        self.assertEqual(rule.oldText, 'abcd')
        self.assertEqual(rule.newText, '123')

        rule = Rule.lineToRule(':C?:std:`;::std`:`:')
        self.assertFalse(rule.backspace)
        self.assertTrue(rule.caseSensitive)
        self.assertFalse(rule.prefixMatch)
        self.assertTrue(rule.suffixMatch)
        self.assertEqual(rule.oldText, 'std:;')
        self.assertEqual(rule.newText, 'std::')

    # non-printable characters are not text editor-friendly
    def test_printableCharacters(self):
        fileName = Rule.getRelativeFileName('AutocorrectForDevelopers.ahk')

        with open(fileName) as f:
            lines = [line.strip('\n ') for line in f]

        for line in lines:
            self.assertTrue(all(char in string.printable for char in line)), 'Only printable character supported'

    def test_endingChars(self):
        fileName = Rule.getRelativeFileName('AutocorrectForDevelopers.ahk')

        with open(fileName) as f:
            lines = [line.strip('\n ') for line in f]

        lines = [line for line in lines if line.startswith('#Hotstring EndChars')]
        self.assertEqual(len(lines), 1)

        # the chars '<' and '>' and non-default ending characters and should be tested
        self.assertIn('<', lines[0])
        self.assertIn('>', lines[0])

    def test_allRulesMustChangeText(self):
        # prevents a rule where oldText -> oldText (no change but causes flicker)
        rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        for rule in rules:
            assert rule.oldText != rule.newText

    def test_noMultiLineComments(self):
        file = Rule.getRelativeFileName('AutocorrectForDevelopers.ahk')
        with open(file) as f:
            lines = [line.strip('\n ') for line in f]

        # for now, only single line comments (';') are supported
        for line in lines:
            self.assertNotIn('/*', line)
            self.assertNotIn('*/', line)

    def test_replacePreserveCase(self):
        oldText = 'wriet'
        newText =  'write'

        inputText = 'Wriet-Output'
        replacedText = Rule._replacePreserveCase(inputText, oldText, newText)
        assert replacedText == 'Write-Output'

        inputText = 'WrIet-Output'
        replacedText = Rule._replacePreserveCase(inputText, oldText, newText)
        assert replacedText == 'WrIte-Output'

    def test_uniqueRules(self):
        # no rule lhs should appear more than once
        rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        # get all rules except whitelisted and suffixes because those can also appear in the main section
        oldTextList = [rule.oldText for rule in rules if not rule.backspace and not rule.suffixMatch]

        # verify no duplicates by using a set
        assert len(oldTextList) == len(set(oldTextList))

if __name__ == '__main__':
    unittest.main()
