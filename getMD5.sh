#!/bin/sh
# Author: feihu @ Gu-Lab (http://gu.ee.tsinghua.edu.cn/)
# Reop for this script is at https://github.com/lpffeihu/QTunetBash

md5cmd=
`command -v md5 >/dev/null 2>&1` && md5cmd=md5
`command -v md5sum >/dev/null 2>&1` && md5cmd=md5sum
if [ "$md5cmd" == "" ]; then
    echo "I can find a md5 calculate program in your system. Will exit now."
    exit 1;
fi

echo "Please input your password, followed by [Enter] (Password whould not show on screen):";
read -s PASSWORD;
MD5PASSWORD=`printf "$PASSWORD" | $md5cmd`
echo 'Your MD5PASSWORD is:'
echo $MD5PASSWORD
