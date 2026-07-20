# Copyright 2025 Canonical Ltd.
# See LICENSE file for licensing details.

.PHONY: lint unit test fmt format static integration clean

lint:
	tox -e jenkins-agent-lint,jenkins-agent-k8s-lint,jenkins-k8s-lint

unit:
	tox -e jenkins-agent-unit,jenkins-agent-k8s-unit,jenkins-k8s-unit

static:
	tox -e jenkins-agent-static,jenkins-agent-k8s-static,jenkins-k8s-static

fmt:
	ruff check --fix --select I charms/*/src charms/*/tests
	ruff format charms/*/src charms/*/tests

test: lint unit

integration:
	tox -e jenkins-agent-integration,jenkins-agent-k8s-integration,jenkins-k8s-integration

clean:
	rm -rf .tox .mypy_cache .ruff_cache .pytest_cache
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name '*.pyc' -delete
