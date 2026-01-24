@echo off
REM Wrapper for sqlcl from vscode

setlocal 
c:/Users/VorleD/.vscode/extensions/oracle.sql-developer-25.3.0-win32-x64/dbtools/jdk/bin/java.exe -Djava.awt.headless=true -Duser.language=en -p c:/Users/VorleD/.vscode/extensions/oracle.sql-developer-25.3.0-win32-x64/dbtools/launch;c:/Users/VorleD/.vscode/extensions/oracle.sql-developer-25.3.0-win32-x64/dbtools/sqlcl/launch --add-modules ALL-DEFAULT --add-opens java.prefs/java.util.prefs=oracle.dbtools.win32 --add-opens jdk.security.auth/com.sun.security.auth.module=oracle.dbtools.win32 -m com.oracle.dbtools.launch sql -nolog
endlocal
