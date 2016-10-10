#!/bin/bash
read_file="D:\work\SMARTnext_sensor\bin\1.bin"
i=2
set a -a
for((i=2;i<10;i=i+2))
do
if [ -f ${read_file} ]; then
	read_bin=`xxd -l 2 -c 2 -s $i -ps ${read_file}`
fi
if [ "${read_bin}" == "0010" ]; then
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
        continue;
fi
done