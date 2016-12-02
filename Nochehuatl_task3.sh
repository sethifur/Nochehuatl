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
echo "$?"

USERN=$1
PASSWD=$2

#HOSTNAME OF YOUR FTP SERVER
#CHANGE TO OWN ADDRESS FOR TESTING
HOST='137.190.19.102'
filename=company_trans_$(beginDate)_$(endDate).dat
`gzip $filename`
mv $filename.gz hw8Out.zip

if [[ -n "$USERN" && -n "PASSWD" ]]
then
	echo "Using $USERN FTP account"
	ftp -inv $HOST << EOF
	user $USERN $PASSWD
	cd .
	put hw8Out.zip
	bye
EOF
fi



exit 0

