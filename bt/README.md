### bt那个啥脚本

***  
#### 完整食用教程  
# 调用官方文件
`wget --no-check-certificate -O go.sh https://raw.githubusercontent.com/nomoneynolife/NetworkScript/main/bt/go.sh && chmod +x go.sh && ./go.sh`  
* 再次运行本脚本只需要输入`./gost.sh`回车即可  
# 调用备份文件
`wget --no-check-certificate -O gobak.sh https://raw.githubusercontent.com/nomoneynolife/NetworkScript/main/bt/gobak.sh && chmod +x gobak.sh && ./gobak.sh`  
* 再次运行本脚本只需要输入`./gost.sh`回车即可 
 
修改图标(鸡肋)  
找到/www/server/panel/data目录，编辑plugin.json文件  
搜索"recommend"，找到前面的pro和ltd  
-1表示无pro为0时为专业版永久授权  
请填写时间戳或者99999999  
保存文件刷新首页即可  
但是你在点击续费之后，plugin.json会刷新  
解决方法如下：  
打开/www/server/panel/class目录，找到panelplugin.py文件  
将`public.ExecShell('rm -f /tmp/bmac_*')`注释掉即可  
保存文件后重启服务器即可  
