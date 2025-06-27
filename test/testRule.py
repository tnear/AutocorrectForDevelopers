import unittest
from Rule import Rule
import string

class TestRule(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

    def test_file(self):
        lines = Rule.cleanFile('AutocorrectForDevelopers.ahk')
        self.assertTrue(all(line.startswith(':') for line in lines))

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

        with open(fileName, encoding='utf-8') as f:
            lines = [line.strip() for line in f]

        for line in lines:
            self.assertTrue(all(char in string.printable for char in line), 'Only printable characters supported')

    def test_endingChars(self):
        fileName = Rule.getRelativeFileName('AutocorrectForDevelopers.ahk')

        with open(fileName, encoding='utf-8') as f:
            lines = [line.strip() for line in f]

        lines = [line for line in lines if line.startswith('#Hotstring EndChars')]
        self.assertEqual(len(lines), 1)

        # the chars after '`n' below are added by AutocorrectForDevelopers
        self.assertTrue(lines[0].endswith('-()[]{}:;\'"/\\,.?!`n `t<>*``=&|_+@#'))

    def test_allRulesMustChangeText(self):
        # prevents a redundant rule where oldText equals newText (causes unnecessary flicker)
        for rule in self.rules:
            self.assertNotEqual(rule.oldText, rule.newText, f'Failed for {rule.newText}')
            self.assertNotEqual(rule.oldText, '')

    def test_noMultiLineComments(self):
        file = Rule.getRelativeFileName('AutocorrectForDevelopers.ahk')
        with open(file, encoding='utf-8') as f:
            lines = [line.strip() for line in f]

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
        # get all rules except whitelisted and suffixes because those can also appear in the main section
        oldTextList = [rule.oldText for rule in self.rules if not rule.backspace and not rule.suffixMatch]

        # verify no duplicate LHS rules
        seen = set()
        duplicates = set()
        for item in oldTextList:
            if item in seen:
                duplicates.add(item) # seen before, add to duplicate list
            seen.add(item)

        self.assertEqual(duplicates, set(), f'Found duplicate elements: {duplicates}')

    def test_braceEscape(self):
        # {} should be removed from RHS
        rule = Rule.lineToRule(':C:#Pragma::{#}pragma')
        self.assertEqual(rule.newText, '#pragma')

    def test_trailingSpace(self):
        rule = Rule.lineToRule(':*:retur n::return `')
        self.assertEqual(rule.newText, 'return ')

    # prevent typos of form: '::isseu:::issue' where there is an extra colon
    def test_noExtraColon(self):
        colonRules = [rule for rule in self.rules if rule.oldText.startswith(':') or rule.newText.startswith(':')]
        for colonRule in colonRules:
            self.assertTrue(colonRule.oldText.startswith(':') and colonRule.newText.startswith(':'))

    # ensures that rules are in sorted order. this isn't strictly necessary,
    # but does allow for additional performance optimizations and makes
    # easy-to-find locations to insert new rules in the script
    def test_sortedRules(self):
        # group the non-suffix and suffix rules in the script
        nonSuffixRules, suffixRules = partitionRules(self.rules)
        sortedNonSuffixRules, sortedSuffixRules = sortRules(self.rules)

        for original, sortedItem in zip(nonSuffixRules, sortedNonSuffixRules):
            msg = f'Unsorted suffix rule: "{original.newText}" should be after "{sortedItem.newText}"'
            self.assertEqual(original.newText, sortedItem.newText, msg)

        for original, sortedItem in zip(suffixRules, sortedSuffixRules):
            msg = f'Unsorted suffix rule: "{original.newText}" should be after "{sortedItem.newText}"'
            self.assertEqual(original.newText, sortedItem.newText, msg)

    def test_all_short_rules_are_case_sensitive(self):
        # to minimize chance of false positives, short rules should be case sensitive
        replacement_rules = [rule for rule in self.rules if not rule.backspace]

        # get short rules
        min_len = 3
        short_rules = [rule for rule in replacement_rules if len(rule.oldText) <= min_len]
        assert len(short_rules) > 1

        whitelist = ["i'd", "i'm"]

        for rule in short_rules:
            if rule.newText not in whitelist:
                self.assertTrue(rule.caseSensitive, f'Short rule "{rule.newText}" should be case sensitive')

def partitionRules(rules: list):
    # 1. non-suffix rules, 2. suffix rules
    nonSuffixRules = [rule for rule in rules if not rule.backspace and not rule.suffixMatch]
    suffixRules = [rule for rule in rules if rule.suffixMatch]
    return nonSuffixRules, suffixRules

def sortRules(rules: list):
    nonSuffixRules, suffixRules = partitionRules(rules)
    nonSuffixRules.sort(key = lambda rule: rule.newText.lower())
    suffixRules.sort(key = lambda rule: rule.newText.lower())
    return nonSuffixRules, suffixRules

if __name__ == '__main__':
    unittest.main()
