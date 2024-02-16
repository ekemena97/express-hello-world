#!/bin/bash
# Get the kubeconfig for the cluster
echo "Retrieving kubeconfig for the cluster..."
kind get kubeconfig --name my-cluster > kubeconfig.yaml

# Move the kubeconfig file to a safe place (e.g., $home/.kube/)
echo "Moving kubeconfig file to a safe place..."
mkdir -p $home/.kube/
cp kubeconfig.yaml $home/.kube/

# Configure kubectl to use the Kind cluster
echo "Configuring kubectl..."
export KUBECONFIG=$HOME/.kube/kubeconfig.yaml
kubectl cluster-info --context kind-my-cluster