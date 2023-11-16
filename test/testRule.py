import unittest
from Rule import Rule
import string

class TestRule(unittest.TestCase):

    def test_file(self):
        lines = Rule.cleanFile('AutocorrectForDevelopers.ahk')
        self.assertTrue(all([line.startswith(':') for line in lines]))

    def test_getOptionsText(self):
        opts = Rule.getOptionsText('::abc::def')
        self.assertEqual(opts, '::')

        opts = Rule.getOptionsText(':C:abc::def')
        self.assertEqual(opts, ':C:')

        opts = Rule.getOptionsText(':C?:abc::def')
        self.assertEqual(opts, ':C?:')

        opts = Rule.getOptionsText(':*C:abc::def')
        self.assertEqual(opts, ':*C:')

    def test_getOldText(self):
        oldText = Rule.getOldText('::abc::def')
        self.assertEqual(oldText, 'abc')

        oldText = Rule.getOldText(':b0:ABC::')
        self.assertEqual(oldText, 'ABC')

        oldText = Rule.getOldText(':C*:yz::123')
        self.assertEqual(oldText, 'yz')

        # should remove escape char, `
        oldText = Rule.getOldText(':C*:std:`;::std`:`:')
        self.assertEqual(oldText, 'std:;')

    def test_getNewText(self):
        newText = Rule.getNewText('::abc::def')
        self.assertEqual(newText, 'def')

        newText = Rule.getNewText(':b0:ABC::')
        self.assertEqual(newText, '')

        newText = Rule.getNewText(':C*:yz::123')
        self.assertEqual(newText, '123')

        # should remove escape char, `
        newText = Rule.getNewText(':C*:std:`;::std`:`:')
        self.assertEqual(newText, 'std::')

        # should delimit on first unescaped '::'
        newText = Rule.getNewText(':C*:sdt`:`:::std`:`:')
        self.assertEqual(newText, 'std::')

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
            self.assertTrue(all(char in string.printable for char in line)), 'Only printable characters supported'

    def test_endingChars(self):
        fileName = Rule.getRelativeFileName('AutocorrectForDevelopers.ahk')

        with open(fileName) as f:
            lines = [line.strip('\n ') for line in f]

        lines = [line for line in lines if line.startswith('#Hotstring EndChars')]
        self.assertEqual(len(lines), 1)

        # the chars '<' and '>' are non-default ending characters
        self.assertTrue(lines[0].endswith('-()[]{}:;\'"/\\,.?!`n `t<>'))

    def test_allRulesMustChangeText(self):
        # prevents a rule where oldText equals newText (causes unnecessary flicker)
        rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        for rule in rules:
            self.assertNotEqual(rule.oldText, rule.newText, f'Failed for {rule.newText}')
            self.assertNotEqual(rule.oldText, '')

    def test_noMultiLineComments(self):
        file = Rule.getRelativeFileName('AutocorrectForDevelopers.ahk')
        with open(file) as f:
            lines = [line.strip('\n ') for line in f]

        # for now, only single line comments (';') are supported
        # this is to ensure that every line is self-contained
        for line in lines:
            self.assertNotIn('/*', line)
            self.assertNotIn('*/', line)

    def test_replacePreserveCase(self):
        oldText = 'wriet'
        newText =  'write'

        inputText = 'Wriet-Output'
        replacedText = Rule._replacePreserveCase(inputText, oldText, newText)
        self.assertEqual(replacedText, 'Write-Output')

        inputText = 'WrIet-Output'
        replacedText = Rule._replacePreserveCase(inputText, oldText, newText)
        self.assertEqual(replacedText, 'WrIte-Output')

    def test_uniqueRules(self):
        # no rule lhs should appear more than once
        rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        # get all rules except whitelisted and suffixes because those can also appear in the main section
        oldTextList = [rule.oldText for rule in rules if not rule.backspace and not rule.suffixMatch]

        # verify no duplicate LHS rules
        seen = set()
        duplicates = set()
        for item in oldTextList:
            if item in seen:
                duplicates.add(item) # seen before, add to duplicate list
            seen.add(item)

        assert len(duplicates) == 0, f'Found duplicate elements: {duplicates}'

    def test_braceEscape(self):
        # {} should be removed from RHS
        rule = Rule.lineToRule(':C:#Pragma::{#}pragma')
        self.assertEqual(rule.newText, '#pragma')

    def test_whitelistShortLetterRules(self):
        # short rules should be kept to a minimum because they often conflict with acronyms
        rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

        # remove whitelist rule (zero-length replacement text)
        replacementRules = [rule for rule in rules if not rule.backspace]

        # get short rules (length < 3)
        shortLen = 3
        shortRules = [rule for rule in replacementRules if len(rule.newText) <= shortLen]

        # convert rule into lowercase replacement text
        text = [rule.newText.lower() for rule in shortRules]

        # get unique text
        text = set(text)

        # check that all short rules are in this whitelist
        whitelist = ['and', 'ing', 'can', "i'd", 'the', 'was', 'for', 'you', 'int', 'has',
                     'end', "i'm", 'not', 'but', 'who', 'how', 'why']
        for rule in text:
            assert rule in whitelist, f'Found short rule not in whitelist: "{rule}"'

if __name__ == '__main__':
    unittest.main()
