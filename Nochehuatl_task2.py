#!/usr/bin/env python3
'''
Create_report.py
'''
import sys

def change_format(begin,end):
    '''
    changes the format of dates to YYYY-MM-DD HH:mm
    Args:
        begin is a date in YYYYMMDD
        end is a date in YYYYMMDD
    '''
    try:
        newBegin = begin[0:4] + '-' + begin[4:6] + '-' + begin[6:8] + " 00:00"
        newEnd = end[0:4] + '-' + end[4:6] + '-' + end[6:8] + ' 23:59'
    except(TypeError,ValueError):
        exit(-1)


# Main Function
def main():
    change_format(sys.argv[1],sys.argv[2])
    return

if __name__ == '__main__':
    #Call Main
    main()

    exit(0)
