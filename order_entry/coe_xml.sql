Rem
Rem $Header: rdbms/demo/schema/order_entry/coe_xml.sql /main/13 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem coe_xml.sql
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
Rem      coe_xml.sql - Create XML DB data for user OE
Rem
Rem    DESCRIPTION
Rem      Create XML DB data for user OE
Rem
Rem    NOTES
Rem      .
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19/15 - added parameter 3, connect_string
Rem    smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem    smtaylor    03/19/15 - added pararmeter &connect_string to script calls
Rem    bhammers    01/24/11 - bug 11790062: rename XDB_ to COE_
Rem    cbauwens    02/24/05 - drop 2 more xdb objects after xml schema creation
Rem    cbauwens    08/04/04 - drop xdb packages after xml schema creation 
Rem    cbauwens    03/16/04 - enhanced xml shema 
Rem    cbauwens    12/23/03 - 
Rem    cbauwens    10/28/03 - set nls_numeric_characters 
Rem    ahunold     02/13/03 - typo: REFERENCE_IS_UNQIUE
Rem    ahunold     10/12/02 - revoke ANY DIRECTORY privilege when done
Rem    ahunold     10/07/02 - Created
Rem

PROMPT 
PROMPT specify password for OE as parameter 1:
DEFINE pass_oe  = &1
PROMPT
PROMPT PROMPT password for SYS as parameter 2:
DEFINE pass_sys = &2
PROMPT
PROMPT specify connect string as parameter 3:
DEFINE connect_string     = &3
PROMPT


--
-- CONNECT as SYS. Add roles AND privileges to OE.
--
CONNECT sys/&pass_sys@&connect_string AS SYSDBA;

GRANT xdbadmin TO oe;
GRANT create any directory TO oe; 
GRANT drop any directory TO oe;
GRANT alter session TO oe;

-- Create stored objects
   @__SUB__CWD__/order_entry/xdbSupport


-- Create directory object, instantiated by createUser.sql.sbs
 @__SUB__CWD__/order_entry/createUser &pass_oe &pass_sys &connect_string



CONNECT oe/&pass_oe@&connect_string;

--
-- set . and , as decimal point and thousand separator for the session
-- as the unit prices are hard coded, which might cause NLS issues
--
ALTER SESSION SET NLS_NUMERIC_CHARACTERS='.,';

-- Create folders and load
 @__SUB__CWD__/order_entry/xdb03usg


--
-- CONNECT as SYS. Revoke "ANY" privs
--

CONNECT sys/&pass_sys@&connect_string AS SYSDBA;  

REVOKE create any directory FROM oe;
REVOKE drop any directory FROM oe;
REVOKE alter session FROM oe;
   
DROP PACKAGE xdb.coe_configuration;
DROP PACKAGE xdb.coe_namespaces;
DROP PACKAGE xdb.coe_dom_helper;
DROP PACKAGE xdb.coe_utilities;
DROP PACKAGE xdb.coe_tools;
DROP TRIGGER xdb.no_dml_operations_allowed;
DROP VIEW    xdb.database_summary;


CONNECT oe/&&pass_oe@&connect_string;

