import unittest
import Rule

class TestRule(unittest.TestCase):

    def test_file(self):
        file = 'AutocorrectForDevelopers.ahk'
        lines = Rule.Rule.cleanFile(file)
        self.assertTrue(all([line.startswith(':') for line in lines]))

    def test_getOptionsText(self):
        opts = Rule.Rule.getOptionsText('::abc::def')
        assert opts == '::'

        opts = Rule.Rule.getOptionsText(':C:abc::def')
        assert opts == ':C:'

        opts = Rule.Rule.getOptionsText(':C?:abc::def')
        assert opts == ':C?:'

        opts = Rule.Rule.getOptionsText(':*C:abc::def')
        assert opts == ':*C:'

    def test_getOldText(self):
        oldText = Rule.Rule.getOldText('::abc::def')
        assert oldText == 'abc'

        oldText = Rule.Rule.getOldText(':b0:ABC::')
        assert oldText == 'ABC'

        oldText = Rule.Rule.getOldText(':C*:yz::123')
        assert oldText == 'yz'

        # should remove escape char, `
        oldText = Rule.Rule.getOldText(':C*:std:`;::std`:`:')
        assert oldText == 'std:;'

    def test_getNewText(self):
        newText = Rule.Rule.getNewText('::abc::def')
        assert newText == 'def'

        newText = Rule.Rule.getNewText(':b0:ABC::')
        assert newText == ''

        newText = Rule.Rule.getNewText(':C*:yz::123')
        assert newText == '123'

        # should remove escape char, `
        newText = Rule.Rule.getNewText(':C*:std:`;::std`:`:')
        assert newText == 'std::'

    def test_lineToRule(self):
        rule = Rule.Rule.lineToRule('::abc::def')
        self.assertFalse(rule.backspace)
        self.assertFalse(rule.caseSensitive)
        self.assertEqual(rule.line, '::abc::def')
        self.assertFalse(rule.prefixMatch)
        self.assertFalse(rule.suffixMatch)
        self.assertEqual(rule.oldText, 'abc')
        self.assertEqual(rule.newText, 'def')

        rule = Rule.Rule.lineToRule(':b0:abc::')
        self.assertTrue(rule.backspace)
        self.assertFalse(rule.caseSensitive)
        self.assertFalse(rule.prefixMatch)
        self.assertFalse(rule.suffixMatch)
        self.assertEqual(rule.oldText, 'abc')
        self.assertEqual(rule.newText, '')

        rule = Rule.Rule.lineToRule(':C*:abcd::123')
        self.assertFalse(rule.backspace)
        self.assertTrue(rule.caseSensitive)
        self.assertTrue(rule.prefixMatch)
        self.assertFalse(rule.suffixMatch)
        self.assertEqual(rule.oldText, 'abcd')
        self.assertEqual(rule.newText, '123')

        rule = Rule.Rule.lineToRule(':C?:std:`;::std`:`:')
        self.assertFalse(rule.backspace)
        self.assertTrue(rule.caseSensitive)
        self.assertFalse(rule.prefixMatch)
        self.assertTrue(rule.suffixMatch)
        self.assertEqual(rule.oldText, 'std:;')
        self.assertEqual(rule.newText, 'std::')

if __name__ == '__main__':
    unittest.main()
