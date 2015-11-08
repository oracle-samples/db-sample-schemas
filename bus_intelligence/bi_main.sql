Rem $Header: rdbms/demo/schema/bus_intelligence/bi_main.sql /main/7 2015/03/19 10:23:26 smtaylor Exp $
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
Rem      bi_main.sql - Main script for BI user and supporting structures to 
Rem                    create the VPD using application context.
Rem
Rem    DESCRIPTION
Rem      tbd
Rem
Rem    MODIFIED     (MM/DD/YY)
Rem      smtaylor    03/19/15 - added parameter 9, connect string
Rem      smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem      smtaylor    03/19/15 - added pararmeter &connect_string to script calls
Rem      jmadduku    02/18/11 - Grant Unlimited Tablespace priv with RESOURCE
Rem      cbauwens    02/23/05 - deprocating connect role 
Rem      ahunold     05/07/03 - no COMPANY_ID
Rem      hyeh        11/19/02 - fix 'set echo'
Rem      ahunold     09/17/02 - eliminate delta scripts
Rem	 ahunold     08/07/02 - run in $OH
Rem      ahunold     06/17/02 - no VPD
Rem      ahunold     05/30/02 - parameter passing
Rem      ahunold     05/16/02 - ahunold_bi_main
Rem      ngreenberg  05/14/02 - created 
Rem

SET ECHO OFF
SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET CONCAT '.'

PROMPT 
PROMPT specify password for BI as parameter 1:
DEFINE pwd_bi   = &1
PROMPT 
PROMPT specify default tablespeace for BI as parameter 2:
DEFINE tbs      = &2
PROMPT 
PROMPT specify temporary tablespace for BI as parameter 3:
DEFINE ttbs     = &3
PROMPT 
PROMPT specify password for SYS as parameter 4:
DEFINE pwd_sys  = &4
PROMPT 
PROMPT specify password for OE as parameter 5:
DEFINE pwd_oe   = &5
PROMPT
PROMPT specify password for SH as parameter 6:
DEFINE pwd_sh   = &6
PROMPT
PROMPT specify log path as parameter 7:
DEFINE log_path = &7
PROMPT
PROMPT specify version as parameter 8:
DEFINE vrs = &8
PROMPT
PROMPT specify connect string as parameter 9:
DEFINE connect_string     = &9
PROMPT

-- The first dot in the spool command below is 
-- the SQL*Plus concatenation character

DEFINE spool_file = &log_path.bi_&vrs..log
SPOOL &spool_file

CONNECT sys/&pwd_sys@&connect_string AS SYSDBA;

REM =======================================================
REM cleanup section
REM =======================================================

DROP USER bi CASCADE;

REM =======================================================
REM create user
REM three separate commands, so the create user command 
REM will succeed regardless of the existence of the 
REM DEMO and TEMP tablespaces 
REM =======================================================

CREATE USER bi IDENTIFIED BY &pwd_bi;

ALTER USER bi DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;

ALTER USER bi TEMPORARY TABLESPACE &ttbs;


GRANT CREATE SESSION       TO bi;
GRANT CREATE SYNONYM       TO bi;
GRANT CREATE TABLE         TO bi;
GRANT CREATE VIEW          TO bi;
GRANT CREATE SEQUENCE      TO bi;
GRANT CREATE CLUSTER       TO bi;
GRANT CREATE DATABASE LINK TO bi;
GRANT ALTER SESSION        TO bi;
GRANT RESOURCE , UNLIMITED TABLESPACE             TO bi;

REM =======================================================
REM  Changes made as OE
REM     Grant object privileges to BI
REM =======================================================

@__SUB__CWD__/bus_intelligence/bi_oe_pr.sql &pwd_oe &connect_string

REM =======================================================
REM  Changes made as SH 
REM     Grant object privileges to BI
REM =======================================================

@__SUB__CWD__/bus_intelligence/bi_sh_pr.sql &pwd_sh &connect_string

REM =======================================================
REM  Views and synonyms in the 10i BI schema
REM =======================================================

@__SUB__CWD__/bus_intelligence/bi_views.sql &pwd_bi &connect_string

REM =======================================================
REM  Verification
REM =======================================================

SET ECHO ON
COLUMN TABLE_NAME FORMAT A25
COLUMN COLUMN_NAME FORMAT A30

CONNECT bi/&pwd_bi@&connect_string;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM promotions;
SELECT COUNT(*) FROM sales;
SELECT COUNT(*) FROM costs;

SELECT COUNT(*) FROM sh.cal_month_sales_mv;
SELECT COUNT(*) FROM sh.fweek_pscat_sales_mv;

SELECT COUNT(*) FROM channels;
SELECT COUNT(*) FROM countries;
SELECT COUNT(*) FROM times;

SET ECHO OFF
