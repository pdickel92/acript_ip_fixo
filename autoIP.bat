@ECHO OFF
echo.
echo ===============================================================================================
echo.
echo Esse programa ira automatizar o processor de insercao de IP Statico.
echo.
echo ===============================================================================================
echo.

REM [VARIÁVEIS QUE IRÃO ARMAZENAR INFORMAÇÕES DE IP, como gateway, dns e o proprio IP...]
set INTERFACE=Wi-Fi
set IP=192.168.1.106
set MASCARA=255.255.255.0
set GATEWAY=192.168.1.1
set DNS1=177.70.78.10
set DNS2=177.70.66.10

:CONFIRMAR
echo.
echo Por Favor, escolha o que deseja fazer?
echo.
echo [F] IP FIXO
echo [D] IP DINAMICO - AUTOMATICO 
echo [C] CANCELAR
echo.
echo Por favor, digite F, D ou C:
set/p "alternativa=>"
if %alternativa%==f goto FIXO
if %alternativa%==F goto FIXO
if %alternativa%==d	goto AUTOMATICO
if %alternativa%==D goto AUTOMATICO
if %alternativa%==c	goto FIM
if %alternativa%==C goto FIM
echo Por favor, digite uma opcao valida.
goto CONFIRMAR

:FIXO
 netsh interface ip set address name="%INTERFACE%" static %IP% %MASCARA% %GATEWAY%
 netsh interface ip set dnsservers name="%INTERFACE%" static %DNS1% primary no
 goto :FIM

:AUTOMATICO
 netsh interface ip set address name="%INTERFACE%" dhcp
 netsh interface ip set dnsservers name="%INTERFACE%" dhcp
 goto :FIM

:FIM
 exit 


