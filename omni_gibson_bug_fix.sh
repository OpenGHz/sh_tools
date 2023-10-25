#!/usr/bin/env bash
set -eo &> /dev/null

[ "$1" = 'bug0' ] && sed -i "s/PATH}\/python -c/PATH}\/python.sh -c/g" setup.sh && exit
[ "$1" = 'bug2' ] && conda install -y scipy && exit
if [ "$1" = 'bug3' ];then
    sed -i 's/\. ${MY_DIR}\/setup_python_env.sh/source ${MY_DIR}\/setup_python_env.sh/g' "${ISAAC_PATH}"/setup_conda_env.sh
    sed -i 's|^\(.*SCRIPT_DIR=\).*|SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" \&\& pwd )"|' "${ISAAC_PATH}"/setup_python_env.sh
    exit
fi

[ "$1" != 'bug1' ] && exit

# get target file dir
CONDA_ACT_FILE="${CONDA_PREFIX}/etc/conda/activate.d/env_vars.sh"

# get isaac sim dir from target file
target_line=$(sed -n '/setup_conda_env.sh/p' "${CONDA_ACT_FILE}")
temp=${target_line#*'/'}
isaac_sim_dir=/${temp%'/'*}/

# fix target file
sed -i '/setup_conda_env.sh/d' "${CONDA_ACT_FILE}"
echo "now_dir=\$(pwd)" >> "${CONDA_ACT_FILE}"
echo "cd ${isaac_sim_dir}" >> "${CONDA_ACT_FILE}"
echo "source setup_conda_env.sh" >> "${CONDA_ACT_FILE}"
echo "cd \${now_dir}" >> "${CONDA_ACT_FILE}"
echo "unset now_dir" >> "${CONDA_ACT_FILE}"
