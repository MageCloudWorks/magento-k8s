#!/bin/bash 
# Work around for microk8s
shopt -s expand_aliases
source ~/.bash_aliases

kubectl create namespace magento
kubectl apply -f k8s/apache.yaml
kubectl apply -f k8s/mariadb.yaml
kubectl apply -f k8s/elasticsearch.yaml
kubectl create configmap -n magento varnish-vcl --from-file=k8s/default.vcl
kubectl apply -f k8s/varnish.yaml
kubectl apply -f k8s/redis-session.yaml
