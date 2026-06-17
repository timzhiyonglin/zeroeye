# Contributing

Thanks for helping improve Tent of Trials. This repository is a deliberately
polyglot trading and risk platform, so the best contributions are small,
well-scoped, and include the diagnostic artifacts reviewers need.

## Local setup

Fork the repository, clone your fork, and add the upstream repository if needed:

```sh
git clone https://github.com/YOUR-USER/zeroeye.git
cd zeroeye
git remote add upstream https://github.com/lobster-trap/zeroeye.git
```

Install Python 3 first because `build.py` is the main repository build driver.
Install the module toolchains you plan to touch:

- Python 3.11 or newer for repository tooling.
- Rust and Cargo for `backend/`.
- Node.js 22 or newer and npm for `frontend/`.
- Go for `market/`.
- GCC, G++, Make, and CMake for `frailbox/`.
- JDK 21 for `compliance/`.
- Ruby, Lua, and GHC for the optional service and OpenAPI modules.

The README includes a longer package-install example for Ubuntu-based systems.

## Build and diagnostics

Run the build before opening a pull request:

```sh
python3 build.py
```

For focused work, build only the modules you changed:

```sh
python3 build.py --module backend,frontend
```

Every PR must include the diagnostic artifacts generated under `diagnostic/`,
including the encrypted `build-*.logd` file and matching `build-*.json` metadata
when present. If your local machine is missing a toolchain, still run the build
and describe the failure in the PR testing notes.

## Pull request workflow

1. Create a branch from the latest upstream `main`.
2. Keep the change focused on one issue or bounty.
3. Commit source, docs, tests, and required diagnostics together.
4. Open a PR against `lobster-trap/zeroeye:main`.
5. Fill out the repository PR template at
   [`.github/pull_request_template.md`](.github/pull_request_template.md).

Use clear commit messages, for example:

```sh
git checkout -b fix/orderbook-snapshot
git commit -m "feat: add orderbook snapshot recovery"
```

## Code style

Match the style already used by the file you edit. Prefer small, readable
changes over broad cleanup. If an `.editorconfig` file is added to the
repository, treat it as the source of truth for indentation, line endings, and
charset rules.

Before submitting, check for accidental whitespace-only churn:

```sh
git diff --check
```

## Review expectations

In the PR body, explain what changed, what you ran locally, which diagnostics
were generated, and any environment limits that affected validation. Avoid
committing unrelated generated files; diagnostic build artifacts are the
exception because reviewers require them for PR validation.
