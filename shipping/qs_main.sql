Rem
Rem $Header: rdbms/demo/schema/shipping/qs_main.sql /main/2 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem qs_main.sql
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
Rem      qs_main.sql - Main schema creation script
Rem
Rem    DESCRIPTION
Rem      QS is the Queued Shipping schema of the Oracle 9i Sample
Rem        Schemas
Rem
Rem    NOTES
Rem      Run as SYS or SYSTEM
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19/15 - added parameter 8, connect_string
Rem    smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem    jmadduku    02/18/11 - Grant Unlimited Tablespace priv with RESOURCE
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     08/28/01 - roles
Rem    ahunold     04/13/01 - spool, additional parameter
Rem    ahunold     03/12/01 - prompts
Rem    ahunold     02/26/01 - 8 char filenames
Rem    ahunold     02/05/01 - Created
Rem

SET ECHO OFF

ALTER SESSION SET NLS_LANGUAGE=American;

PROMPT 
PROMPT specify one password for the users QS,QS_ADM,QS_CBADM,
PROMPT QS_WS,QS_ES,QS_OS,QS_CS and QS_CB as parameter 1:
DEFINE pass     = &1
PROMPT 
PROMPT specify default tablespeace for QS as parameter 2:
DEFINE tbs      = &2
PROMPT 
PROMPT specify temporary tablespace for QS as parameter 3:
DEFINE ttbs     = &3
PROMPT
PROMPT specify password for SYSTEM as parameter 4:
DEFINE master_pass = &4
PROMPT 
PROMPT specify password for OE as parameter 5:
DEFINE passoe   = &5
PROMPT 
PROMPT specify password for SYS as parameter 6:
DEFINE pass_sys = &6
PROMPT
PROMPT specify log directory path as parameter 7:
DEFINE log_path = &7
PROMPT
PROMPT specify connect string as parameter 8:
DEFINE connect_string     = &8
PROMPT

DEFINE spool_file = &log_path.qs_main.log
SPOOL &spool_file

REM =======================================================
REM cleanup section
REM =======================================================

DROP USER qs_adm CASCADE;
DROP USER qs CASCADE;
DROP USER qs_ws CASCADE;
DROP USER qs_es CASCADE;
DROP USER qs_os CASCADE;
DROP USER qs_cbadm CASCADE;
DROP USER qs_cb CASCADE;
DROP USER qs_cs CASCADE;

REM =======================================================
REM Start job_queue_processes to handle AQ propagation
REM =======================================================

alter system set job_queue_processes=4;

REM =======================================================
REM CREATE USERs
REM The user is assigned tablespaces and quota in separate
REM ALTER USER statements so that the CREATE USER statement
REM will succeed even if the &tbs and temp tablespaces do
REM not exist.
REM =======================================================

REM =======================================================
REM Create a common admin account for all Queued Shipping
REM applications
REM =======================================================

CREATE USER qs_adm IDENTIFIED BY &pass;
ALTER USER qs_adm DEFAULT TABLESPACE &tbs QUOTA UNLIMITED ON &tbs;
ALTER USER qs_adm TEMPORARY TABLESPACE &ttbs;

REM ALTER USER qs_adm DEFAULT TABLESPACE &tbs QUOTA ON &tbs UNLIMITED;
REM ALTER USER qs_adm TEMPORARY TABLESPACE &ttbs;

GRANT CONNECT, RESOURCE , UNLIMITED TABLESPACE TO qs_adm;
GRANT aq_administrator_role TO qs_adm;
GRANT EXECUTE ON dbms_aq TO qs_adm;
GRANT EXECUTE ON dbms_aqadm TO qs_adm;

REM  ===================================================
REM  connected as sys to grant execute on dbms_lock
REM  and connected again as system 
REM  ===================================================

CONNECT sys/&pass_sys@&connect_string AS SYSDBA;
GRANT execute ON sys.dbms_stats TO qs_adm;
GRANT execute ON dbms_lock to qs_adm;

CONNECT system/&master_pass@&connect_string

execute dbms_aqadm.grant_system_privilege('ENQUEUE_ANY','qs_adm',FALSE);
execute dbms_aqadm.grant_system_privilege('DEQUEUE_ANY','qs_adm',FALSE);

REM =======================================================
REM Create the application schemas and grant appropriate
REM permission to all schemas
REM =======================================================

REM =======================================================
REM Create Queued Shipping schemas
REM =======================================================

CREATE USER qs IDENTIFIED BY &pass;
ALTER USER qs DEFAULT TABLESPACE &tbs QUOTA UNLIMITED ON &tbs;

ALTER USER qs TEMPORARY TABLESPACE &ttbs;

GRANT CONNECT, RESOURCE , UNLIMITED TABLESPACE TO qs;
GRANT EXECUTE ON dbms_aq to qs;
GRANT EXECUTE ON dbms_aqadm to qs;

REM =======================================================
REM Create an account for Western Region Shipping
REM =======================================================

