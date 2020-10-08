#!/usr/bin/env bash
#This sets up everything for a K8 Worker on Vagrant
hostnamectl set-hostname kubernetes-worker4
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
sudo systemctl enable docker.service --now
sudo systemctl enable kubelet.service --now
apt-mark hold kubelet kubeadm kubectl
usermod -aG docker vagrant
rm -f /etc/kubernetes/pki/ca.crt
rm -f /etc/kubernetes/kubelet.conf

sudo kubeadm reset -f
sleep 3 
while true
# Ask question to see if K8 master needs shutting down
while true; do
    read -p "Do you wish to join this node to the Kubernetes cluser?" yn
    case $yn in
        [yes]* ) echo "Joining the K8 cluster"; sudo kubeadm join 192.168.88.169:6443 --token 3spjo6.y57m27tiyovbikf7 --discovery-token-ca-cert-hash sha256:867f0563363d956012fe5a848a2059b9085db7bd1281bffbe310b3948cc23a5a; break;;
        [no]* ) echo "Exiting program"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
