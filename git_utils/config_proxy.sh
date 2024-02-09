#!/usr/bin/env bash

set -e

# config the proxy
# please modify the proxy to yours
git config --global http.proxy 127.0.0.1:7890
git config --global https.proxy 127.0.0.1:7890

# show the configs
git config http.proxy
git config https.proxy