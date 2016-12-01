#!/bin/bash - 
#===============================================================================
#
#          FILE: Nochehuatl_task3.sh
# 
#         USAGE: ./Nochehuatl_task3.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Seth Johns (), sethjohns@mail.weber.edu
#  ORGANIZATION: 
#       CREATED: 11/24/2016 20:12
#      REVISION:  ---
#===============================================================================

# set -o nounset 
# Treat unset variables as an error
usage="Usage: $0 [-f  BeginDate YYYYMMDD] [-t EndDate YYYYMMDD] [-e Email] [-u UserName] [-p Password] all options are required"

if [[ "$#" == 6 ]]
then
	echo -e "$usage \nNot long enough"
	exit 1
fi

while getopts ":f:t:e:u:p:" opt
do
	case $opt in
		f) beginDate=$OPTARG
			;;
		t) endDate=$OPTARG
			;;
		e) email=$OPTARG
			;;
		u) userName=$OPTARG
			;;
		p) password=$OPTARG
			;;
		*) echo -e $usage
			exit 2 
			;;
	esac
done
./Nochehuatl_task2.py $beginDate $endDate

#ftp -nv $host << End_of_Line
#user  $userName $password
#pwd
#ls -la
#cd /data
#pwd
#ls -la
#End_of_Line



exit 0

