#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

cd ~
download_Url='http://download.bt.cn'
setup_path="/www"

clear
echo "                                                           "
echo "###########################################################"
echo "#                                                         #"
echo "#  宝塔一键那个啥脚本                                     #"
echo "#                                                         #"
echo "#  Last Modified: 2021-06-05                              #"
echo "#                                                         #"
echo "#  Supported by axiba                                     #"
echo "#                                                         #"
echo "###########################################################"
echo "                                                           "
echo ""
echo "请选择:"
echo "  1)  更新到宝塔 7.5.2"
echo "  2)  更新到宝塔 7.6.0"
echo "  3)  "
echo "  4)  "
echo "  5)  "
echo "  6)  "
echo "  7)  "
echo "  8)  优化体验(必选)"
echo "  9)  全新安装"
echo "  10) 卸载宝塔"
echo ""
echo -n "请输入编号: "
read N
case $N in
  1) version='LinuxPanel-7.5.2' ; choice=1 ;;
  2) version='LinuxPanel-7.6.0' ; choice=2 ;;
  3)  ;;
  4)  ;;
  5)  ;;
  6)  ;;
  7)  ;;
  8) choice=8 ;;
  9) choice=9 ;;
  10) choice=10 ;;
  *) echo "Wrong input!" ;;
esac

if [ $choice -eq 1 ] || [ $choice -eq 2 ]; then
version_path=$version
echo -e "停止bt面板"
/etc/init.d/bt stop
echo -e "拉取${version}版本"
wget -O panel.zip ${download_Url}/install/update/${version}.zip
echo -e "覆盖中"
unzip -o panel.zip -d ${setup_path}/server/ > /dev/null
rm -f panel.zip
echo -e "启动bt面板"
/etc/init.d/bt start
fi

if [ $choice -eq 8 ]; then
echo -e 优化体验
sed -i "s|if (bind_user == 'True') {|if (bind_user == 'REMOVED') {|g" /www/server/panel/BTPanel/static/js/index.js
rm -rf /www/server/panel/data/bind.pl
wget -O total.zip https://raw.axiba.ml/nomoneynolife/NetworkScript/main/bt/total.zip
unzip -o total.zip -d ${setup_path}/server/panel/plugin > /dev/null
rm -f total.zip
wget -O panelPlugin.zip https://raw.axiba.ml/nomoneynolife/NetworkScript/main/bt/panelPlugin.zip
unzip -o panelPlugin.zip -d ${setup_path}/server/panel/class/ > /dev/null
rm -f panelPlugin.zip
/etc/init.d/bt restart
echo -e "enjoy"
fi

if [ $choice -eq 10 ]; then
wget ${download_Url}/install/bt-uninstall.sh && sh bt-uninstall.sh
fi

if [ $choice -eq 9 ]; then
Get_Dist_Name()
{
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
        DISTRO='Aliyun'
        PM='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "Deepin" /etc/issue || grep -Eq "Deepin" /etc/*-release; then
        DISTRO='Deepin'
        PM='apt'
    elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        DISTRO='Raspbian'
        PM='apt'
    else
        DISTRO='unknow'
    fi
#    echo $DISTRO;
}
Get_Dist_Name

if [ $DISTRO = "CentOS" ] ; then
echo "系统版本为CentOS，为您运行对应的版本"
wget -O install.sh ${download_Url}/install/install_6.0.sh && sh install.sh
elif [ $DISTRO = "Ubuntu" ] ; then
echo "系统版本为Ubuntu，为您运行对应的版本"
wget -O install.sh ${download_Url}/install/install-ubuntu_6.0.sh && sudo bash install.sh
elif [ $DISTRO = "Deepin" ] ; then
echo "系统版本为Deepin，为您运行对应的版本"
wget -O install.sh ${download_Url}/install/install-ubuntu_6.0.sh && sudo bash install.sh
elif [ $DISTRO = "Debian" ] ; then
echo "系统版本为Debian，为您运行对应的版本"
wget -O install.sh ${download_Url}/install/install-ubuntu_6.0.sh && bash install.sh
elif [ $DISTRO = "Fedora" ] ; then
echo "系统版本为Fedora，为您运行对应的版本"
wget -O install.sh ${download_Url}/install/install_6.0.sh && bash install.sh
else
echo "What?"
echo "你这是神马系统，脚本还未支持！"
echo "请手动输入命令安装 wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh"
fi
fi
