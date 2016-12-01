#!/usr/bin/env python3
'''
Create_report.py
'''
import sys
from configparser import ConfigParser
from dbconfig import read_db_config
from mysql_connect import connect
import io

def change_format(begin,end):
    '''
    changes the format of dates to YYYY-MM-DD HH:mm
    Args:
        begin is a date in YYYYMMDD
        end is a date in YYYYMMDD
    '''
    if len(begin) != 8 or len(end) != 8:
        exit(-1)
    try:
        int(begin)
        int(end)
    except(TypeError,ValueError):
        exit(-1)
    try:
        newBegin = begin[0:4] + '-' + begin[4:6] + '-' + begin[6:8] + " 00:00"
        newEnd = end[0:4] + '-' + end[4:6] + '-' + end[6:8] + ' 23:59'
    except(TypeError,ValueError):
        exit(-1)
    con = connect(newBegin, newEnd)
    if con is None:
        exit(-2)
    else:
        dataFile = open("company_trans_%s_%s.dat"%(begin,end), "wb")
        for i in con:
            print(i)

# Main Function
def main():
    change_format(sys.argv[1],sys.argv[2])
    return

if __name__ == '__main__':
    #Call Main
    main()

    exit(0)
