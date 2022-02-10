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
rem   co_install.sql - Main installation script for CO schema creation
rem
rem DESCRIPTON
rem   CO (Customer Orders) is a sample schema resembling a generic
rem   customer orders management schema
rem
rem SCHEMA VERSION
rem   21
rem
rem RELEASE DATE
rem   08-FEB-2022
rem
rem SUPPORTED with DB VERSIONS
rem   19c and higher
rem 
rem MAJOR CHANGES IN THIS RELEASE
rem   new script for CO installation 
rem
rem SCHEMA DEPENDENCIES AND REQUIREMENTS
rem  This script calls zz_create.sql, zz_populate.sql, zz_code.sql
rem 
rem INSTALL INSTRUCTIONS
rem   1. Run as privileged user with rights to create another user 
rem      (SYSTEM, ADMIN, etc.)
rem   2. Run this script to create the CO (Customer Orders) schema
rem   3. You are prompted for
rem      a. password - enter an Oracle Database compliant password
rem      b. tablespace - if you do not enter a tablespace, the default 
rem         tablespace is used
rem   Note: If the CO schema already exists, it is removed/dropped and a 
rem         fresh CO schema is installed
rem
rem UNINSTALL INSTRUCTIONS
rem   If you have installed the CO sample schema, you can remove it by running
rem   the co_uninstall.sql script
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

ACCEPT pass PROMPT 'Enter a password for the user CO: ' HIDE
-- Make sure password is mandatory
SET SERVEROUTPUT ON;
BEGIN
   IF '&pass' IS NULL THEN
      RAISE_APPLICATION_ERROR(-20999, 'Error: the CO password is mandatory! Please specify a password!');
   END IF;
END;
/
SET SERVEROUTPUT OFF;
ACCEPT tbs PROMPT 'Enter a tablespace for CO [&var_default_tablespace]: ' DEFAULT '&var_default_tablespace'

-- Log installation into log file
SPOOL co_install.log

REM =======================================================
REM cleanup old CO schema, if found
REM Use PL/SQL to avoid "user does not exist" error
REM =======================================================

SET SERVEROUTPUT ON;
DECLARE
   user_does_not_exist EXCEPTION;
   pragma exception_init(user_does_not_exist, -1918);
BEGIN
   EXECUTE IMMEDIATE 'DROP USER CO CASCADE';
   -- The next line will only be reached if the zz schema already exists.
   -- Otherwise the statement above will trigger an exception.
   DBMS_OUTPUT.PUT_LINE('Old CO schema has been dropped.');
EXCEPTION
   WHEN user_does_not_exist THEN
      -- Ignore error as the user to be dropped does not exist anyway
      NULL;
END;
/
SET SERVEROUTPUT OFF;

REM =======================================================
REM create the CO schema user
REM =======================================================

#TODO: Add user creation part here

REM =======================================================
REM create CO schema objects
REM =======================================================

ALTER SESSION SET CURRENT_SCHEMA=CO;
ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

