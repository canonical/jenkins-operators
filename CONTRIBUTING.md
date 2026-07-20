# Contributing

Thank you for your interest in contributing to the Jenkins operators.

## Setup

This repository uses `tox` and `uv`. Install `uv`, then run:

```bash
uv tool install tox --with tox-uv
```

## Running tests

```bash
make lint
make unit
make static
```

## Pull requests

- Keep changes focused on one charm or the shared tooling.
- Use conventional commits.
- Ensure the affected charm's CI passes before asking for review.
