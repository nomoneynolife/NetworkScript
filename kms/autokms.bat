@echo off
mode con cols=25 lines=2
color 3F
::网址：github.com/nomoneynolife/
::批处理：http://www.bathome.net/thread-43640-1-1.html
@echo off
for /f "tokens=2 delims==" %%1 in ('assoc .doc')do (
    for /f "tokens=2 delims==" %%2 in ('ftype %%1')do (
        for %%3 in (%%2)do (if not defined p set p=%%~dp3
        )
    )
)
echo %p%
cd "%p%"
c:
cls
::激活office
cscript ospp.vbs /sethst:kms.03k.org
cscript ospp.vbs /act
::激活windows
slmgr -skms kms.03k.org
slmgr -ato
pause&exit
