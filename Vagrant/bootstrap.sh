#!/usr/bin/env bash
#This sets up everything for a K8 Worker on Vagrant
#hostnamectl set-hostname kubernetes-workertest
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
apt-get update -y
apt-get install -y linux-headers-$(uname -r) build-essential dkms
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt-get install -y docker.io
apt-get install -y kubelet kubeadm kubectl
systemctl enable docker.service --now
systemctl enable kubelet.service --now
apt-mark hold kubelet kubeadm kubectl
usermod -aG docker vagrant
rm -f /etc/kubernetes/pki/ca.crt
rm -f /etc/kubernetes/kubelet.conf

kubeadm reset -f
sleep 3 
