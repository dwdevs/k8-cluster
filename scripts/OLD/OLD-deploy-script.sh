#!/usr/bin/env bash
K8DIR=/Users/don.wall/Development/k8-project/

## Master
echo "Starting the K8 Master VM with VBOX"
vboxmanage startvm Kubernetes-Master --type headless
clear
echo "Creating cluster join access token" 
# On the Master to create join token
#kubeadm token list
#ssh k8admin@192.168.50.169 kubeadm token list
ssh k8admin@192.168.50.169 kubeadm token create --print-join-command >> joincluser.sh
echo "Join cmd and token saved in joincluster.sh"
sleep 5

## Worker 1
clear
cd $K8DIR/Vagrant/Worker1/
cp -av $K8DIR/Vagrant/Vagrantfile .
cp -av $K8DIR/Vagrant/bootstrap.sh .
sed -i -e 's/vagrantname/worker1/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker1/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker1/g' ./bootstrap.sh
echo "Deploying K8 Worker Node"
vagrant up --provider=virtualbox --provision

## Worker 2
cd $K8DIR/Vagrant/Worker2/
cp -av $K8DIR/Vagrant/Vagrantfile .
cp -av $K8DIR/Vagrant/bootstrap.sh .
sed -i -e 's/vagrantname/worker2/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker2/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker2/g' ./bootstrap.sh
echo "Deploying K8 Worker Node"
vagrant up --provider=virtualbox --provision

## Worker 3
cd $K8DIR/Vagrant/Worker3/
cp -av $K8DIR/Vagrant/Vagrantfile .
cp -av $K8DIR/Vagrant/bootstrap.sh .
sed -i -e 's/vagrantname/worker3/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker3/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker3/g' ./bootstrap.sh
echo "Deploying K8 Worker Node"
vagrant up --provider=virtualbox --provision

## Worker 4
cd $K8DIR/Vagrant/Worker4/
cp -av $K8DIR/Vagrant/Vagrantfile .
cp -av $K8DIR/Vagrant/bootstrap.sh .
sed -i -e 's/vagrantname/worker4/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker4/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker4/g' ./bootstrap.sh
echo "Deploying K8 Worker Node"
vagrant up --provider=virtualbox --provision

## Worker 5
cd $K8DIR/Vagrant/Worker5/
cp -av $K8DIR/Vagrant/Vagrantfile .
cp -av $K8DIR/Vagrant/bootstrap.sh .
sed -i -e 's/vagrantname/worker5/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker5/g' ./Vagrantfile
sed -i -e 's/CHANGE-ME/worker5/g' ./bootstrap.sh
echo "Deploying K8 Worker Node"
vagrant up --provider=virtualbox --provision
