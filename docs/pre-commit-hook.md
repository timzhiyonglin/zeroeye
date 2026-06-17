# Diagnostic pre-commit hook

`tools/pre-commit` runs the repository diagnostic build before a commit and
stages the newest `diagnostic/build-*.logd` artifact plus the matching
`diagnostic/build-*.json` metadata when it exists.

## Install

```sh
make install-hooks
```

The target links `tools/pre-commit` into `.git/hooks/pre-commit` and makes both
paths executable.

## Behavior

- Runs `python3 build.py` before a commit when tracked source inputs changed.
- Prints a countdown-style status line while the diagnostic build is running.
- Stages the newest diagnostic `.logd` file and newest `.json` metadata file.
- Aborts the commit if `build.py` fails, after staging any diagnostic artifacts
  that were produced so the failure can be inspected.
- Stores a source and artifact hash cache in `.git/zeroeye-pre-commit-cache.json`
  so unchanged inputs skip the expensive rebuild on later commits.

The cache lives under `.git/`, so it is local to each checkout and is never
committed.

## Manual validation

Run the same build command used by the hook:

```sh
python3 build.py
```

Then confirm the diagnostic files are present:

```sh
ls -t diagnostic/build-*.logd diagnostic/build-*.json
```
