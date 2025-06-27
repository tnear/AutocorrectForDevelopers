import pathlib
import re

class Rule:
    yamlIndent = '    '

    def __init__(self, line, backspace, caseSensitive, suffixMatch, prefixMatch):
        self.line = line
        self.backspace = backspace
        self.caseSensitive = caseSensitive
        self.suffixMatch = suffixMatch
        self.prefixMatch = prefixMatch

        self.oldText = Rule.getOldText(line)
        self.oldTextLower = self.oldText.lower() # lower() is slow to call in a loop, so do it once here
        self.newText = Rule.getNewText(line)

    # loads AHK file and returns list of Rules
    @staticmethod
    def fileToRuleList(file):
        lines = Rule.cleanFile(file)

        rules = [Rule.lineToRule(line) for line in lines]
        return rules

    # Converts AHK file into a list of rules
    # Removes leading/trailing whitespace, comments, directives, and more.
    @staticmethod
    def cleanFile(file):
        file = Rule.getRelativeFileName(file)

        # read file (removing trailing whitespace)
        with open(file, encoding='utf-8') as f:
            lines = [line.strip() for line in f]

        # remove empty lines
        lines = [line for line in lines if len(line) > 0]

        # remove empty '{' and '}' scope
        lines = [line for line in lines if line not in {'{', '}'}]

        # remove directives
        lines = [line for line in lines if not line.startswith('#')]

        # remove leading comments
        lines = [line for line in lines if not line.startswith(';')]

        # remove trailing comments
        lines = [line.split(' ;')[0] for line in lines]

        # remove trailing whitespace introduced from previous step
        lines = [line.strip() for line in lines]

        # lines are now of form: "::old::new"
        assert all(line.startswith(':') for line in lines)

        assert len(lines) > 0
        return lines

    @staticmethod
    def getRelativeFileName(file):
        if not pathlib.Path(file).exists():
            # support running from root dir or test dir
            file = '../' +  file

        return file

    # creates Rule instance from one line of text
    @staticmethod
    def lineToRule(line: str):
        optionsText = Rule.getOptionsText(line)
        backspace = 'b0' in optionsText
        caseSensitive = 'C' in optionsText
        suffixMatch = '?' in optionsText
        prefixMatch = '*' in optionsText

        rule = Rule(line, backspace, caseSensitive, suffixMatch, prefixMatch)
        return rule

    # ex: returns ':b0:' from ':b0:movie::'
    @staticmethod
    def getOptionsText(line: str):
        # The options text is the 2nd colon and to the left
        assert line[0] == ':'
        startIdx = 1

        # start searching after first colon
        idx = line.find(':', startIdx)

        # 2nd colon must exist for valid rules
        assert idx != -1

        return line[0:idx + 1]

    # ex: returns 'abc' from '::abc::def'
    @staticmethod
    def getOldText(line: str, escape=True):
        optsText = Rule.getOptionsText(line)

        # ex: convert '::abc::def' to 'abc::def'
        noOpts = line[len(optsText):]

        # find first unescaped '::'
        out = re.search(r'(?<!`)::', noOpts)
        splitter = out.regs[0][0]
        assert splitter > 0

        oldText = noOpts[0:splitter]
        if escape:
            oldText = Rule.unescapeText(oldText)

        return oldText

    # ex: returns 'def' form '::abc::def'
    @staticmethod
    def getNewText(line: str):
        optsText = Rule.getOptionsText(line)

        # using line length to get new text, so do not escape
        # anything (yet) because it changes the string length
        oldText = Rule.getOldText(line, False)
        splitter = '::'
        newText = line[len(oldText) + len(optsText) + len(splitter) :]

        newText = Rule.unescapeText(newText)
        return newText

    # this is a naive function which doesn't check the context of the
    # usage of the special characters which it replaces
    @staticmethod
    def unescapeText(text: str):
        # remove escaping for ';' and ':'
        newText = text.replace('`;', ';')
        newText = newText.replace('`:', ':')

        # remove trailing '`' (used to denote trailing whitespace)
        newText = newText.strip('`')

        # a char between '{' and '}' is escaped, ex: convert '{{}' to '{'
        newText = re.sub(r'{(.)}', r'\1', newText)
        return newText

    # ex: inputText = 'Wriet-Output'
    # oldText = 'wriet'
    # newText = 'write'
    # This first changes 'Wriet-Output' to 'write-Output' then restores case to 'Write-Output'
    @staticmethod
    def _replacePreserveCase(inputText, oldText, newText):
        assert len(inputText) >= len(oldText)
        mismatchIdx = []

        # get idx of capitalization mismatch
        for idx, oldChar in enumerate(oldText):
            if inputText[idx].lower() == oldChar.lower() and inputText[idx] != oldChar:
                # found a capitalization mismatch
                mismatchIdx.append( (inputText[idx], idx) )

        # make lowercase the part of inputText which matches the length of the rule
        lowercaseText = inputText[0 : len(oldText)].lower() + inputText[len(oldText) : ]
        # naively replace old -> new, ex: 'Wriet-Output' -> 'write-Output'
        replacedText = lowercaseText.replace(oldText, newText)

        # lastly, restore the capitalization, ex: 'write-Output' -> 'Write-Output'
        for elem in mismatchIdx:
            replacedText = replacedText[0:elem[1]] + elem[0] + replacedText[elem[1] + 1 : ]

        return replacedText

    # iterates through rules trying to find a match
    @staticmethod
    def getReplacementText(rules: list, inputText: str, hasEndChar: bool, startIdx = 0):
        # startIdx is an optimization to allow the next test to start where the previous left off.
        # it only works when the order of tests exactly matches what is in the .ahk file
        # e.g., no unordered explicit tests

        inputTextLower = inputText.lower() # lower() is slow to call in a loop, so do it once here
        for idx in range(startIdx, len(rules)):
            rule = rules[idx]
            if rule.caseSensitive:
                lhs = rule.oldText
                rhs = inputText
            else:
                lhs = rule.oldTextLower
                rhs = inputTextLower

            if lhs == rhs:
                # exact match
                if rule.backspace:
                    # otherwise, return text unchanged
                    return inputText, rule, idx

                if hasEndChar:
                    # found match
                    return rule.newText, rule, idx

            if rule.prefixMatch:
                # prefix rules, :*:, only need to start with text
                # (ending char does not matter)
                # ex: :*:grahp should match "graphing"
                if rhs.startswith(rule.oldText):
                    replacedText = Rule._replacePreserveCase(inputText, rule.oldText, rule.newText)
                    return replacedText, rule, idx

            if rule.suffixMatch:
                # suffix matches
                if hasEndChar and inputText.endswith(rule.oldText):
                    if rule.backspace:
                        # found whitelist match, return text unchanged
                        return inputText, rule, idx

                    return rule.newText, rule, idx

        # no match found, return input text
        return inputText, None, 0

    @staticmethod
    def convertToEspanso(rules):
        yaml = '---\n# Auto-generated Espanso YAML file\n'
        yaml += '# https://github.com/tnear/AutocorrectForDevelopers\n'
        yaml += 'matches:\n'
        for rule in rules:
            yaml += Rule.convertOneRuleToEspanso(rule)

        return yaml

    @staticmethod
    def convertOneRuleToEspanso(rule):
        newText = rule.newText
        if '`n' in rule.oldText:
            # ahk newlines in trigger are not supported by espanso, so skip them
            return ''

        if rule.backspace:
            # whitelist a rule by making new text same as old text
            newText = rule.oldText

        oldText = rule.oldText
        if '"' in oldText:
            # double quotes must be escaped with \ in yaml
            oldText = oldText.replace('"', '\\"')

        yaml = f'  - trigger: "{oldText}"\n'
        yaml = yaml + Rule.yamlIndent + f'replace: "{newText}"\n'
        if rule.prefixMatch:
            yaml = yaml + Rule.yamlIndent + 'left_word: true\n'
        elif rule.suffixMatch:
            yaml = yaml + Rule.yamlIndent + 'right_word: true\n'
        else:
            yaml = yaml + Rule.yamlIndent + 'word: true\n'

        if not rule.caseSensitive:
            # autocorrect regardless of case
            yaml = yaml + Rule.yamlIndent + 'propagate_case: true\n'

        yaml += '\n'
        return yaml
