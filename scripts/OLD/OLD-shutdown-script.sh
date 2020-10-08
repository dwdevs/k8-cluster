#!/usr/bin/env bash
K8DIR=/Users/don.wall/Development/k8-project/

## Worker 1
cd $K8DIR/Vagrant/Worker/
echo "Shuting down workers"
vagrant halt --force

## Worker 2
#cd $K8DIR/Vagrant/Worker2/
#echo "Shuting down worker2"
#vagrant halt --force

## Worker 3
#cd $K8DIR/Vagrant/Worker3/
#echo "Shuting down worker3"
#vagrant halt --force

## Worker 4
#cd $K8DIR/Vagrant/Worker4/
#echo "Shuting down worker4"
#vagrant halt --force

## Worker 5
#cd $K8DIR/Vagrant/Worker5/
#echo "Shuting down worker5"
#vagrant halt --force

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
