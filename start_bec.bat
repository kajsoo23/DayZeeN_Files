@echo off
:start
::Server name
set serverName=test_23
::Server files location
set serverLocation="C:\Program Files (x86)\Steam\steamapps\common\DayZServer"
::Server Profile folder
set profile=Server1
::BEC location
set BECLocation="C:\Program Files (x86)\Steam\steamapps\common\DayZServer\BEC"
::Server Port
set serverPort=2302
::Server config
set serverConfig=serverDZ.cfg
::Server profile folder
set serverProfile=profileName
::Logical CPU cores to use (Equal or less than available)
set serverCPU=4
::mods (@modName;@anotherModname;@mod)
set mods="@CF;@VPPAdminTools;@RandomItemsPack"
::Sets title for terminal (DONT edit)
title %serverName% batch
::DayZServer location (DONT edit)
cd "%serverLocation%"
echo (%time%) %serverName% started.
::Launch parameters (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% -mod=%mods% -port=%serverPort% -profiles=%serverProfile% -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck
::Time in seconds before kill server process (14400 = 4 hours)
timeout 14390
taskkill /im DayZServer_x64.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start