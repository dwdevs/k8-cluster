#!/bin/bash
K8DIR=/Users/don.wall/Development/k8-project/
clear
### Virtual Box Status ###
echo "Virtual Box Status"
echo "###################"
vboxmanage list runningvms
echo
echo
### Vagrant Global Status ###
echo "Vagrant Global Status"
echo "######################"
vagrant global-status
echo 
echo
### Kubernetes Cluster Status ###
echo "Kubernetes Cluster Status"
echo "##########################"
cd 
ssh k8admin@192.168.50.169 'kubectl cluster-info'
ssh k8admin@192.168.50.169 'kubectl get nodes'
echo
echo
