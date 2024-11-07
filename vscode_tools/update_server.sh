# !/bin/sh

set -e

remote_ssh=orangepi@192.168.11.200
remote_main_dir=/home/orangepi

server_name=vscode-server-linux-x64
cli_name=vscode_cli_alpine_x64_cli

commit_id=$(code --version | awk 'NR==2 {print $0}')

scp $HOME/$server_name.tar.gz $remote_ssh:$remote_main_dir
scp $HOME/$cli_name.tar.gz $remote_ssh:$remote_main_dir

# in remote
ssh -T "$remote_ssh" <<EOF
cd ${remote_main_dir}

tar -zxvf ${server_name}.tar.gz
tar -zxvf ${cli_name}.tar.gz

servers_dir=~/.vscode-server/cli/servers
server_folder=Stable-${commit_id}
server_dir=${servers_dir}/${server_folder}
mkdir -p ${server_dir}
mv ${server_name} ${server_dir}/server
mv code ~/.vscode-server/code-${commit_id}
sed -i "s/\]/,\"$server_folder\"]/" ${servers_dir}/lru.json
# chmod -R 700 /home/${user}/.vscode-server/
rm -f ${server_name}.tar.gz
rm -f ${cli_name}.tar.gz
EOF

# https://blog.csdn.net/qq_43623902/article/details/136258880
