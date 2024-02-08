#!/usr/bin/env bash

# Please run this script as root: sudo ./config-cuda.sh

# Set up apt sources for nvidia drivers and CUDA toolkit
# And install proper nvidia drivers

set -x
set -e

apt-get update
apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/${distribution}/x86_64/cuda-${distribution}.pin -P /tmp
mv /tmp/cuda-${distribution}.pin /etc/apt/preferences.d/cuda-repository-pin-600
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/3bf863cc.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | tee /etc/apt/sources.list.d/cuda.list
apt-get update
apt-get install cuda-drivers -y