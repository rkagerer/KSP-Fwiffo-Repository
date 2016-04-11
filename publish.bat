@echo off

REM Not working; error code from sh script doesn't seem to propogate out of git-bash instance
REM CheckIfCurrent.sh ./ https://github.com/rkagerer/KSP-Fwiffo-Repository
REM if errorlevel 1 goto NOTCURRENT

del CKAN-meta-fwiffo.zip
REM -tzip for zip, -tgzip for gzip, -ttar for tar
"C:\Program Files (x86)\7-Zip\7z.exe" a -tzip -r -x@CKAN-meta-fwiffo\exclude.txt CKAN-meta-fwiffo.zip CKAN-meta-fwiffo\*.*
git commit -a
git push origin master
goto END

:NOTCURRENT
echo.
echo ************************ FAILED! *************************
echo Local copy is out of date.  Use GIT to pull changes first.
echo e.g. git pull origin master [--rebase]
echo **********************************************************
echo.

:END
pause
