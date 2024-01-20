#!/usr/bin/env bash

set -e

# please modify the name and e-mail to yours
git config --global user.name OpenGHz
git config --global user.email 1352674740@qq.com
# git config --global user.password "123456"

# show the configs
git config user.name
git config user.email
# git config user.password

# https://zhuanlan.zhihu.com/p/120862483

# git config --global --unset user.name
# git config --global --unset user.email
# git config --global --unset user.password

# 在我们首次使用Git时，都是需要配置用户名(user.name)和邮箱(user.email)的。对于用户名和邮箱来说，有3个地方可以设置

# /etc/gitconfig，使用git config --system，这个是针对整个系统生效的，几乎不会使用
# ~/.gitconfig,使用 git config -- global,这个是针对用户的，对系统中这个用户的所有项目都生效，很常用
# 在项目的.git/config中设置，使用git config -- local,这是针对某个项目设置用户名和邮箱的
# 我们可以使用git config查看配置帮助