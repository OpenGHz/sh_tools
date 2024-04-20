#!/usr/bin/env bash

if [ "$1" = = "help" ] || [ "$1" == "-h" ];then
    echo "Usage: $0 <nvidia-driver-version> <proxy-url>"
    echo "Example: $0 545 '127.0.0.1:7890'"
    exit 0
fi

if [ -z "$1" ]; then
    echo "Please input the nvidia driver version you want to install (e.g. 545)!"
    exit 1
fi

if [ -z "$2" ]; then
    sudo apt install aptitude
    sudo aptitude install nvidia-driver-${1}
else
    sudo apt -o Acquire::http::Proxy="http://${2}/" install aptitude
    sudo aptitude -o Acquire::http::Proxy="http://${2}/" install nvidia-driver-${1}
fi