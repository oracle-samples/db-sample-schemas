Rem
Rem $Header: rdbms/demo/schema/sales_history/sh_main.sql /main/12 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem sh_main.sql
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
Rem      sh_main.sql - Main schema creation and load script 
Rem
Rem    DESCRIPTION
Rem      SH is the Sales History schema of the Oracle Sample
Rem	   Schemas
Rem
Rem    NOTES
Rem     CAUTION: use absolute pathnames as parameters 5 and 6.
Rem     Example (UNIX) echo $ORACLE_HOME/demo/schema/sales_history      
Rem     Please make sure that parameters 5 and 6 are specified
Rem     INCLUDING the trailing directory delimiter, since the
Rem     directory parameters and the filenames are concatenated 
Rem     without adding any delimiters.
Rem     Run this as SYS or SYSTEM
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem     smtaylor   03/19/15 - added parameter 8, connect_string
Rem     smtaylor   03/19/15 - added @&connect_string to CONNECT
Rem     smtaylor   03/19/15 - added pararmeter &connect_string to script calls
Rem     awesley    04/03/12 - Remove cwm_user
Rem     jmadduku   02/18/11 - Grant Unlimited Tablespace priv with RESOURCE
Rem     cbauwens   03/06/08 - NLS settings for load
Rem     cbauwens   07/10/07 - NLS fix bug 5684394
Rem     glyon      06/28/07 - grant CWM_USER role, if it exists
Rem     cbauwens   02/23/05 - depricating connect role 
Rem     ahunold    10/14/02 - 
Rem     hyeh       08/29/02 - hyeh_mv_comschema_to_rdbms
Rem     ahunold    08/20/02 - path > dir
Rem     ahunold    08/15/02 - versioning
Rem     ahunold    04/30/02 - Reduced DIRECTORY privileges
Rem     ahunold    08/28/01 - roles
Rem     ahunold    07/13/01 - NLS Territory
Rem     ahunold    04/13/01 - spool, notes
Rem     ahunold    04/10/01 - flexible log and data paths
Rem     ahunold    03/28/01 - spool
Rem     ahunold    03/23/01 - absolute path names
Rem     ahunold    03/14/01 - prompts
Rem     ahunold    03/09/01 - privileges
Rem     hbaer      03/01/01 - changed loading from COSTS table from
Rem			      SQL*Loader to external table with GROUP BY
Rem			      Added also CREATE DIRECTORY privilege
Rem

SET ECHO OFF

PROMPT 
PROMPT specify password for SH as parameter 1:
DEFINE pass     = &1
PROMPT 
PROMPT specify default tablespace for SH as parameter 2:
DEFINE tbs      = &2
PROMPT 
PROMPT specify temporary tablespace for SH as parameter 3:
DEFINE ttbs     = &3
PROMPT 
PROMPT specify password for SYS as parameter 4:
DEFINE pass_sys = &4
PROMPT
PROMPT specify directory path for the data files as parameter 5:
DEFINE data_dir = &5
PROMPT
PROMPT writeable directory path for the log files as parameter 6:
DEFINE log_dir = &6
PROMPT
PROMPT specify version as parameter 7:
DEFINE vrs = &7
PROMPT
PROMPT specify connect string as parameter 8:
DEFINE connect_string     = &8
PROMPT

DEFINE spool_file = &log_dir.sh_&vrs..log
SPOOL &spool_file 

ALTER SESSION SET NLS_LANGUAGE='American';

--
-- Dropping the user with all its objects
--

DROP USER sh CASCADE;

REM =======================================================
REM create user
REM THIS WILL ONLY WORK IF APPROPRIATE TS ARE PRESENT
REM =======================================================

CREATE USER sh IDENTIFIED BY &pass;

ALTER USER sh DEFAULT TABLESPACE &tbs
 QUOTA UNLIMITED ON &tbs;
ALTER USER sh TEMPORARY TABLESPACE &ttbs;

GRANT CREATE DIMENSION         TO sh;
GRANT QUERY REWRITE            TO sh;
GRANT CREATE MATERIALIZED VIEW TO sh;


GRANT CREATE SESSION           TO sh;
GRANT CREATE SYNONYM           TO sh;
GRANT CREATE TABLE             TO sh;
GRANT CREATE VIEW              TO sh;
GRANT CREATE SEQUENCE          TO sh;
GRANT CREATE CLUSTER           TO sh;
GRANT CREATE DATABASE LINK     TO sh;
GRANT ALTER SESSION            TO sh;


GRANT RESOURCE , UNLIMITED TABLESPACE              TO sh;
GRANT select_catalog_role   TO sh;

rem   ALTER USER sh GRANT CONNECT THROUGH olapsvr;

REM =======================================================
REM grants for sys schema
REM =======================================================

CONNECT sys/&pass_sys@&connect_string AS SYSDBA;
GRANT execute ON sys.dbms_stats TO sh;

REM =======================================================
REM DIRECTORY objects are always owned by SYS
REM    for security reasons, SH does not have 
REM    CREATE ANY DIRECTORY system privilege
REM =======================================================

CREATE OR REPLACE DIRECTORY data_file_dir AS '&data_dir';
CREATE OR REPLACE DIRECTORY log_file_dir AS '&log_dir';

GRANT READ ON DIRECTORY data_file_dir TO sh;
GRANT READ ON DIRECTORY log_file_dir  TO sh;
GRANT WRITE ON DIRECTORY log_file_dir TO sh;
 
REM =======================================================
REM create sh schema objects (sales history - star schema)
REM =======================================================

CONNECT sh/&pass@&connect_string

ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

REM =======================================================
REM Create tables
REM =======================================================

REM CONNECT sh/&pass  reconnecting undoes the prior NLS settings

DEFINE vscript = __SUB__CWD__/sales_history/csh_&vrs
@&vscript

REM =======================================================
REM Populate tables
REM =======================================================

DEFINE vscript = __SUB__CWD__/sales_history/lsh_&vrs 
@&vscript &pass &data_dir &log_dir &vrs &connect_string

REM =======================================================
REM Post load operations
REM =======================================================

DEFINE vscript = __SUB__CWD__/sales_history/psh_&vrs 
@&vscript


spool off
