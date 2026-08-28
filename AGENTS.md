# AGENTS.md

## Hotstrings

- `::typo::correction` matches a complete word and ignores case.
- `:C:typo::correction` matches case exactly.
- `:*:typo::correction` does not require an ending character.
- `:?:typo::correction` matches at the end of a word, even when preceded by another word character.
- `:b0:word::` prevents replacement and acts as a whitelist entry.
- Combine options inside the first pair of colons, such as `:C?:typo::correction`.

## Verification

- Run `python -m unittest discover test` after code changes.
- Treat `AutocorrectForDevelopers.yaml` as generated output.
