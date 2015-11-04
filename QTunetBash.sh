#!/bin/sh
# QTunetBash v0.02
# Comparable with the old Shell
# Author: feihu @ Gu-Lab (http://gu.ee.tsinghua.edu.cn/)
# Reop for this script is at https://github.com/lpffeihu/QTunetBash

# If you want to save your username and / or password, please set USERNAME
# and MD5PASSWORD. Do not put white spaces after =.
# MD5PASSWORD can be obtained with another script in this repo, getMD5.sh

USERNAME=
MD5PASSWORD=

Usage="Usage: QTunetBash.sh [options]\n"
Usage+="  For logging in and keeping online, you can run this script without options.\n"
Usage+="  Username, password can be put inside the script.\n"
Usage+="Options:\n"
Usage+="  -h, --help\tShow this page\n"
Usage+="  -o, --logout\tLogout"

# check md5 cal program in the system
md5cmd=
`command -v md5 >/dev/null 2>&1` && md5cmd=md5
`command -v md5sum >/dev/null 2>&1` && md5cmd=md5sum
if [ "$md5cmd" == "" ]; then
    echo "I can find a md5 calculate program in your system. Will exit now."
    exit 1;
fi

# check parameters
if [ $# -ne 1 ] && [ $# -ne 0 ]; then
    echo $Usage;
    exit 1;
fi
if [ $# -eq 1 ]; then
    if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        echo $Usage
        exit 0;
    elif [ "$1" == "-o" ] || [ "$1" == "--logout" ]; then
        message=`curl -s http://net.tsinghua.edu.cn/do_login.php -d "action=logout"`;
        echo $message;
        exit 0;
    else
        echo $Usage;
        exit 1;
    fi
fi

# input username and password
if [ "$USERNAME" = "" ]; then
    echo "Please input your username, followed by [Enter]:";
    read USERNAME;
fi
if [ "$MD5PASSWORD" = "" ]; then
    echo "Please input your password, followed by [Enter] (Password whould not show on screen):";
    read -s PASSWORD;
    MD5PASSWORD=`printf "$PASSWORD" | $md5cmd`
fi

# try login
logged1=`curl -s http://net.tsinghua.edu.cn/do_login.php -d "action=login&username=${USERNAME}&password={MD5_HEX}${MD5PASSWORD}&ac_id=1"`;
if [ "$logged1" != "" ]; then
    echo $logged1;
    onlineword=online
    if [ -z "${logged1##*$onlineword*}" ]; then
        echo "***Note that username and password is not checked. But I will keep running.";
    fi
    semiword=":"
    if [ -z "${logged1##*$semiword*}" ]; then
        exit 2;
    fi
fi

echo

# keep online
echo '*Now begin keeping online process. Press ^C to exit.'
while :
do
    sleep 30
    logged=`curl -s http://net.tsinghua.edu.cn/do_login.php -d "action=check_online"`;
    echo $logged
    if [ "$logged" = "not_online" ]; then
        logged1=`curl -s http://net.tsinghua.edu.cn/do_login.php -d "action=login&username=${USERNAME}&password={MD5_HEX}${MD5PASSWORD}&ac_id=1"`;
        if [ "$logged1" != "" ]; then
            echo $logged1;
        fi
    fi
done

