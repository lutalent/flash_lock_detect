#!/bin/bash
origin_file="D:\work\SMARTnext_sensor\bin\sensor,bin"
read_file="D:\work\SMARTnext_sensor\bin\1.bin"

if [ -f ${read_file} ]; then
	read_bin=`awk {'print $0'} ${read_file}`
fi

if [ -f ${origin_file} ]; then
	origin_bin=`awk {'print $0'} ${origin_file} | sed 'l/\20'`
fi

if [ "${read_bin}" == "${origin_bin}" ]; then
	echo "Unsecurity"
fi