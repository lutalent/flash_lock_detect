#!/bin/bash
read_file="mem.bin"

# offset of memory
OFFSET_MEM="4 8 16 20 28"

# values in the offset
declare -A offset_val=(
			["4"]="d5000010"
			["8"]="e3000010"
			["16"]="e7000010"
			["20"]="e9000010"
			["28"]="00000000"
			)

result="PASS"
if [ -f ${read_file} ]; then
	# check if the file is 0kb
	if [ `stat -c %s ${read_file}` != 32 ];then
		result="FAIL"
		echo "FileRead"
	else
	# check the value of the responding offset
	for OFFSET in $OFFSET_MEM
	do
		read_val=`xxd -s ${OFFSET} -l 4 -p ${read_file}`
		#echo $read_val
		if [ "${read_val}" == "${offset_val["${OFFSET}"]}" ]; then
			result="FAIL"
			break
		fi
	done
	fi
else
	echo "No file"
fi

if [ "x${result}" == "xPASS" ]; then
	echo "passed"
else
    echo "failed"
fi

read -p "Press any key to continue..." var

