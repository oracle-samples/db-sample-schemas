Rem
Rem $Header: rdbms/demo/schema/sales_history/lsh_v3.sql /main/16 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem vsh_v3.sql
Rem
Rem Copyright (c) 2002, 2015, Oracle and/or its affiliates.  All rights reserved.
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
Rem      vsh_v3.sql - Loading data for SH schema
Rem
Rem    DESCRIPTION
Rem      <short description of component this file declares/defines>
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19/15 - added parameter 5, connect_string
Rem    smtaylor    03/19/15 - added @&connect_string to sqlldr
Rem    jstenois    07/01/13 - Fix TERRITORY to be AMERICA; not AMERICAN
Rem    cbauwens    03/06/08 - NLS setting for load
Rem    bmccarth    04/20/07 - add Territory American to et statement
Rem    ahunold     07/22/03 - shreview
Rem    cbauwens    07/16/03 - add ODM supplementary_demographics
Rem    cbauwens    07/16/03 - add ODM additional sales rows
Rem    ahunold     05/15/03 - company_id_fix
Rem    ahunold     05/15/03 - company_id_fix
Rem    ahunold     05/07/03 - ahunold_remove_company_id
Rem    ahunold     03/11/03 - cust2v3.ctl, prod2v3.ctl
Rem    ahunold     01/16/03 - bug 2487961 reopened
Rem    ahunold     12/17/02 - sale2v3.ctl
Rem    ahunold     12/17/02 - enabling company_id=2
Rem    ahunold     12/10/02 - separate loads for company 1,2
Rem    ahunold     12/07/02 - explicit datatype for external table DATE
Rem    ahunold     10/15/02 - ODM tables
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     08/20/02 - show indexes
Rem    ahunold     07/31/02 - Created
Rem

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET VERIFY OFF
SET CONCAT '.'

PROMPT 
PROMPT specify password for SH as parameter 1:
DEFINE sh_pass     = &1
PROMPT 
PROMPT specify path for data files as parameter 2:
DEFINE data_path = &2
PROMPT
PROMPT specify path for log files as parameter 3:
DEFINE log_path = &3
PROMPT
PROMPT specify version as parameter 4:
DEFINE vrs = &4
PROMPT
PROMPT specify connect string as parameter 5:
DEFINE connect_string     = &5
PROMPT

SET PAGESIZE 0

COLUMN index_name FORMAT A20

PROMPT Looking for indexes that could slow down load ...

SELECT index_name FROM user_indexes;

-- 
-- TIMES
--

DEFINE ctl_file = &data_path.time_&vrs..ctl
DEFINE dat_file = &data_path.time_&vrs..dat
DEFINE log_file = &log_path.time_&vrs..log

PROMPT
PROMPT loading TIMES using:
PROMPT   &ctl_file
PROMPT   &dat_file
PROMPT   &log_file

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=1000

--
-- COUNTRIES
--

DEFINE ctl_file = &data_path.coun_&vrs..ctl
DEFINE dat_file = &data_path.coun_&vrs..dat
DEFINE log_file = &log_path.coun_&vrs..log

PROMPT
PROMPT loading COUNTRIES using:
PROMPT   &ctl_file
PROMPT   &dat_file
PROMPT   &log_file

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=1000

--
-- CUSTOMERS
--

DEFINE ctl_file = &data_path.cust_&vrs..ctl
DEFINE dat_file = &data_path.cust1&vrs..dat
DEFINE log_file = &log_path.cust1&vrs..log

PROMPT
PROMPT loading CUSTOMERS using:
PROMPT   &ctl_file
PROMPT   &dat_file
PROMPT   &log_file

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=10000



--
-- PRODUCTS
--

DEFINE ctl_file = &data_path.prod_&vrs..ctl
DEFINE dat_file = &data_path.prod1&vrs..dat
DEFINE log_file = &log_path.prod1&vrs..log

PROMPT
PROMPT loading PRODUCTS  using:
PROMPT   &ctl_file
PROMPT   &dat_file
PROMPT   &log_file

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=10000


