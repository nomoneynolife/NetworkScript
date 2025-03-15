#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

cd ~
setup_path="/www"

clear
echo "                                                           "
echo "###########################################################"
echo "#                                                         #"
echo "#  宝塔一键那个啥脚本                                       #"
echo "#                                                         #"
echo "#  Last Modified: 2025-03-15                              #"
echo "#                                                         #"
echo "#  Supported by axiba                                     #"
echo "#                                                         #"
echo "###########################################################"
echo "                                                           "
echo ""
echo "请选择:"
echo "  1)  安装宝塔 7.7.0"
echo "  2)  "
echo "  3)  "
echo "  4)  "
echo "  5)  优化体验(必选)"
echo "  6)  "
echo "  7)  "
echo "  8)  "
echo "  9)  卸载宝塔""
echo -n "请输入编号: "
echo ""
read N
case $N in
  1) version='LinuxPanel-7.7.0' ; choice=1 ;;
  2)  ;;
  3)  ;;
  4)  ;;
  5)  choice=5 ;;
  6)  ;;
  7)  ;;
  8) ;;
  9) choice=9 ;;
  *) echo "Wrong input!" ;;
esac

if [ $choice -eq 1 ]; then
echo -e "安装宝塔 7.7.0"
curl -sSO https://raw.githubusercontent.com/nomoneynolife/NetworkScript/refs/heads/main/bt/install/install_panel.sh && bash install_panel.sh
fi

if [ $choice -eq 5 ]; then
echo -e 优化体验
sed -i "s|if (bind_user == 'True') {|if (bind_user == 'REMOVED') {|g" /www/server/panel/BTPanel/static/js/index.js
rm -rf /www/server/panel/data/bind.pl
wget -O total.zip https://raw.githubusercontent.com/nomoneynolife/NetworkScript/main/bt/total.zip
unzip -o total.zip -d ${setup_path}/server/panel/plugin > /dev/null
rm -f total.zip
wget -O panelPlugin.zip https://raw.githubusercontent.com/nomoneynolife/NetworkScript/main/bt/panelPlugin.zip
unzip -o panelPlugin.zip -d ${setup_path}/server/panel/class/ > /dev/null
rm -f panelPlugin.zip
/etc/init.d/bt restart
echo -e "enjoy"
fi

if [ $choice -eq 9 ]; then
curl -sSO https://raw.githubusercontent.com/nomoneynolife/NetworkScript/refs/heads/main/bt/install/bt-uninstall.sh && bash bt-uninstall.sh
fi
