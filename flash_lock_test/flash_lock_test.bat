
"C:\Program Files (x86)\SEGGER\JLinkARM_V458a\jlink.exe" read_mem.jlink

compare.sh
pause

if res=="Passed"
@echo "Passed"

pause
else
@echo "Failed"

pause
