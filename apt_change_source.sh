#!/usr/bin/env bash

set -e

# 仅适用于14.04及以上版本！
# 仅限于将原始源替换为国内源，不适合将国内源替换为其它国内源！
# 默认更换为中科大源，传入学校/公司英文缩写可更换为对应学校源，如：ustc，thu，ali, 163

if [ -f /etc/apt/sources.list.bak ]; then
    echo "The source has been changed, please do not repeat the operation!"
    exit 1
else
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
fi

if [ -z $1 ]; then
    source_name='ustc.edu.cn'
    echo "No parameter is passed, the source will be replaced with the default source of the University of Science and Technology of China."
elif [ $1 == "thu" ]; then
    source_name=’tuna.tsinghua.edu.cn’
elif [ $1 == "ali" ]; then
    source_name=’aliyun.com’
elif [ $1 == "163" ]; then
    source_name=’163.com’
elif [ $1 == "ustc" ]; then
    source_name=’ustc.edu.cn’
else
    echo "The parameter is not supported!"
    exit 1
fi

# sudo sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
sudo sed -i "s@//.*archive.ubuntu.com@//mirrors.${source_name}@g" /etc/apt/sources.list
sudo apt-get update

# 一般情况下，将 /etc/apt/sources.list 文件中 Ubuntu 
# 默认的源地址 http://archive.ubuntu.com/ 替换为 http://mirrors.ustc.edu.cn/ 即可。

# 因镜像站同步有延迟，可能会导致生产环境系统不能及时检查、安装上最新的安全更新，
# 不建议替换 security 源。 如果有官方源下载速度不理想等问题，想通过镜像站下载安全更新， 
# 可以将 security 源地址从 http://security.ubuntu.com/ 替换为 https://mirrors.ustc.edu.cn/，
# 即 sudo sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list。
# 使用 HTTPS 可以有效避免国内运营商的缓存劫持。即 sudo sed -i 's/http:/https:/g' /etc/apt/sources.list。

# # 默认注释了源码仓库，如有需要可自行取消注释
# deb https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse
# # deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse

# deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
# # deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse

# deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
# # deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse

# deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
# # deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse

# 如要用于其他版本，把 jammy 换成其他版本代号即可: 22.04：jammy；20.04：focal；18.04：bionic；16.04：xenial；14.04：trusty。

# 参考资料
# https://mirrors.ustc.edu.cn/help/ubuntu.html