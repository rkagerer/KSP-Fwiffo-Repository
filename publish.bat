@echo off
del CKAN-meta-fwiffo.zip
REM -tzip for zip, -tgzip for gzip, -ttar for tar
"C:\Program Files (x86)\7-Zip\7z.exe" a -tzip -r -x@CKAN-meta-fwiffo\exclude.txt CKAN-meta-fwiffo.zip CKAN-meta-fwiffo\*.*
echo Remember to upload to GITHUB.
pause
