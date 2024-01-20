#!/usr/bin/env bash

# Set up apt sources for nvidia drivers and CUDA toolkit
# And install proper nvidia drivers

set -x
set -e

sudo apt-get update
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/${distribution}/x86_64/cuda-${distribution}.pin -P /tmp
mv /tmp/cuda-${distribution}.pin /etc/apt/preferences.d/cuda-repository-pin-600
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/3bf863cc.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | tee /etc/apt/sources.list.d/cuda.list
sudo apt-get update

sudo apt-get -y install cuda-drivers
