Rem
Rem $Header: rdbms/demo/schema/sales_history/sh_pop3.sql /main/5 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem sh_pop3.sql
Rem
Rem Copyright (c) 2001, 2015, Oracle and/or its affiliates.  All rights reserved.
Rem 
Rem Permission is hereby granted, free of charge, to any person obtaining
Rem a copy of this software and associated documentation files (the
Rem "Software"), to deal in the Software without restriction, including
Rem without limitation the rights to use, copy, modify, merge, publish,
Rem distribute, sublicense, and/or sell copies of the Software, and to
Rem permit persons to whom the Software is furnished to do so, subject to
Rem the following conditions:
Rem 
Rem The above copyright notice and this permission notice shall be
Rem included in all copies or substantial portions of the Software.
Rem 
Rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
Rem EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
Rem MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
Rem NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
Rem LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
Rem OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
Rem WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Rem
Rem    NAME
Rem      sh_pop3.sql - Populates the big SH tables using SQL*Loader 
Rem
Rem    DESCRIPTION
Rem      SH is the Sales History schema of the Oracle 9i Sample
Rem	   Schemas
Rem
Rem    NOTES
Rem     Please make sure that parameters 2 and 3 are specified
Rem     INCLUDING the trailing directory delimiter, since the
Rem     directory parameters and the filenames are concatenated here
Rem     without adding any delimiters. this is done for better
Rem     portability
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem     smtaylor   03/19/15 - added parameter 4, connect_string
Rem     smtaylor   03/19/15 - added @&connect_string to sqlldr
Rem     jstenois   07/01/13 - Fix TERRITORY to be AMERICA; not AMERICAN
Rem     bmccarth   06/21/07 - add territory american to external table
Rem     hyeh       08/29/02 - hyeh_mv_comschema_to_rdbms
Rem     ahunold    04/30/02 - No CREATE DIRECTORY connected as SH
Rem     ahunold    09/17/01 - bug1917153
Rem     ahunold    04/27/01 - concat filename in SQL, not SQL*Loader
Rem     ahunold    04/10/01 - flexible log and data paths
Rem     ahunold    03/28/01 - logfiles
Rem     ahunold    03/23/01 - absolute path names, password
Rem     ahunold    03/12/01 - cleanup b3
Rem     hbaer      01/29/01 - Created
Rem     hbaer      03/01/01 - Changed loading of table COSTS from
Rem			     SQL*Loader to external tables
Rem			     file location must be passed in
Rem


SET VERIFY OFF
SET CONCAT '.'

DEFINE sh_pass = &1 
DEFINE data_file_directory = &2
DEFINE log_file_directory = &3
DEFINE connect_string = &4

prompt
prompt loading PROMOTIONS ...

DEFINE ctl_file = &data_file_directory.sh_promo.ctl
DEFINE dat_file = &data_file_directory.sh_promo.dat
DEFINE log_file = &log_file_directory.sh_promo.log

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=1000

prompt
prompt loading CUSTOMERS ...

DEFINE ctl_file = &data_file_directory.sh_cust.ctl
DEFINE dat_file = &data_file_directory.sh_cust.dat
DEFINE log_file = &log_file_directory.sh_cust.log

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file - 
 direct=yes -
 rows=1000

prompt
prompt loading PRODUCTS ...

DEFINE ctl_file = &data_file_directory.sh_prod.ctl
DEFINE dat_file = &data_file_directory.sh_prod.dat
DEFINE log_file = &log_file_directory.sh_prod.log

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file - 
 direct=yes -
 rows=10000

prompt
prompt loading SALES ...

DEFINE ctl_file = &data_file_directory.sh_sales.ctl
DEFINE dat_file = &data_file_directory.sh_sales.dat
DEFINE log_file = &log_file_directory.sh_sales.log

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file - 
 direct=yes -
 rows=10000

prompt
prompt loading COSTS ...

CREATE TABLE sales_transactions_ext
(
  PROD_ID NUMBER(6),
  CUST_ID NUMBER,
  TIME_ID DATE,
  CHANNEL_ID CHAR(1),
  PROMO_ID NUMBER(6),
  QUANTITY_SOLD NUMBER(3),
  AMOUNT_SOLD NUMBER(10,2),
  UNIT_COST NUMBER(10,2),
  UNIT_PRICE NUMBER(10,2)
)
ORGANIZATION external 
(
  TYPE oracle_loader
  DEFAULT DIRECTORY data_file_dir
  ACCESS PARAMETERS 
  (
    RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
    TERRITORY AMERICA
    BADFILE log_file_dir:'sh_sales_ext.bad'
    LOGFILE log_file_dir:'sh_sales_ext.log'
    FIELDS TERMINATED BY "|" LDRTRIM 
  )
  location 
  (
    'sh_sales.dat'
  )
)REJECT LIMIT UNLIMITED;

INSERT /*+ append */ INTO COSTS 
( time_id,
  prod_id,
  unit_cost,
  unit_price )
SELECT 
  time_id,
  prod_id,
  AVG(unit_cost),
  AVG(amount_sold/quantity_sold)
FROM 
  sales_transactions_ext
GROUP BY 
  time_id, prod_id;

Rem DROP TABLE sales_transactions_ext;

COMMIT;
