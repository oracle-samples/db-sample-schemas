rem
rem Copyright (c) 2023 Oracle
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
rem   co_uninstall.sql
rem
rem DESCRIPTON
rem   This script removes the CO (Customer Orders) schema.
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
rem   new script for CO schema removal
rem
rem SCHEMA DEPENDENCIES AND REQUIREMENTS
rem
rem
rem UNINSTALL INSTRUCTIONS
rem   If you have installed the CO sample schema, you can remove it by
rem   running the co_uninstall.sql script
rem
rem NOTES
rem   Run as privileged user with rights to create another user (SYSTEM,
rem   ADMIN, etc.)
rem
rem --------------------------------------------------------------------------

SET ECHO OFF

-- Exit setup script on any error
WHENEVER SQLERROR EXIT SQL.SQLCODE

rem =======================================================
rem cleanup CO schema, if found
rem Use PL/SQL to avoid "user does not exist" error
rem =======================================================

SET SERVEROUTPUT ON;
DECLARE
   user_does_not_exist EXCEPTION;
   pragma exception_init(user_does_not_exist, -1918);
BEGIN
   EXECUTE IMMEDIATE 'DROP USER CO CASCADE';
   -- The next line will only be reached if the CO schema already exists.
   -- Otherwise the statement above will trigger an exception.
   DBMS_OUTPUT.PUT_LINE('CO schema has been dropped.');
EXCEPTION
   WHEN user_does_not_exist THEN
      -- Ignore error as the user to be dropped does not exist anyway
      DBMS_OUTPUT.PUT_LINE('CO schema does not exist, no actions performed.');
END;
/
SET SERVEROUTPUT OFF;

rem
rem Disconnect again from database to prevent any accidental commands being
rem executed as a privileged user.
rem Use 'disconnect' instead of 'exit' to leave SQL*Plus Window open on Windows.
rem

disconnect
