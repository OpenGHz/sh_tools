# !/bin/sh

cmt=$(code --version | awk 'NR==2 {print $0}')
if ls $HOME/vscode-server-linux-$plat.tar.gz* 1> /dev/null 2>&1;then
	rm -rf $HOME/vscode-server-linux-x64.tar.gz*
fi
wget -P $HOME https://vscode.download.prss.microsoft.com/dbazure/download/stable/$cmt/vscode-server-linux-x64.tar.gz
wget -P $HOME https://vscode.download.prss.microsoft.com/dbazure/download/stable/$cmt/vscode_cli_alpine_x64_cli.tar.gz