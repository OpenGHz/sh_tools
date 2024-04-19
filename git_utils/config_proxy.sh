#!/usr/bin/env bash

set -e

if [ $1 = "unset" ]; then
    git config $2 --unset http.proxy
    git config $2 --unset https.proxy
    exit 0
elif [ $1 = "get" ]; then
    git config $2 --get http.proxy
    git config $2 --get https.proxy
    exit 0
elif [ $1 = "set" ]; then
    git config $2 http.proxy 127.0.0.1:7890
    git config $2 https.proxy 127.0.0.1:7890
fi

# show the configs
git config $2 http.proxy
git config $2 https.proxy