--
-- PROMOTIONS
--

DEFINE ctl_file = &data_path.prom_&vrs..ctl
DEFINE dat_file = &data_path.prom1&vrs..dat
DEFINE log_file = &log_path.prom1&vrs..log

PROMPT
PROMPT loading PROMOTIONS  using:
PROMPT   &ctl_file
PROMPT   &dat_file
PROMPT   &log_file

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=10


--
-- CHANNELS
--

DEFINE ctl_file = &data_path.chan_&vrs..ctl
DEFINE dat_file = &data_path.chan_&vrs..dat
DEFINE log_file = &log_path.chan_&vrs..log

PROMPT
PROMPT loading CHANNELS using:
PROMPT   &ctl_file
PROMPT   &dat_file
PROMPT   &log_file

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=10



--
-- SALES
--

DEFINE ctl_file = &data_path.sale_&vrs..ctl
DEFINE dat_file = &data_path.sale1&vrs..dat
DEFINE log_file = &log_path.sale1&vrs..log

PROMPT
PROMPT loading SALES  using:
PROMPT   &ctl_file
PROMPT   &dat_file
PROMPT   &log_file

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=100000


--
-- COSTS
--

PROMPT
PROMPT loading COSTS using external table
PROMPT

CREATE TABLE sales_transactions_ext
( PROD_ID        	NUMBER,
  CUST_ID 	 	NUMBER,
  TIME_ID 	 	DATE,
  CHANNEL_ID 	NUMBER,
  PROMO_ID 	 	NUMBER,
  QUANTITY_SOLD   NUMBER,
  AMOUNT_SOLD 	NUMBER(10,2),
  UNIT_COST 	NUMBER(10,2),
  UNIT_PRICE 	NUMBER(10,2)
)
ORGANIZATION external 
(
  TYPE oracle_loader
  DEFAULT DIRECTORY data_file_dir
  ACCESS PARAMETERS 
  (
    RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
    TERRITORY AMERICA
    BADFILE log_file_dir:'ext_1v3.bad'
    LOGFILE log_file_dir:'ext_1v3.log'
    FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '^' LDRTRIM 
    ( PROD_ID         ,
      CUST_ID         ,
      TIME_ID         DATE(10) "YYYY-MM-DD", 
      CHANNEL_ID      ,
      PROMO_ID        ,
      QUANTITY_SOLD   ,
      AMOUNT_SOLD     ,
      UNIT_COST       ,
      UNIT_PRICE      
    ) 
 )
 LOCATION
 ('sale1v3.dat')
)
REJECT LIMIT 100;

INSERT /*+ append */ INTO costs 
( prod_id,
  time_id,
  channel_id,
  promo_id,
  unit_cost,
  unit_price )
SELECT 
  prod_id,
  time_id,
  channel_id,
  promo_id,
  AVG(unit_cost),
  AVG(amount_sold/quantity_sold)
FROM 
  sales_transactions_ext
GROUP BY 
  prod_id,
  time_id,
  channel_id,
  promo_id;


--
-- ODM additional SALES rows
--

DEFINE ctl_file = &data_path.dmsal_&vrs..ctl
DEFINE dat_file = &data_path.dmsal_&vrs..dat
DEFINE log_file = &log_path.dmsal_&vrs..log

PROMPT
PROMPT loading additonal SALES using:
PROMPT   &ctl_file
PROMPT   &dat_file
PROMPT   &log_file


HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=100

   
--
-- SUPPLEMENTARY DEMOGRAPHICS
--

DEFINE ctl_file = &data_path.dem_&vrs..ctl
DEFINE dat_file = &data_path.dem1&vrs..dat
DEFINE log_file = &log_path.dem1&vrs..log

PROMPT
PROMPT loading SUPPLEMENTARY DEMOGRAPHICS using:
PROMPT   &ctl_file
PROMPT   &dat_file
PROMPT   &log_file

HOST sqlldr sh/&sh_pass@&connect_string  -
 control=&ctl_file data=&dat_file log=&log_file -
 direct=yes -
 rows=10

COMMIT;

