@echo off

GOTO hardCoded

:programmed
:: Google DNS
set DNS1=8.8.8.8
set DNS2=8.8.4.4

for /f "tokens=1,2,3*" %%i in ('netsh int show interface') do (
    if %%i equ Enabled (
        echo Changing "%%l" : %DNS1% + %DNS2%
        netsh int ipv4 set dns name="%%l" static %DNS1% primary validate=no
        netsh int ipv4 add dns name="%%l" %DNS2% index=2 validate=no
    )
)

ipconfig /flushdns

:hardCoded
netsh interface ip set dns name="Wi-Fi" static 8.8.8.8 primary validate=no
netsh interface ip add dns name="Wi-Fi"  8.8.8.4 index=2 validate=no
ipconfig /flushdns

exit
