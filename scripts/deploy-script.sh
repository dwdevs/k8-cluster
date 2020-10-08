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
#ssh k8admin@192.168.50.169 kubeadm token create --print-join-command >> joincluser.sh
echo "Join cmd and token saved in joincluster.sh"
sleep 5

## Worker 1
clear
cd $K8DIR/Vagrant/Worker/
cp -av $K8DIR/Vagrant/Worker/Vagrantfile .
cp -av $K8DIR/Vagrant/Worker/bootstrap.sh .
echo "Deploying Kubernetes Worker Nodes"
vagrant up --provider=virtualbox --provision

#Join Vagrant node 1
vagrant ssh k8-node-1 -c 'sudo hostnamectl set-hostname kubernetes-node-1'
vagrant ssh k8-node-1 -c 'sudo kubeadm join 192.168.50.169:6443 --token yza5q0.qd1bzjgrnipf5s8s --discovery-token-ca-cert-hash sha256:bb61bfab83131a734f0e5a93f9c4715671bc2aafd3a2b59033307cbfb7673cd7'

#Join Vagrant node 2
vagrant ssh k8-node-2 -c 'sudo hostnamectl set-hostname kubernetes-node-2'
vagrant ssh k8-node-2 -c 'sudo kubeadm join 192.168.50.169:6443 --token yza5q0.qd1bzjgrnipf5s8s --discovery-token-ca-cert-hash sha256:bb61bfab83131a734f0e5a93f9c4715671bc2aafd3a2b59033307cbfb7673cd7'

#Join Vagrant node 3
vagrant ssh k8-node-3 -c 'sudo hostnamectl set-hostname kubernetes-node-3'
vagrant ssh k8-node-3 -c 'sudo kubeadm join 192.168.50.169:6443 --token yza5q0.qd1bzjgrnipf5s8s --discovery-token-ca-cert-hash sha256:bb61bfab83131a734f0e5a93f9c4715671bc2aafd3a2b59033307cbfb7673cd7'
