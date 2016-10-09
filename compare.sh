#!/bin/bash
origin_file="D:\work\SMARTnext_sensor\bin\sensor.bin"
read_file="D:\work\SMARTnext_sensor\bin\1.bin"
set a -a
if [ -f ${read_file} ]; then
	read_bin=`xxd -l 20 ${read_file}`
fi

if [ -f ${origin_file} ]; then
	origin_bin=`xxd -l 20 ${origin_file}`
fi

if [ "${read_bin}" == "${origin_bin}" ]; then
	echo 1
	a=0
	export a
	read -p "Press any key to continue." var
        exit 0
else
        echo 2
	a=1
        export a
	read -p "Press any key to continue." var
        exit 1
fi
