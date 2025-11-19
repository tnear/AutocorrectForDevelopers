# AutocorrectForDevelopers
**_AutocorrectForDevelopers_** is a multi-platform script which automatically fixes typos using rules tailored for software developers. *AutocorrectForDevelopers* can be run through [AutoHotkey](https://www.autohotkey.com/) (AHK) or [Espanso](https://github.com/espanso/espanso). The script's rules contain many corrections for common developer words involving keywords, classes, methods, programming languages, and software engineering concepts. This script reduces runtime errors and boosts developer productivity.

## How does it work?
Corrections happen automatically as you type:

![Autocorrect](assets/cpp.gif)

By default, *AutocorrectForDevelopers.ahk* runs against all applications (except Microsoft Word), although the script can be customized to enable or disable any application (see the `#HotIf/#If` statement early in the script).

## Installation
### AutoHotkey users
Install [AutoHotkey](https://www.autohotkey.com/) v2, then run [*AutocorrectForDevelopers.ahk*](AutocorrectForDevelopers.ahk).

### Espanso users
Install [Espanso](https://espanso.org/) for your platform, then [load](https://espanso.org/docs/get-started/) the match file [*AutocorrectForDevelopers.yaml*](AutocorrectForDevelopers.yaml).

To match the behavior of the AutoHotkey script, update your Espanso [settings](https://espanso.org/docs/configuration/options/) to set `undo_backspace` to `false`, and append these `word_separators` to Espanso's default list: ``"-", "`", "&", "|", "_", "/", "\", "*", "+", "@", "#", "="``.

## Testing
All [tests](https://github.com/tnear/AutocorrectForDevelopers/tree/main/test) are run as part of GitHub [Actions](https://github.com/tnear/AutocorrectForDevelopers/actions), ensuring that any new rules and updates do not regress existing behavior.

## FAQ

### How does *AutocorrectForDevelopers.ahk* compare to AutoHotkey's official *AutoCorrect.ahk* script?
AutoHotkey's official autocorrect [script](https://www.autohotkey.com/download/AutoCorrect.ahk) is based in Wikipedia's [common misspellings](https://en.wikipedia.org/wiki/Wikipedia:Lists_of_common_misspellings/For_machines) list from [2005](https://en.wikipedia.org/w/index.php?title=Wikipedia:Lists_of_common_misspellings/For_machines&oldid=11834258). Jim Biancolo [ported](https://www.biancolo.com/blog/autocorrect/) Wikipedia's list to an AutoHotkey script in 2006 and it has been hosted on AutoHotkey.com since 2007. The original script is widely influential and has been used successfully by many people for years.

![Venn diagram](assets/VennDiagram.png)

*AutoCorrect.ahk*, shown in yellow, contains many rules for rare words which software engineers are unlikely to need. Also, the official script hasn't seen active development in 15 years and therefore is missing new technology terminology.

*AutocorrectForDevelopers.ahk*, shown in purple, contains many common software engineering terms which are absent from *AutoCorrect.ahk*. Because *AutocorrectForDevelopers.ahk* is developer-centric, it will fix a higher percentage of your typos.

### What programming subjects does this script contain?
- Languages: C, C++, C#, COBOL, CSS, FORTRAN, Go, Java, JavaScript, Julia, Kotlin, Lua, Perl, PHP, Python, R, Ruby, Rust, Scala, SQL, Swift, Terraform, Visual Basic, Zig
- Programs: AutoHotkey, GDB, Git, MATLAB, PowerShell, UNIX CLI
- Subjects: algorithms, artificial intelligence, cloud computing, compilers, concurrency, cryptography, databases, distributed systems, linear algebra, machine learning, networking, operating systems, security, statistics, system design
- (more to come!)
