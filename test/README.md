# Automated testing

All rules for AutocorrectForDevelopers are continuously regression tested. Tests are run before pushing to GitHub, ensuring that new rules do not interfere with any existing rules.

All tests are written in Python. Testing is supported on all major platforms (although AutoHotkey itself is Windows-only).

## Running tests

Navigate to the `test` directory then run `python -m unittest`:

```
AutocorrectForDevelopers/test> python -m unittest
.......................................................
----------------------------------------------------------------------
Ran 55 tests in 1.697s

OK
```
