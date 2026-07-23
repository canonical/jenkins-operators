# Jenkins operators

This is a monorepo containing the source for the Jenkins family of
[Juju](https://juju.is/) charms maintained by Canonical.

## Charms

| Charm | Directory | Charmhub | Description |
|-------|-----------|----------|-------------|
| `jenkins-k8s` | [`charms/jenkins-k8s`](charms/jenkins-k8s) | [charmhub.io/jenkins-k8s](https://charmhub.io/jenkins-k8s) | Deploys and manages a Jenkins server on Kubernetes. |
| `jenkins-agent-k8s` | [`charms/jenkins-agent-k8s`](charms/jenkins-agent-k8s) | [charmhub.io/jenkins-agent-k8s](https://charmhub.io/jenkins-agent-k8s) | Deploys and manages Jenkins agents on Kubernetes. |
| `jenkins-agent` | [`charms/jenkins-agent`](charms/jenkins-agent) | [charmhub.io/jenkins-agent](https://charmhub.io/jenkins-agent) | Deploys and manages Jenkins agents on machines (VMs / bare metal). |

## Repository layout

```
jenkins-operators/
├── charms/
│   ├── jenkins-k8s/          # Jenkins server (Kubernetes)
│   ├── jenkins-agent-k8s/    # Jenkins agent (Kubernetes)
│   └── jenkins-agent/        # Jenkins agent (machine)
└── .github/workflows/        # Per-charm CI (path-filtered) + repo-wide lint
```

Each charm directory is self-contained: it keeps its own `charmcraft.yaml`,
`pyproject.toml`, `tox.toml`, `uv.lock`, source, tests and docs.

## Developing

Work on a single charm from within its directory. Each charm defines the
standard tox environments:

```bash
cd charms/jenkins-k8s
tox -e lint      # style + codespell + ruff + mypy
tox -e unit      # unit tests + coverage
tox -e static    # bandit static analysis
```

## CI

CI is organised per charm. Each charm has path-filtered `*_test.yaml` and
`*_integration.yaml` workflows that invoke the shared
[`canonical/operator-workflows`](https://github.com/canonical/operator-workflows)
reusable workflows with `working-directory: charms/<charm>`, so a pull request
only runs the jobs for the charm(s) it touches. A `repo_lint.yaml` workflow
checks Apache-2.0 license headers across the whole repository.

## Contributing

See the `CONTRIBUTING.md` file inside each charm directory. This project is
released under the [Apache 2.0 license](LICENSE).
