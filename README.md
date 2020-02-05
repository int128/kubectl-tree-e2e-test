# kubectl-tree-e2e-test [![test](https://github.com/int128/kubectl-tree-e2e-test/workflows/test/badge.svg)](https://github.com/int128/kubectl-tree-e2e-test/actions?query=workflow%3Atest)

This is an end-to-end test of [kubectl-tree](https://github.com/ahmetb/kubectl-tree).
It shows how to test with a real Kubernetes cluster using Kind on GitHub Actions.


## How it works

The test runs with the following stack:

![test-kubectl-plugin-with-cluster](test-kubectl-plugin-with-cluster.svg)

The test runs on GitHub Actions [workflow](.github/workflows/test.yaml).
It installs Kind, krew and kubectl-tree.

The test scenario is written in [Makefile](Makefile).
It creates a Kubernetes cluster using [Kind](https://kind.sigs.k8s.io) and deploy the [fixture](fixture.yaml).
After deployment, it runs `kubectl tree` and check its output.


## Run locally

You need to install Docker and Kind.

```sh
# install deps
kubectl krew install tree

# run the test
make

# clean up
make delete-cluster
```

## Conrtibution

This is an open source software.
Feel free to open issues and pull requests.
