README.txt

Created 18-JUL-2019

Updated 18-JUL-2019

Copyright (c) 2019 Oracle

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

------------------------------------------------------------------------

This document contains instructions to install the customer orders sample
schema. This requires Oracle Database 12.1.0.2 or higher.

========================================================================

1.  Instructions to create the schema:


1.1	Decide on a password for the Sample Schema. Here, we are using
	placeholder names inside "<" and ">" brackets:

		CO:     <CO_password>

1.2	Verify the value for the default tablespace, and the temporary 
	tablespace. For illustration purposes, the values are:

		default tablespace: EXAMPLE
		temporary tablespace: TEMP

        NOTE: Use your own passwords.

1.3     Verify the connect string for the database. For illustration 
        purposes, the value of <connect_string> for database pdb is:

                connect_string: localhost:1521/pdb
 

        The connect_string may also be a valid tnsnames.ora entry.

1.4	Invoke the Sample Schema creation script. Using the values listed 
	in Sections 1.1, 1.2, and 1.3 the command would look like this:

	SQL> @co_main <CO_password> localhost:1521/pdb EXAMPLE TEMP 

1.4.1 To install the objects and data into an existing schema, run:

    SQL> @co_ddl
    SQL> @co_dml

1.4.2 To refresh the data in existing tables in the current schema, 
      run:

    SQL> @co_dml

1.4.3 To remove the customer order objects in the current schema, run:

    SQL> @co_drop_objects

1.4.5 To remove the CO user, run:

    SQL> @co_drop_user