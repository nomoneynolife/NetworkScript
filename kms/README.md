# KMS 激活服务器  

# LINUX安装KMS服务

- 一键安装脚本
- `wget --no-check-certificate https://github.com/teddysun/across/raw/master/kms.sh && chmod +x kms.sh && ./kms.sh`

* 查看端口
* `netstat -nxtlp | grep 1688`

- 启动
- `/etc/init.d/kms start`

* 停止
* `/etc/init.d/kms stop`

- 重启
- `/etc/init.d/kms restart`

* 状态
* `/etc/init.d/kms status`

- 卸载
- `./kms.sh uninstall`

# Windows安装KMS服务

- 下载对应的文件
- 放到自己喜欢的位置
- 双击运行


用法；http  
vlmcs是用于检测KMS服务器  
vlmcsd是用于搭建KMS服务器  
vlmcsdmulti是上面两者的综合  

[源代码](https://forums.mydigitallife.net/threads/emulated-kms-servers-on-non-windows-platforms.50234/ "源码")

- 更新最新版；2020-3-29
