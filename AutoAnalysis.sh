#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#set -e
#set -x

if [ $# -eq 0 ] || [ "$1" == "-h" ]; then
    echo "用法：AutoAnalysis.sh [apk資料夾路徑]"
else
    ls -d ${1%.*}_reports || mkdir ${1%.*}_reports
    dir=${1%.*}_reports
    for apk in $(find $1 -maxdepth 1 -name "*.apk")
    do
	name=$(basename $apk .apk)
        /home/yrkuo/gu/details/dt/bin/python joe_security.py $apk > $dir/$name.txt
    done
fi

IFS=$SAVEIFS

