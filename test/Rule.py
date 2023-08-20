import pathlib

class Rule:
    staticIndex = 0
    escapeChar = '`'

    def __init__(self, line, backspace, caseSensitive, suffixMatch, prefixMatch):
        self.line = line
        self.backspace = backspace
        self.caseSensitive = caseSensitive
        self.suffixMatch = suffixMatch
        self.prefixMatch = prefixMatch

        self.oldText = Rule.getOldText(line)
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
        if not pathlib.Path(file).exists():
            # support running from root dir or test dir
            file = '../' +  file

        # read file (removing trailing whitespace)
        with open(file) as f:
            lines = [line.strip('\n ') for line in f]

        # remove empty lines
        lines = [line for line in lines if len(line) > 0]

        # remove empty '{' and '}' scope
        lines = [line for line in lines if line != '{' and line != '}']

        # remove directives
        lines = [line for line in lines if not line.startswith('#')]

        # remove leading comments
        lines = [line for line in lines if not line.startswith(';')]

        # remove trailing comments
        lines = [line.split(' ;')[0] for line in lines]

        # remove trailing whitespace introduced from previous step
        lines = [line.strip() for line in lines]

        # lines are now of form: "::old::new"
        assert all([line.startswith(':') for line in lines])

        assert len(lines) > 0
        return lines

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

        splitter = noOpts.find('::')
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

    @staticmethod
    def unescapeText(text: str):
        # remove all '`' characters from text
        return text.replace(Rule.escapeChar, '')

    # iterates through rules trying to find a match
    @staticmethod
    def getReplacementText(rules: list, inputText: str, hasEndChar: bool):
        for rule in rules:
            # exact matches
            if rule.oldText == inputText:
                if rule.backspace:
                    # found whitelist match, return text unchanged
                    return inputText, rule

                if hasEndChar or rule.prefixMatch:
                    # found match
                    return rule.newText, rule

            # suffix matches
            if rule.suffixMatch and inputText.endswith(rule.oldText):
                return rule.newText, rule

        # no match, return input text
        return inputText, None