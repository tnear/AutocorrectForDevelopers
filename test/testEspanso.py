import unittest
import subprocess
import textwrap
from Rule import Rule

class TestEspanso(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

    def test_whitelist(self):
        firstWhitelistRule = [rule for rule in self.rules if rule.backspace][0]
        espansoRule = Rule.convertOneRuleToEspanso(firstWhitelistRule)

        expected = f'  - trigger: "{firstWhitelistRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstWhitelistRule.oldText}"\n'
        expected += Rule.yamlIndent + 'word: true\n'
        expected += Rule.yamlIndent + 'propagate_case: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_exactMatch(self):
        firstExactMatchRule = [rule for rule in self.rules if not rule.backspace and not rule.caseSensitive][0]
        espansoRule = Rule.convertOneRuleToEspanso(firstExactMatchRule)

        expected = f'  - trigger: "{firstExactMatchRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstExactMatchRule.newText}"\n'
        expected += Rule.yamlIndent + 'word: true\n'
        expected += Rule.yamlIndent + 'propagate_case: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_exactCaseSensitive(self):
        firstExactMatchRule = [rule for rule in self.rules if not rule.backspace][0]
        espansoRule = Rule.convertOneRuleToEspanso(firstExactMatchRule)

        expected = f'  - trigger: "{firstExactMatchRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstExactMatchRule.newText}"\n'
        expected += Rule.yamlIndent + 'word: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_prefixMatch(self):
        firstExactMatchRule = [rule for rule in self.rules if not rule.backspace and rule.prefixMatch][0]
        espansoRule = Rule.convertOneRuleToEspanso(firstExactMatchRule)

        expected = f'  - trigger: "{firstExactMatchRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstExactMatchRule.newText}"\n'
        expected += Rule.yamlIndent + 'left_word: true\n'
        expected += Rule.yamlIndent + 'propagate_case: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_suffixMatch(self):
        firstExactMatchRule = [rule for rule in self.rules if rule.suffixMatch and not rule.backspace][0]
        espansoRule = Rule.convertOneRuleToEspanso(firstExactMatchRule)

        expected = f'  - trigger: "{firstExactMatchRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstExactMatchRule.newText}"\n'
        expected += Rule.yamlIndent + 'right_word: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_espansoPreamble(self):
        yaml = Rule.convertToEspanso(self.rules)
        exp = textwrap.dedent('''
                              ---
                              # Auto-generated Espanso YAML file
                              # https://github.com/tnear/AutocorrectForDevelopers
                              matches:
                              ''').strip()
        self.assertTrue(yaml.startswith(exp))

    def test_writeToEspansoYamlFile(self):
        yaml = Rule.convertToEspanso(self.rules)

        # write espanso yaml file to git root
        gitRoot = subprocess.check_output(['git', 'rev-parse', '--show-toplevel'],
                                          stderr=subprocess.STDOUT, universal_newlines=True).strip()
        with open(gitRoot + '/AutocorrectForDevelopers.yaml', 'w', encoding='utf-8') as f:
            f.write(yaml)

    def test_escapeQuote(self):
        firstQuoteRule = [rule for rule in self.rules if not rule.backspace and not rule.caseSensitive and '"' in rule.oldText][0]
        self.assertTrue('"' in firstQuoteRule.oldText)
        espansoRule = Rule.convertOneRuleToEspanso(firstQuoteRule)

        # double quotes must be escaped in yaml
        expOldText = firstQuoteRule.oldText.replace('"', '\\"')
        expected = f'  - trigger: "{expOldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstQuoteRule.newText}"\n'
        expected += Rule.yamlIndent + 'word: true\n'
        expected += Rule.yamlIndent + 'propagate_case: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_skipNewline(self):
        # ahk newlines in trigger are not supported by espanso, so skip them
        firstNewlineRule = [rule for rule in self.rules if '`n' in rule.oldText][0]
        espansoRule = Rule.convertOneRuleToEspanso(firstNewlineRule)
        self.assertEqual(espansoRule, '')

    def test_whitelist_as_suffix(self):
        # certain whitelist rules, such as 'assign' and 'design', also have a suffix rule
        first_whitelist_suffix_rule = [r for r in self.rules if r.backspace and r.suffixMatch][0]
        espanso_rule = Rule.convertOneRuleToEspanso(first_whitelist_suffix_rule)

        expected = f'  - trigger: "{first_whitelist_suffix_rule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{first_whitelist_suffix_rule.oldText}"\n'
        expected += Rule.yamlIndent + 'right_word: true\n'
        expected += Rule.yamlIndent + 'propagate_case: true\n\n'
        self.assertEqual(espanso_rule, expected)

if __name__ == '__main__':
    unittest.main()
