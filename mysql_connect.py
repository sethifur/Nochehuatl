#!/usr/bin/env python3
import sys
from dbconfig import read_db_config
import mysql.connector
from mysql.connector import Error, MySQLConnection

def connect(begin,end):
    '''
    connect to SQL Database with config file
    '''
    db_config = read_db_config()
    
    try:
        print('Connection to MySQL database..')
        conn = MySQLConnection(**db_config)
        
        if conn.is_connected():
            print('Connection Established!!')
        else:
            print('Connection Failed')

        #Select some data
        cursor = conn.cursor()
        cursor.execute("SELECT SUBSTRING(t.trans_id,1,5), DATE_FORMAT(t.trans_date,'%Y%m%d%h%i'),SUBSTRING(t.card_num, 9,14),SUBSTRING(tl.qty,1,2),tl.amt,p.prod_desc FROM products p INNER JOIN trans t INNER JOIN trans_line tl WHERE p.prod_num = tl.prod_num AND tl.trans_id = t.trans_id AND t.trans_date BETWEEN %s AND %s;",(begin,end))

        #row = cursor.fetchone() #select first row
        rows = cursor.fetchall() #select all rows

        #for row in rows:
            #print(row)

        #print('Total Row(s):',cursor.rowcount)
        #while row is not Non:
        #    print(row)
        #    row = cursor.fetchone() #select next row

    except Error as error:
        print(error)
    finally:
        conn.close()
        print('Connection Close')
    return rows

#Main function
def main():
    '''
    Test Function
    '''
    connect()
    return

if __name__ == '__main__':
    main()
    exit(0)
