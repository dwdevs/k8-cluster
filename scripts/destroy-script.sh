#!/usr/bin/env bash
K8DIR=/Users/don.wall/Development/k8-project/

## Worker 1
cd $K8DIR/Vagrant/Worker/
echo "destroying Workers"
vagrant destroy --force

## Worker 2
#cd $K8DIR/Vagrant/Worker2/
#echo "destroying Worker 2"
#vagrant destroy --force

## Worker 3
#cd $K8DIR/Vagrant/Worker3/
#echo "destroying Worker 3"
#vagrant destroy --force

## Worker 4
#cd $K8DIR/Vagrant/Worker4/
#echo "destroying Worker 4"
#vagrant destroy --force

## Worker 5
#cd $K8DIR/Vagrant/Worker5/
#echo "destroying Worker 5"
#vagrant destroy --force
