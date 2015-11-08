README.txt

Created 25-NOV-2003

Updated 19-Mar-2015

Copyright (c) 2015 Oracle

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

 
This document describes the structure of the Schema directory, and 

provides instructions for creating the Sample Schemas.

========================================================================

1.	Structure of the Schemas directory

1.1	The Schema directory contains the following files:

1.1.1	mksample.sql
	This script erases and recreates all Sample Schemas. 
	CAUTION: This script contains directory paths that may 
	work only for one specific installation.

1.1.2	README.txt
	This file explains the process of creating Sample Schemas.

1.2	The following folders contain scripts to DROP and CREATE database 
	objects, and for loading data.  These scripts are called by 
	the mksample.sql script.

1.2.1	human_resources

1.2.1.1	The hr_main.sql script creates or recreates the HR schema.

1.2.1.2	The hr_drop.sql script drops all objects of the schema, but 
	does not remove the HR user.
 
1.2.2	order_entry

1.2.2.1	The oe_main.sql script creates or recreates the OE schema.

1.2.2.2	The oe_drop.sql script drops all relational objects, but 
	does not remove the OE user.
 
1.2.3	product_media 

1.2.3.1	The pm_main.sql script creates or recreates the PM schema.

1.2.3.2	The pm_drop.sql script drops all objects, but does not 
	remove the PM user.

1.2.4	info_exchange

1.2.4.1	The ix_main.sql script creates or recreates the IX schema.

1.2.4.2	The dix_v3.sql script drops all objects, but does not remove
	the IX user.

1.2.5	sales_history

1.2.5.1	The sh_main.sql script creates or recreates the SH schema.

1.2.5.2	The sh_drop.sql script drops all objects, but does not remove
	the SH user

1.2.6	bus_intelligence

1.2.6.1	The bi_main.sql creates user BI and grants SELECT
	privileges on specific OE and SH objects.

========================================================================


2.  Instructions to create the schemas:


2.1	Decide on passwords for the Sample Schemas. Here, we are using
	placeholder names inside "<" and ">" brackets:

		SYSTEM: <SYSTEM_password>
		SYS:    <SYS_password>
		HR:     <HR_password>
		OE:     <OE_password>
		PM:     <PM_password>
		IX:     <IX_password>
		SH:     <SH_password>
		BI:     <BI_password>

2.2	Verify the value for the default tablespace, the temporary 
	tablespace, and the log file directory. For illustration purposes, 
	the values are:

		default tablespace: EXAMPLE
		temporary tablespace: TEMP
		log file directory: $ORACLE_HOME/demo/schema/log

        NOTE: Use your own passwords.

2.3     Verify the connect string for the database. For illustration 
        purposes, the value of <connect_string> for database pdb is:

                connect_string: localhost:1521/pdb
 

        The connect_string may also be a valid tnsnames.ora entry.

        NOTE: Due to referencing external tables under the sample
              schema directory, the sample schema files must be
              extracted on and mksample executed on the host 
              containing the database.

2.4	Invoke the Sample Schema creation script. Using the values listed 
	in Sections 2.1, 2.2, and 2.3 the command would look like this:

	SQL> @?/demo/schema/mksample <SYSTEM_password> <SYS_password>
 		<HR_password> <OE_password> <PM_password> <IX_password> 
		<SH_password> <BI_password> EXAMPLE TEMP 
		$ORACLE_HOME/demo/schema/log/ localhost:1521/pdb

	The mksample script lists all the objects created in the data dictionary.  

========================================================================

3.  	Schema dependencies and requirements:

3.1 	The OE schema requires that the database be enabled for spatial data
	and that the HR schema exists.
 
3.2	The PM schema requires that the database be enabled for Intermedia, 
	which itself requires a Java-enabled database, and that the OE 
	schema exists.
 
3.3	The SH schema uses Partitioning and requires that the OE schema
	exists.

3.4	The BI schema requires that the OE schema exists.

3.5	Refer to Oracle Database documentation for more detailed 
	information about the Sample Schemas.

========================================================================

