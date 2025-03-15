#!/bin/bash
# 优化版宝塔管理脚本
# 最后更新: 2024-03-15

# 初始化环境
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
setup_path="/www"

# 颜色定义
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
RESET='\033[0m'

# 清屏并显示标题
clear
cat << EOF

###########################################################
#                                                         #
#  BT Panel Management Script                             #
#                                                         #
#  Last Modified: 2024-03-15                              #
#                                                         #
#  Supported by axiba                                     #
#                                                         #
###########################################################

EOF

# 主菜单函数
show_menu() {
    echo -e "${YELLOW}请选择操作:${RESET}"
    echo " 1) 安装宝塔 7.7.0"
    echo " 5) 优化体验(必选)"
    echo " 9) 卸载宝塔"
    echo " q) 退出脚本"
}

# 安装函数
install_bt() {
    echo -e "${GREEN}正在安装宝塔 7.7.0...${RESET}"
    if wget -q -O install_panel.sh https://raw.githubusercontent.com/nomoneynolife/NetworkScript/refs/heads/main/bt/install/install_panel.sh && bash install_panel.sh; then
    else
        echo -e "${RED}错误：安装脚本下载失败，请检查网络连接！${RESET}"
        exit 1
    fi
}

# 优化函数
optimize_bt() {
    echo -e "${GREEN}正在优化面板体验...${RESET}"
    
    # 解除绑定
    sed -i "s|if (bind_user == 'True') {|if (bind_user == 'REMOVED') {|g" $setup_path/server/panel/BTPanel/static/js/index.js 2>/dev/null
    rm -rf $setup_path/server/panel/data/bind.pl 2>/dev/null
    
    # 安装插件
    if ! wget -O total.zip https://raw.githubusercontent.com/nomoneynolife/NetworkScript/main/bt/total.zip; then
        echo -e "${RED}错误：插件包下载失败${RESET}"
        return 1
    fi
    unzip -o total.zip -d $setup_path/server/panel/plugin/ >/dev/null
    rm -f total.zip
    
    # 更新面板文件
    if ! wget -O panelPlugin.zip https://raw.githubusercontent.com/nomoneynolife/NetworkScript/main/bt/panelPlugin.zip; then
        echo -e "${RED}错误：面板更新包下载失败${RESET}"
        return 1
    fi
    unzip -o panelPlugin.zip -d $setup_path/server/panel/class/ >/dev/null
    rm -f panelPlugin.zip
    
    # 重启服务
    /etc/init.d/bt restart
    echo -e "${GREEN}优化完成，请尽情使用！${RESET}"
}

# 卸载函数
uninstall_bt() {
    echo -e "${YELLOW}正在卸载宝塔面板...${RESET}"
    if wget -q -O bt-uninstall.sh https://raw.githubusercontent.com/nomoneynolife/NetworkScript/refs/heads/main/bt/install/bt-uninstall.sh && bash bt-uninstall.sh; then
    else
        echo -e "${RED}错误：卸载脚本下载失败，请检查网络连接！${RESET}"
        exit 1
    fi
}

# 主逻辑
while true; do
    show_menu
    echo -n -e "${BLUE}请输入操作编号: ${RESET}"
    read -r N
    
    case $N in
        1)  install_bt ;;
        5)  optimize_bt ;;
        9)  uninstall_bt ;;
        q|Q) echo -e "${GREEN}已退出脚本${RESET}"; exit 0 ;;
        *)  echo -e "${RED}无效输入，请重新选择！${RESET}" ;;
    esac
    
    echo ""
    read -p "按回车键继续..."
done
