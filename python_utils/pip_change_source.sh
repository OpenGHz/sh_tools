#!/usr/bin/env bash

set -e

if [ -z $1 ]; then
    host=’pypi.tuna.tsinghua.edu.cn’
    suffix='simple'
    echo "No parameter is passed, the source will be replaced with the default source of the Tsinghua University."
elif [ $1 == "thu" ]; then
    host=’pypi.tuna.tsinghua.edu.cn’
    suffix='simple'
elif [ $1 == "ali" ]; then
    host=’mirrors.aliyun.com’
    suffix='pypi/simple'
elif [ $1 == "ustc" ]; then
    host=’pypi.mirrors.ustc.edu.cn’
elif [ $1 == "sdut" ]; then
    host=’pypi.sdutlinux.org’
elif [ $1 == "hust" ]; then
    host=’pypi.hustunique.com’
elif [ $1 == "douban" ]; then
    host=’pypi.douban.com’
else
    echo "The parameter is not supported!"
    exit 1
fi

target_path="${HOME}/.config/pip"

mkdir -p "${target_path}"

echo "[global]" > ${target_path}/pip.conf

echo index-url=https://${host}/${suffix} >> ${target_path}/pip.conf

echo "timeout = 6000" >> ${target_path}/pip.conf

echo "[install]" >> ${target_path}/pip.conf

echo "trusted-host=${host}" >> ${target_path}/pip.conf

echo "disable-pip-version-check = true" >> ${target_path}/pip.conf

echo "******当前pip配置******"
pip config list

# 豆瓣 ··············· https://pypi.douban.com/
 
# 华中理工大学 ········ https://pypi.hustunique.com/ 
 
# 山东理工大学 ········ https://pypi.sdutlinux.org/ 
 
# 中国科学技术大学 ···· https://pypi.mirrors.ustc.edu.cn/ 
 
# 阿里云 ············· https://mirrors.aliyun.com/pypi/simple/  
 
# 清华大学 ··········· https://pypi.tuna.tsinghua.edu.cn/simple/