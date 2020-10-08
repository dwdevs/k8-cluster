!/usr/bin/env bash
K8DIR=/Users/don.wall/Development/k8-project/

## K8 Master
echo "Starting the Kubernetes Master VM with VirtualBox"
vboxmanage startvm Kubernetes-Master --type headless

## K8 Worker 1
cd $K8DIR/Vagrant/Worker
echo "Starting the Kubernetes Worker VM with VirtualBox"
vagrant up
