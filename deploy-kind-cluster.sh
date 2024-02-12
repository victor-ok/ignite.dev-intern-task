#!/bin/bash

# Create a KinD cluster
kind create cluster

# Set KUBECONFIG to point to the newly created KinD cluster
export KUBECONFIG="$(kind get kubeconfig-path)"

# Verify the cluster is up and running
kubectl cluster-info

echo "KinD cluster 'my-local-cluster' is now deployed locally."
