# Usage: source proxy.sh [off]

# 配置linux 代理
if [ $1 != "off" ]; then
    export {HTTP_PROXY,HTTPS_PROXY,ALL_PROXY,http_proxy,https_proxy,all_proxy}=http://127.0.0.1:7890
    export no_proxy="localhost, 127.0.0.0, ::1"
# 清理linux代理
else
    export {HTTP_PROXY,HTTPS_PROXY,ALL_PROXY,http_proxy,https_proxy,all_proxy}=
fi