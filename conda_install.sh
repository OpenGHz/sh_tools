#!/usr/bin/env bash

set -e

# get the lastest version py38 miniconda3
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-py38_4.9.2-Linux-x86_64.sh
# add execute permission
chmod u+x Miniconda3-py38_4.9.2-Linux-x86_64.sh
# install
./Miniconda3-py38_4.9.2-Linux-x86_64.sh
# remove the installer
rm Miniconda3-py38_4.9.2-Linux-x86_64.sh
# zsh check
# conda 安装的时候默认把环境变量加入到 bash 中，没有加入到 zsh 中，因此需要在 zsh 中手动加入 conda 的环境变量
if [ "$SHELL" = "/bin/zsh" ]; then
    echo "Detect using zsh, you need to add conda init cmd to ~/.zshrc (according to ~/.bashrc)"
fi
# do not auto activate base env
echo "Recommend: conda config --set auto_activate_base false"
