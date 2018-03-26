Rem
Rem $Header: rdbms/demo/schema/product_media/pm_main.sql 2018/03/05 16:28:42 jorgerod Exp $
Rem
Rem pm_main.sql
Rem
Rem Copyright (c) 2001, 2018, Oracle and/or its affiliates.  All rights reserved. 
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
Rem      pm_main.sql - Main schema creation and load script
Rem
Rem    DESCRIPTION
Rem      PM is the Product Media schema of the Oracle 9i Sample
Rem        Schemas
Rem
Rem    NOTES
Rem     1) use absolute pathnames as parameters 6.
Rem        UNIX: echo $ORACLE_HOME/demo/schema/product_media     
Rem     2) there are hard-coded file names in the
Rem        data file pm_p_lob.dat. Should you want to create
Rem        and populate the PM Sample Schema from a location
Rem        other than the one chosen during installation, you
Rem        will have to edit this data file.
Rem     3) Run this as SYS or SYSTEM
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem     jorgerod   03/02/18 - Remove call to pm_p_ord.sql 
Rem                           Ordim Desupport in 19c. pm_p_ord.sql removed
Rem     smtaylor   03/19/15 - added parameter 9, connect_string
Rem     smtaylor   03/19/15 - added @&connect_string to CONNECT
Rem     smtaylor   03/19/15 - added pararmeter &connect_string to script calls
Rem     jmadduku   02/18/11 - Grant Unlimited Tablespace priv with RESOURCE
Rem     hyeh       11/19/02 - standardize path of pm scripts
Rem     hyeh       08/29/02 - hyeh_mv_comschema_to_rdbms
Rem     ahunold    04/30/02 - Reduced DIRECTORY privileges
Rem     ahunold    08/28/01 - roles
Rem     ahunold    07/13/01 - NLS Territory
Rem     ahunold    04/23/01 - typo
Rem     ahunold    04/13/01 - concatenation, no @@
Rem     ahunold    04/10/01 - added parameters 7 and 8
Rem     ahunold    03/29/01 - notes, spool
Rem     ahunold    03/20/01 - no ALTER USER
Rem     ahunold    03/12/01 - prompts & directory
Rem     ahunold    03/07/01 - pm_analz.sql.
Rem     ahunold    02/20/01 - removing pm_p_ini and pm_code
Rem     ahunold    02/09/01 - password passing for pm_p_lob
Rem     ahunold    02/05/01 - Created
Rem  

SET ECHO OFF

PROMPT 
PROMPT specify password for PM as parameter 1:
DEFINE pass     = &1
PROMPT 
PROMPT specify default tablespeace for PM as parameter 2:
DEFINE tbs      = &2
PROMPT 
PROMPT specify temporary tablespace for PM as parameter 3:
DEFINE ttbs     = &3
PROMPT 
PROMPT specify password for OE as parameter 4:
DEFINE passoe   = &4
PROMPT 
PROMPT specify password for SYS as parameter 5:
DEFINE pass_sys = &5
PROMPT
PROMPT specify directory path for the PM data files as parameter 6:
DEFINE data_path = &6
PROMPT
PROMPT specify directory path for the PM load log files as parameter 7:
DEFINE log_path = &7
PROMPT
PROMPT specify work directory path as parameter 8:
DEFINE work_path = &8
PROMPT
PROMPT specify connect string as parameter 9:
DEFINE connect_string     = &9
PROMPT

-- The first dot in the spool command below is 
-- the SQL*Plus concatenation character

DEFINE spool_file = &log_path.pm_main.log
SPOOL &spool_file

-- Dropping the user with all its objects

DROP USER pm CASCADE;

CREATE USER pm IDENTIFIED BY &pass;
ALTER USER pm DEFAULT TABLESPACE &tbs QUOTA UNLIMITED ON &tbs; 
ALTER USER pm TEMPORARY TABLESPACE &ttbs;

GRANT CONNECT TO pm;
GRANT RESOURCE , UNLIMITED TABLESPACE TO pm;

REM =======================================================
REM grants from oe schema
REM =======================================================

CONNECT oe/&passoe@&connect_string

GRANT REFERENCES, SELECT ON product_information TO pm;
GRANT SELECT ON order_items TO pm;
GRANT SELECT ON orders TO pm;
GRANT SELECT ON product_descriptions TO pm;
GRANT SELECT ON inventories TO pm;
GRANT SELECT ON customers TO pm;
GRANT SELECT ON warehouses TO pm;


REM =======================================================
REM grants from sys schema
REM =======================================================

CONNECT sys/&pass_sys@&connect_string AS SYSDBA;

GRANT execute ON sys.dbms_stats TO pm;

CREATE OR REPLACE DIRECTORY media_dir AS '&data_path';

GRANT READ ON DIRECTORY media_dir TO pm;

REM =======================================================
REM create pm schema (product media)
REM =======================================================

CONNECT pm/&pass@&connect_string

ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

@__SUB__CWD__/product_media/pm_cre.sql   -- create objects

REM =======================================================
REM use sqlldr to populate PRINT_MEDIA and its nested table
REM =======================================================
 
@__SUB__CWD__/product_media/pm_p_lob &pass &data_path &log_path &work_path &connect_string

REM =======================================================
REM finish
REM =======================================================

@__SUB__CWD__/product_media/pm_analz -- gather statistics 

spool off
