#!/usr/bin/env bash

set -e

if [ -z $1 ]; then
    echo "Usage: $0 [unset|get|set] [global|local]"
    exit 1
fi

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
elif [ $1 = "alias" ]; then
    echo "alias git_proxy_set='git config --global http.proxy 127.0.0.1:7890 && git config --global https.proxy 127.0.0.1:7890'" >> ~/."${SHELL##*/}"rc
    echo "alias git_proxy_unset='git config --global --unset http.proxy && git config --global --unset https.proxy'" >> ~/."${SHELL##*/}"rc
else
    echo "Usage: $0 [unset|get|set] [global|local]"
    exit 1
fi

# show the configs
git config $2 http.proxy
git config $2 https.proxy