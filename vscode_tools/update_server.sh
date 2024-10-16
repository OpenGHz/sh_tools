# !/bin/sh

set -e

remote_ssh=orangepi@192.168.31.162
remote_main_dir=/home/orangepi

server_name=vscode-server-linux-x64
cli_name=vscode_cli_alpine_x64_cli

commit_id=$(code --version | awk 'NR==2 {print $0}')

# scp $server_name.tar.gz $remote_ssh:$remote_main_dir
# scp $cli_name.tar.gz $remote_ssh:$remote_main_dir

# in remote
ssh -T "$remote_ssh" <<EOF
cd ${remote_main_dir}

# tar -zxvf ${server_name}.tar.gz
# tar -zxvf ${cli_name}.tar.gz

server_dir=~/.vscode-server/cli/servers/Stable-${commit_id}
mkdir -p ${server_dir}
mv ${server_name} ${server_dir}/server
mv code ~/.vscode-server/code-${commit_id}
# chmod -R 700 /home/${user}/.vscode-server/
EOF

# https://blog.csdn.net/qq_43623902/article/details/136258880
