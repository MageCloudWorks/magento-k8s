#!/bin/bash -v
# Work around for microk8s
shopt -s expand_aliases
source ~/.bash_aliases
kubectl delete namespace magento
