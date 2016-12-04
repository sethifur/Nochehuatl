

Nachehuatl_task3.sh is the .sh script that acts as a wrapper and runs the program.
	- It takes five arguments
	1) Begin date
	2) End date
	3) email
	4) username
	5) password
	
	- This program takes perameters and ensures proper data input ($usage).

	- It calls Nachehuatl_task2.py which provides formatting.

	- Uses return codes from Nachehuatl_task2.py to print user messages.

	- It creates a .zip file (hw8Out.zip) and ftp's it to the user.

	- It also emails the user.


Nachehuatl_task2.py is the .py module that provides formatting of the date

	- The mod contains a def named change_format() that takes 2 args
	1) begin - (which is the begin date provided by the user).
	2) end - (which is the end date provided by the user).

	- This module takes perameters and formats the dates (YYYY-MM-DD hh:mm).

	- It provides error corrction for Type and Value that passes error codes back to Nechehuatl_task3.sh to be printed.

	- It calls def connect() from mysql_connect.py(con).
	which passes in newBegin and new End as perameters.


mysql_connect.py is the .py module that provides the my sql connection

	- This mod takes 2 args
	1) newBegin (The formatted beginning date).
	2) newEnd (The formatted end date).

	- It calls read_db_config() from dbconfig.py to make a db connection.
	
	- Once a conn is established it informs the user.

	- It calls read_db_config() from  dbconfig.py to add data to the db.

	- Once completed it closes the connection and informs the user of closing.


dbconfig.py is the .py module that handles the data transactions

	- Takes 2 args
	1) filename='config.ini' (which establishes the connection to the db).
	2) section='mysql' (which is the data that will be added to the db).

	- This file uses the estableshed connection from filename.

	- Once the conn from filename is established it handles data to the db.

	- Upon adding the data it informs the user.
