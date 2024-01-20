#!/usr/bin/env bash

set -e

target_path="${HOME}/.config/pip"

mkdir -p "${target_path}"

echo "[global]" > ${target_path}/pip.conf

echo index-url=https://pypi.tuna.tsinghua.edu.cn/simple >> ${target_path}/pip.conf

echo "timeout = 6000" >> ${target_path}/pip.conf

echo "[install]" >> ${target_path}/pip.conf

echo "trusted-host=pypi.tuna.tsinghua.edu.cn" >> ${target_path}/pip.conf

echo "disable-pip-version-check = true" >> ${target_path}/pip.conf

echo "******当前pip配置******"
pip config list

# 豆瓣 ··············· https://pypi.douban.com/
 
# 华中理工大学 ········ https://pypi.hustunique.com/ 
 
# 山东理工大学 ········ https://pypi.sdutlinux.org/ 
 
# 中国科学技术大学 ···· https://pypi.mirrors.ustc.edu.cn/ 
 
# 阿里云 ············· https://mirrors.aliyun.com/pypi/simple/  
 
# 清华大学 ··········· https://pypi.tuna.tsinghua.edu.cn/simple/