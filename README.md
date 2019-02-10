# actions-kustomize

A GitHub Action for [Kustomize](https://github.com/kubernetes-sigs/kustomize/). Contains `kubectl` as well. Works well with [`urcomputeringpal/actions-kubeconfig`](https://github.com/urcomputeringpal/actions-kubeconfig).

## Usage

```hcl
action "kustomize build" {
  needs = "kube config"
  uses = "urcomputeringpal/actions-kubeconfig@master"
  args = "build | tee /tmp/out"
}

action "kubectl apply" {
  needs = "kustomize build"
  uses = "urcomputeringpal/actions-kubeconfig@master"
  runs = "/bin/bash -c"
  args = ["kubectl apply -f /tmp/out"]
}
```
