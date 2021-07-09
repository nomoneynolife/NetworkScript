#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

cd ~
download_Url='https://www.python.org/ftp/python'

clear
echo "                                                           "
echo "###########################################################"
echo "#                                                         #"
echo "#  python 一键安装脚本                                    #"
echo "#                                                         #"
echo "#  Last Modified: 2021-07-09                              #"
echo "#                                                         #"
echo "#  Supported by axiba                                     #"
echo "#                                                         #"
echo "###########################################################"
echo "                                                           "
echo ""
echo "请选择:"
echo "  1)  全新安装 (默认PY版本为2.7.5)"
echo ""
echo -n "请输入编号: "
read N
case $N in
  1) choice=1 ;;
  *) echo "请选择！！！" ;;
esac

if [ $choice -eq 1 ]; then
echo -e "检查系统已安装的版本"
python -V
python2 -V
python3 -V
echo -e "请输入需要安装的版本;比如 3.8.0 "
echo -e "必须严格输入版本号 x.x.x "
echo -e "版本查看 https://www.python.org/ftp/python/"
read
echo -e "安装组件"
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel wget gcc
sleep 3
echo -e "切换工作目录"
cd /usr/local/src
echo -e "拉取${REPLY}版本中"
wget -O Python-${REPLY}.tgz ${download_Url}/${REPLY}/Python-${REPLY}.tgz
echo -e "解压缩"
tar xf Python-${REPLY}.tgz
cd Python-${REPLY}
make && make install
echo -e "编译安装"
./configure --prefix=/usr/local/python
make && make install
echo -e "安装完成设置软链接"
echo -e "设置为python pip"
sleep 1
rm -rf /usr/bin/python
rm -rf /usr/bin/pip
ln -s /usr/local/python/bin/python3 /usr/bin/python
ln -s /usr/local/python/bin/pip3 /usr/bin/pip
echo -e "添加环境变量"
echo "PATH=$PATH:$HOME/bin:/usr/local/python/bin" >> /etc/profile
rm -rf Python-${REPLY}.tgz
echo -e "查看版本信息"
python3 -V
sleep 3
echo -e "安装完毕"
fi
