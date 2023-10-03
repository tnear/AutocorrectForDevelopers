# AutocorrectForDevelopers
**_AutocorrectForDevelopers_** is an [AutoHotkey](https://www.autohotkey.com/) (AHK) script which automatically fixes typos using rules tailored for software developer environments. Its rules contain many corrections for common developer words involving keywords, classes, methods, programming languages, and programming disciplines. This script will reduces runtime errors, decreases compilation times, and boosts developer productivity.

## How does it work?
Corrections happen automatically as you type:

![Autocorrect](assets/cpp.gif)

*AutocorrectForDevelopers.ahk* runs on all applications (except Microsoft Word), although the script can be customized to enable or disable any application of your choice (see the `#HotIf/#If` statement early in the script).

## Installation
Download [AutoHotkey](https://www.autohotkey.com/) v2, then run [*AutocorrectForDevelopers.ahk*](AutocorrectForDevelopers.ahk).

## Testing
All rules are continuously regression tested (see tests [here](https://github.com/tnear/AutocorrectForDevelopers/tree/main/test)). All tests are run before pushing to GitHub, ensuring that new rules do not interfere with any existing rules.

## FAQ
### Does this script support AutoHotkey v1?
Absolutely! (although v2 is preferred). AHK v1 is deprecated by the AHK development team. There is a legacy v1 version of the *AutocorrectForDevelopers* script [here](assets/AutocorrectForDevelopersV1Legacy.ahk) which supports AHK v1. A friendly word of caution: the v1 script is not exhaustively tested like the v2 script nor is it guaranteed to contain the latest rules.

### How does *AutocorrectForDevelopers.ahk* compare to AutoHotkey's official *AutoCorrect.ahk* script?
[Here](https://www.autohotkey.com/download/AutoCorrect.ahk) is AutoHotkey's official autocomplete script. It is based in Wikipedia's [common misspellings](https://en.wikipedia.org/wiki/Wikipedia:Lists_of_common_misspellings/For_machines) list which dates back to [2005](https://en.wikipedia.org/w/index.php?title=Wikipedia:Lists_of_common_misspellings/For_machines&oldid=11834258). Jim Biancolo [ported](https://www.biancolo.com/blog/autocorrect/) Wikipedia's list to an AutoHotkey script in 2006 and it has been officially hosted by AutoHotkey.com since 2007. The original script is widely influential and has been used successfully by many people for years.

Shown below is a Venn diagram comparing *AutocorrectForDevelopers.ahk* with the official *AutoCorrect.ahk*:

![Venn diagram](assets/VennDiagram.png)

*AutocorrectForDevelopers.ahk* is shown in purple on the right. It contains many common software engineering terms which are absent from *AutoCorrect.ahk*. Because *AutocorrectForDevelopers.ahk* is developer-centric, it will automatically fix a higher percentage of your typos. Also, it is drawn as a smaller circle because it contains thousands fewer rules than *AutoCorrect.ahk*.

*AutoCorrect.ahk* is shown on the left. It contains many rules for rare words which software developers are unlikely to need. It also introduces many accented characters which are correct but developer unfriendly. Lastly, the official script hasn't seen much active development in the last 15 years and therefore supports AHK v1-only.

*AutocorrectForDevelopers.ahk* aims to fill the autocorrect gap for developers by including many software development typos which the esteemed *AutoCorrect.ahk* is missing.

## Common developer typos added for...
- Languages: AutoHotkey, C, C++, C#, COBOL, CSS, FORTRAN, Go, Java, JavaScript, Julia, Kotlin, MATLAB, Perl, PHP, Python, R, Ruby, Rust, Scala, SQL, Swift, Visual Basic
- Programs: GDB, Git, PowerShell, UNIX CLI
- Subjects: algorithms, artificial intelligence, compilers, cryptography, databases, linear algebra, machine learning, networking, operating systems, security
- (more to come!)
