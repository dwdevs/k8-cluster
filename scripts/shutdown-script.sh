#!/usr/bin/env bash
K8DIR=/Users/don.wall/Development/k8-project/

## Worker 1
cd $K8DIR/k8-cluster/Vagrant/Worker/
echo "Shuting down workers"
vagrant halt --force

## Master
# Ask question to see if K8 master needs shutting down
while true; do
    read -p "Do you wish to shutdown the Kubernetes Master?" yn
    case $yn in
        [yes]* ) echo "Shutting down now and saving the VM state"; vboxmanage controlvm Kubernetes-Master savestate; break;;
        [no]* ) echo "Exiting program"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
