# Automated testing

All rules for AutocorrectForDevelopers are continuously regression tested. Tests are run before pushing to GitHub, ensuring that new rules do not interfere with any existing rules.

All tests are written in Python. Testing is supported on all major platforms (although AutoHotkey itself is Windows-only).

## Running tests

Run `python -m unittest discover test` from the repository root.

```
AutocorrectForDevelopers/test> python -m unittest
.........................................................
----------------------------------------------------------------------
Ran 57 tests in 1.799s

OK
```
