#!/usr/bin/env bash

set -e

if [ $1 = "unset" ]; then
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    exit 0
elif [ $1 = "get" ]; then
    git config --global --get http.proxy
    git config --global --get https.proxy
    exit 0
elif [ $1 = "set" ]; then
    git config --global http.proxy 127.0.0.1:7890
    git config --global https.proxy 127.0.0.1:7890
fi

# show the configs
git config http.proxy
git config https.proxy