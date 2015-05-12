@echo off
:home
echo.
echo     == WiFi HotSpot ==
echo.
echo    [1] Hotspot starten
echo    [2] Hotspot stoppen
echo    [3] Hotspot einrichten/aendern
echo    [4] Status einsehen
echo    [5] Hotspot deaktivieren
echo    [6] Beenden
echo.

set asw=0
set /p asw="Bitte Auswahl eingeben: "
echo.

if %asw%==1 goto start
if %asw%==2 goto stop
if %asw%==3 goto edit
if %asw%==4 goto status
if %asw%==5 goto deactivate
if %asw%==6 goto exit
goto home

:start
netsh wlan start hostednetwork
cls
goto home

:stop
netsh wlan stop hostednetwork
cls
goto home

:edit
set ssid=0
set /p ssid="Bitte einen Netzwerknamen eingeben: "
set key=0
set /p key="Bitte den Netzwerkschluessel eingeben (mind. 8 Zeichen): "
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key%
echo Bitte die Freigabe am Internetadapter aktivieren!
pause
cls
goto home

:status
netsh wlan show hostednetwork
pause
cls
goto home

:deactivate
netsh wlan set hostednetwork mode=disallow
cls
goto home

:exit
exit