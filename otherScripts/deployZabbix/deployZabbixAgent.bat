@echo off

setlocal

set install_target=C:\zabbix
set source_dir=%~dp0
set base_conf=%source_dir%conf\zabbix_agentd.win_base.conf
set target_conf="%source_dir%conf\zabbix_agentd.win.conf"
set fqdnhostname="%COMPUTERNAME%.%USERDNSDOMAIN%"

rem cd /d %source_dir%

powershell -command "(get-content %base_conf%) | foreach-object { $_ -replace 'REPLACETHISHOSTNAME', '%fqdnhostname%' } | Set-Content %target_conf%"

mkdir %install_target%

echo %install_target% 
echo %source_dir%
xcopy "%source_dir%." "%install_target%" /S /Y

%install_target%\bin\win64\zabbix_agentd.exe --config "%target_conf%" --install

sc start "Zabbix Agent"

pause