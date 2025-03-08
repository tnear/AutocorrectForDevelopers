# Automated testing

All tests are run as part of GitHub [Actions](https://github.com/tnear/AutocorrectForDevelopers/actions), ensuring that any new rules and updates do not regress existing behavior.

Tests are written in Python. Testing is supported on all major platforms.

## Running tests

Run `python -m unittest discover test` from the repository root.

```
AutocorrectForDevelopers> python -m unittest discover test
...........................................................
----------------------------------------------------------------------
Ran 59 tests in 1.753s

OK
```
