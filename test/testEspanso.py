import unittest
import subprocess
from Rule import Rule

class TestEspanso(unittest.TestCase):
    @classmethod
    def setUpClass(self):
        self.rules = Rule.fileToRuleList('AutocorrectForDevelopers.ahk')

    def test_whitelist(self):
        firstWhitelistRule = [rule for rule in self.rules if rule.backspace][0]
        espansoRule = Rule._convertOneRuleToEspanso(firstWhitelistRule)

        expected = f'  - trigger: "{firstWhitelistRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstWhitelistRule.oldText}"\n'
        expected += Rule.yamlIndent + f'word: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_exactMatch(self):
        firstExactMatchRule = [rule for rule in self.rules if not rule.backspace and not rule.caseSensitive][0]
        espansoRule = Rule._convertOneRuleToEspanso(firstExactMatchRule)

        expected = f'  - trigger: "{firstExactMatchRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstExactMatchRule.newText}"\n'
        expected += Rule.yamlIndent + f'word: true\n'
        expected += Rule.yamlIndent + f'propagate_case: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_exactCaseSensitive(self):
        firstExactMatchRule = [rule for rule in self.rules if not rule.backspace][0]
        espansoRule = Rule._convertOneRuleToEspanso(firstExactMatchRule)

        expected = f'  - trigger: "{firstExactMatchRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstExactMatchRule.newText}"\n'
        expected += Rule.yamlIndent + f'word: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_prefixMatch(self):
        firstExactMatchRule = [rule for rule in self.rules if not rule.backspace and rule.prefixMatch][0]
        espansoRule = Rule._convertOneRuleToEspanso(firstExactMatchRule)

        expected = f'  - trigger: "{firstExactMatchRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstExactMatchRule.newText}"\n'
        expected += Rule.yamlIndent + f'left_word: true\n'
        expected += Rule.yamlIndent + f'propagate_case: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_suffixMatch(self):
        firstExactMatchRule = [rule for rule in self.rules if rule.suffixMatch and not rule.backspace][0]
        espansoRule = Rule._convertOneRuleToEspanso(firstExactMatchRule)

        expected = f'  - trigger: "{firstExactMatchRule.oldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstExactMatchRule.newText}"\n'
        expected += Rule.yamlIndent + f'right_word: true\n\n'
        self.assertEqual(espansoRule, expected)

    def test_writeToEspansoYamlFile(self):
        yaml = Rule.convertToEspanso(self.rules)
        self.assertTrue(yaml, '---\n# Auto-generated Espanso YAML file\nmatches:\n')

        # write espanso yaml file to git root
        gitRoot = subprocess.check_output(['git', 'rev-parse', '--show-toplevel'],
                                          stderr=subprocess.STDOUT, universal_newlines=True).strip()
        with open(gitRoot + '/AutocorrectForDevelopers.yaml', 'w') as f:
            f.write(yaml)

    def test_escapeQuote(self):
        firstQuoteRule = [rule for rule in self.rules if not rule.backspace and not rule.caseSensitive and '"' in rule.oldText][0]
        self.assertTrue('"' in firstQuoteRule.oldText)
        espansoRule = Rule._convertOneRuleToEspanso(firstQuoteRule)

        # double quotes must be escaped in yaml
        expOldText = firstQuoteRule.oldText.replace('"', '\\"')
        expected = f'  - trigger: "{expOldText}"\n'
        expected += Rule.yamlIndent + f'replace: "{firstQuoteRule.newText}"\n'
        expected += Rule.yamlIndent + f'word: true\n'
        expected += Rule.yamlIndent + f'propagate_case: true\n\n'
        self.assertEqual(espansoRule, expected)

if __name__ == '__main__':
    unittest.main()
