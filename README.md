# kubectl-tree-e2e-test

This is an end-to-end test of [kubectl-tree](https://github.com/ahmetb/kubectl-tree).

This repository shows how to test a kubectl plugin with a real Kubernetes cluster on CI.

## Run locally

You need to set up Docker and [Kind](https://kind.sigs.k8s.io).

```sh
# install
kubectl krew install tree

# run the test
make
```

## Conrtibution

This is an open source software.
Feel free to open issues and pull requests.