CREATE USER qs_ws IDENTIFIED BY &pass;
ALTER USER qs_ws DEFAULT TABLESPACE &tbs QUOTA UNLIMITED ON &tbs;

ALTER USER qs_ws TEMPORARY TABLESPACE &ttbs;

GRANT CONNECT, RESOURCE , UNLIMITED TABLESPACE TO qs_ws;
GRANT EXECUTE ON dbms_aq to qs_ws;
GRANT EXECUTE ON dbms_aqadm to qs_ws;

REM =======================================================
REM Create an account for Eastern Region Shipping
REM =======================================================

CREATE USER qs_es IDENTIFIED BY &pass;
ALTER USER qs_es DEFAULT TABLESPACE &tbs QUOTA UNLIMITED ON &tbs;

ALTER USER qs_es TEMPORARY TABLESPACE &ttbs;

GRANT CONNECT, RESOURCE , UNLIMITED TABLESPACE TO qs_es;
GRANT EXECUTE ON dbms_aq TO qs_es;
GRANT EXECUTE ON dbms_aqadm TO qs_es;

REM =======================================================
REM Create an account for Overseas Shipping
REM =======================================================

CREATE USER qs_os IDENTIFIED BY &pass;
ALTER USER qs_os DEFAULT TABLESPACE &tbs QUOTA UNLIMITED ON &tbs;

ALTER USER qs_os TEMPORARY TABLESPACE &ttbs;

GRANT CONNECT, RESOURCE , UNLIMITED TABLESPACE TO qs_os;
GRANT EXECUTE ON dbms_aq TO qs_os;
GRANT EXECUTE ON dbms_aqadm TO qs_os;

REM =======================================================
REM Customer Billing, for security reason, has an admin 
REM schema that hosts all the queue tables and an
REM application schema from where the application runs.
REM =======================================================

CREATE USER qs_cbadm IDENTIFIED BY &pass;
ALTER USER qs_cbadm DEFAULT TABLESPACE &tbs QUOTA UNLIMITED ON &tbs;

ALTER USER qs_cbadm TEMPORARY TABLESPACE &ttbs;

GRANT CONNECT, RESOURCE , UNLIMITED TABLESPACE TO qs_cbadm;
GRANT EXECUTE ON dbms_aq to qs_cbadm;
GRANT EXECUTE ON dbms_aqadm to qs_cbadm;

REM =======================================================
REM Create an account for Customer Billing
REM =======================================================

CREATE USER qs_cb IDENTIFIED BY &pass;
ALTER USER qs_cb DEFAULT TABLESPACE &tbs QUOTA UNLIMITED ON &tbs;

ALTER USER qs_cb TEMPORARY TABLESPACE &ttbs;

GRANT CONNECT, RESOURCE , UNLIMITED TABLESPACE TO qs_cb;
GRANT EXECUTE ON dbms_aq TO qs_cb;
GRANT EXECUTE ON dbms_aqadm TO qs_cb;

REM =======================================================
REM Create an account for Customer Service
REM =======================================================

CREATE USER qs_cs IDENTIFIED BY &pass;
ALTER USER qs_cs DEFAULT TABLESPACE &tbs QUOTA UNLIMITED ON &tbs;

ALTER USER qs_cs TEMPORARY TABLESPACE &ttbs;

GRANT CONNECT, RESOURCE , UNLIMITED TABLESPACE TO qs_cs;
GRANT EXECUTE ON dbms_aq TO qs_cs;
GRANT EXECUTE ON dbms_aqadm TO qs_cs;

REM =======================================================
REM Create objects
REM =======================================================

REM =======================================================
REM grants from oe schema to user qs_adm
REM =======================================================

CONNECT oe/&passoe@&connect_string
GRANT REFERENCES, SELECT ON customers TO qs_adm;
GRANT REFERENCES, SELECT ON product_information TO qs_adm;

PROMPT calling qs_adm.sql ...
CONNECT qs_adm/&pass@&connect_string
@__SUB__CWD__/shipping/qs_adm

PROMPT calling qs_cre.sql ...
CONNECT qs/&pass@&connect_string;
@__SUB__CWD__/shipping/qs_cre

PROMPT calling qs_es.sql ...
CONNECT qs_es/&pass@&connect_string
@__SUB__CWD__/shipping/qs_es

PROMPT calling qs_ws.sql ...
CONNECT qs_ws/&pass@&connect_string
@__SUB__CWD__/shipping/qs_ws

PROMPT calling qs_os.sql ...
CONNECT qs_os/&pass@&connect_string
@__SUB__CWD__/shipping/qs_os

PROMPT calling qs_cbadm.sql ...
CONNECT qs_cbadm/&pass@&connect_string
@__SUB__CWD__/shipping/qs_cbadm

PROMPT calling qs_cs.sql ...
CONNECT qs_cs/&pass@&connect_string
@__SUB__CWD__/shipping/qs_cs

PROMPT calling qs_run.sql ...
CONNECT qs_adm/&pass@&connect_string
@__SUB__CWD__/shipping/qs_run

spool off
