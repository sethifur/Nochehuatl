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

#Should send emails based on the exit codes of the task2.py call
if [[ $? -eq -1 ]]
then
mail -s "The create_report program exit with code -1" $email <<< "Bad Input parameters $beginDate to $endDate"
echo "Exit code -1. Email sent to $email"
fi

if [[ $? -eq -2 ]]
then
mail -s "The create_report program exit with code -2" $email <<< "No transactions available from $beginDate to $endDate"
echo "Exit code -2. Email sent to $email"
fi

#Beginning of FTP code
USERN=$userName
PASSWD=$password

#HOSTNAME OF YOUR FTP SERVER
#CHANGE TO OWN ADDRESS FOR TESTING
HOST='137.190.19.102'

#Not sure if correct file name!
filename=company_trans_$beginDate_$endDate.dat
`gzip $filename`
mv $filename.gz hw8Out.zip

#Issue with put due to previous file name errors. 
if [[ -n "$USERN" && -n "$PASSWD" ]]
then
	echo "Using $USERN FTP account"
	ftp -inv $HOST << EOF
	user $USERN $PASSWD
	cd .
	put hw8Out.zip
	bye
EOF
fi

mail -s "Successfully transfer file ($HOST)" $email <<< "Successfully created a transaction report from $beginDate to $endDate"
echo "Email has been sent to $email"


exit 0

