#!/usr/bin/env bash

set -e

if [ $1 = "unset" ]; then
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    exit 0
fi

# config the proxy
# please modify the proxy to yours
git config --global http.proxy 127.0.0.1:7890
git config --global https.proxy 127.0.0.1:7890

# show the configs
git config http.proxy
git config https.proxy