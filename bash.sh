#!/bin/bash

# Install kind (Kubernetes in Docker)
echo "Installing kind..."
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Create a Kind cluster
echo "Creating a Kind cluster..."
kind create cluster --name my-cluster

# Configure kubectl to use the Kind cluster
echo "Configuring kubectl..."
kubectl cluster-info --context kind-my-cluster

echo "Kind cluster is now ready!"