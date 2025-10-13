@echo off
REM Wrapper for sqlcl from vscode

setlocal 
c:/Users/VorleD/.vscode/extensions/oracle.sql-developer-25.2.2-win32-x64/dbtools/jdk/bin/java.exe --add-modules jakarta.ws.rs,jakarta.annotation,jakarta.inject,jakarta.xml.bind -Djava.awt.headless=true -p c:/Users/VorleD/.vscode/extensions/oracle.sql-developer-25.2.2-win32-x64/dbtools/lib/modules;c:/Users/VorleD/.vscode/extensions/oracle.sql-developer-25.2.2-win32-x64/dbtools/sqlcl/lib/modules --add-opens java.prefs/java.util.prefs=oracle.dbtools.common --add-opens org.eclipse.parsson/org.eclipse.parsson=orajsoda -m com.oracle.dbtools.app/com.oracle.dbtools.app.DatabaseToolsApplication sql -nolog
endlocal
