#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Please input the cuda version you want to install (e.g. 11.0)!"
    exit 1
fi

sudo -E apt-get -y install cuda-toolkit-${1}