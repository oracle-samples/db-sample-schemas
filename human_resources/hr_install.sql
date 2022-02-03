rem
rem Copyright (c) 2022 Oracle
rem
rem Permission is hereby granted, free of charge, to any person obtaining a
rem copy of this software and associated documentation files (the "Software"),
rem to deal in the Software without restriction, including without limitation
rem the rights to use, copy, modify, merge, publish, distribute, sublicense,
rem and/or sell copies of the Software, and to permit persons to whom the
rem Software is furnished to do so, subject to the following conditions:
rem
rem The above copyright notice and this permission notice shall be included in
rem all copies or substantial portions rem of the Software.
rem 
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
rem THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
rem FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
rem DEALINGS IN THE SOFTWARE.
rem
rem NAME
rem   hr_install.sql - Main installation script for HR schema creation
rem
rem DESCRIPTON
rem   HR (Human Resources) is a small sample schema resembling an HR department
rem
rem SCHEMA VERSION
rem   21
rem
rem RELEASE DATE
rem   03-FEB-2022
rem
rem SUPPORTED with DB VERSIONS
rem   19c and higher
rem 
rem MAJOR CHANGES IN THIS RELEASE
rem   new script for HR installation 
rem
rem SCHEMA DEPENDENCIES AND REQUIREMENTS
rem  This script calls hr_create.sql, hr_populate.sql, hr_code.sql
rem 
rem INSTALL INSTRUCTIONS
rem   1. Run as privileged user with rights to create another user 
rem      (SYSTEM, ADMIN, etc.)
rem   2. Run this script to create the HR (human resources) schema
rem   3. You are prompted for
rem      a. password - enter an Oracle Database compliant password
rem      b. tablespace - if you do not enter a tablespace, the default 
rem         tablespace is used
rem   Note: If the HR schema already exists, it is removed/dropped and a 
rem         fresh HR schema is installed
rem
rem UNINSTALL INSTRUCTIONS
rem   If you have installed the HR sample schema, you can remove it by running
rem   the hr_uninstall.sql script
rem
rem NOTES
rem   Run as privileged user with rights to create another user
rem   (SYSTEM, ADMIN, etc.)
rem 
rem --------------------------------------------------------------------------

SET ECHO OFF
SET VERIFY OFF
SET HEADING OFF
SET FEEDBACK OFF

-- Exit setup script on any error
WHENEVER SQLERROR EXIT SQL.SQLCODE

-- Retrieve and store database default tablespace
COLUMN property_value NEW_VALUE var_default_tablespace NOPRINT
SELECT property_value FROM database_properties WHERE property_name = 'DEFAULT_PERMANENT_TABLESPACE';

ACCEPT pass PROMPT 'Enter a password for the user HR: ' HIDE
-- Make sure password is mandatory
SET SERVEROUTPUT ON;
BEGIN
   IF '&pass' IS NULL THEN
      RAISE_APPLICATION_ERROR(-20999, 'Error: the HR password is mandatory! Please specify a password!');
   END IF;
END;
/
SET SERVEROUTPUT OFF;
ACCEPT tbs PROMPT 'Enter a tablespace for HR [&var_default_tablespace]: ' DEFAULT '&var_default_tablespace'

-- Log installation into log file
SPOOL hr_install.log

REM =======================================================
REM cleanup old HR schema, if found
REM Use PL/SQL to avoid "user does not exist" error
REM =======================================================

SET SERVEROUTPUT ON;
DECLARE
   user_does_not_exist EXCEPTION;
   pragma exception_init(user_does_not_exist, -1918);
BEGIN
   EXECUTE IMMEDIATE 'DROP USER HR CASCADE';
   -- The next line will only be reached if the HR schema already exists.
   -- Otherwise the statement above will trigger an exception.
   DBMS_OUTPUT.PUT_LINE('Old HR schema has been dropped.');
EXCEPTION
   WHEN user_does_not_exist THEN
      -- Ignore error as the user to be dropped does not exist anyway
      NULL;
END;
/
SET SERVEROUTPUT OFF;

REM =======================================================
REM create user
REM three separate commands, so the create user command 
REM will succeed regardless of the existence of the 
REM DEMO and TEMP tablespaces 
REM =======================================================

CREATE USER hr IDENTIFIED BY &pass
               DEFAULT TABLESPACE &tbs
               QUOTA UNLIMITED ON &tbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO hr;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE , UNLIMITED TABLESPACE TO hr;

REM =======================================================
REM create hr schema objects
REM =======================================================

ALTER SESSION SET CURRENT_SCHEMA=HR;
ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

--
-- create tables, indexes, sequences, constraints and comments
--

@@hr_create.sql

-- 
-- populate tables
--

@@hr_populate.sql


--
-- create procedural objects
--

@@hr_code.sql

--
-- installation validation
--
SET HEADING ON
-- reactivated by sub-scripts, turn it off again.
SET FEEDBACK OFF

SELECT 'Verification:' AS "Installation verification" FROM dual;

SELECT 'regions' AS "Table", 5 AS "provided", count(1) AS "actual" FROM hr.regions
UNION ALL
SELECT 'countries' AS "Table", 25 AS "provided", count(1) AS "actual" FROM hr.countries
UNION ALL
SELECT 'departments' AS "Table", 27 AS "provided", count(1) AS "actual" FROM hr.departments
UNION ALL
SELECT 'locations' AS "Table", 23 AS "provided", count(1) AS "actual" FROM hr.locations
UNION ALL
SELECT 'employees' AS "Table", 107 AS "provided", count(1) AS "actual" FROM hr.employees
UNION ALL
SELECT 'jobs' AS "Table", 19 AS "provided", count(1) AS "actual" FROM hr.jobs
UNION ALL
SELECT 'job_history' AS "Table", 10 AS "provided", count(1) AS "actual" FROM hr.job_history;
--
-- Installation finish text.
--
-- the SELECT '' FROM DUAL statements serve to print new lines
-- and make the output more readable.
--
SELECT 'The installation of the sample schema is now finished.'  AS "Thank you!"
   FROM dual
UNION ALL
SELECT 'Please check the installation verification output above.' AS "Thank you!"
   FROM dual
UNION ALL
SELECT '' AS "Thank you!"
   FROM dual
UNION ALL
SELECT 'You will now be disconnected from the database.' AS "Thank you!"
   FROM dual
UNION ALL
SELECT 'Please exit this session and start a new one.' AS "Thank you!"
   FROM dual
UNION ALL
SELECT '' AS "Thank you!"
   FROM dual
UNION ALL
SELECT 'Thank you for using Oracle Database!' AS "Thank you!"
   FROM dual
UNION ALL
SELECT '' AS "Thank you!"
   FROM dual;

--
-- Disconnect again from database to prevent any accidental commands being
-- executed as a privileged user.
-- Use 'disconnect' instead of 'exit' to leave SQL*Plus Window open on Windows.
--
disconnect

-- spool off at the end so that disconnect is still visible in log file.
spool off
