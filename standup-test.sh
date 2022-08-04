#!/bin/bash -x
# Check all pods are running
PODSTATUS=$(kubectl get pods -n magento | grep -v "Running")
[ $(echo $PODSTATUS | wc -l) -gt 1 ] && echo "Error not all pods running\n $PODSTATUS"

# Basic test that varnish is responding
K8IP=$(kubectl get nodes -o jsonpath={.items[0].status.addresses[?\(@.type==\"InternalIP\"\)].address})
curl  http://$K8IP:30081/health_check.php
curl  http://$K8IP:30081/ | grep "Magento"
