# Jenkins Operators

Monorepo for the Jenkins charms maintained by Canonical Platform Engineering.

This repository contains:

- [`charms/jenkins-agent`](charms/jenkins-agent) — Jenkins machine agent charm
- [`charms/jenkins-agent-k8s`](charms/jenkins-agent-k8s) — Jenkins Kubernetes agent charm
- [`charms/jenkins-k8s`](charms/jenkins-k8s) — Jenkins server charm for Kubernetes

## Repository structure

```
canonical/jenkins-operators/
├── charms/
│   ├── jenkins-agent/
│   ├── jenkins-agent-k8s/
│   └── jenkins-k8s/
├── docs/
├── pyproject.toml
├── tox.ini
└── Makefile
```

Shared tooling — lint, unit tests, static analysis, CI — lives at the repository root.
Each charm keeps its own `charmcraft.yaml`, source, tests, and vendored libraries under
`charms/<name>/`.

## Getting started

Run all lint checks:

```bash
make lint
```

Run all unit tests:

```bash
make unit
```

Run lint and unit for one charm:

```bash
tox -e jenkins-k8s-lint
tox -e jenkins-k8s-unit
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Licensing

See [LICENSE](LICENSE).
