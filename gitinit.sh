#!/bin/bash
echo "# k8-cluster" >> README.md
git init
git add README.md
# Set global config:
git config --global user.name dwdevs
git config --global user.email don_w@hotmail.co.uk
git config --list

# Add remote origin & URL
git remote add origin ssh://git@github.com/dwdevs/k8-cluster.git
git remote set-url origin ssh://git@github.com/dwdevs/k8-cluster.git
git remote -v
read -p "Press [Enter] key to continue..."

# Now test by cloning repo
git clone ssh://git@github.com/dwdevs/k8-cluster.git
read -p "Press [Enter] key to continue..."

# Create a branch to work on
git checkout -b dwtest69
read -p "Press [Enter] key to continue..."

# Test git push works
echo "This is a test to show Git working in a branch" >> dwbranchtestgit.txt
git add -A
git commit -a -m "dwtesting Version Message Here"
git push --set-upstream origin dwtest69
