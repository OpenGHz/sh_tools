#!/usr/bin/env bash

# 删除除了pip和conda自带包之外的所有包

set -e

pip freeze | xargs pip uninstall -y
conda install --revision 0