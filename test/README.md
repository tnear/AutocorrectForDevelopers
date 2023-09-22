# Automated testing

All rules for AutocorrectForDevelopers are continuously regression tested. All tests are run before pushing to GitHub, hopefully ensuring that new rules do not interfere with any older rules.

All tests are written in Python and testing is supported on all major platforms (although AutoHotkey itself is Windows-only).

## Running tests

Navigate to the 'test' directory and run `python -m unittest`:

```
AutocorrectForDevelopers/test> python -m unittest
...........................
----------------------------------------------------------------------
Ran 27 tests in 1.364s
```
