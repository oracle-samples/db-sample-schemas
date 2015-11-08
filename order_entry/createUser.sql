Rem
Rem $Header: rdbms/demo/schema/order_entry/createUser.sql.sbs /main/4 2015/03/19 10:23:26 smtaylor Exp $
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
Rem      createUser.sql.sbs - Create a user, directory, and XDB folder
Rem
Rem    DESCRIPTION
Rem      .
Rem
Rem    NOTES
Rem      Instantiates createUser.sql. Sets s_oePath
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19.15 - added prompts for parameters 1 and 2
Rem    smtaylor    03/19/15 - added parameter 3, connect_string
Rem    smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem    smtaylor    03/19/15 - added pararmeter &connect_string to script calls
Rem    bhammers    02/24/11 - 11790077:do not delete home directory if existent
Rem    bhammers    01/24/11 - bug 11790009: consistent variable name for sys pwd 
Rem    celsbern    07/17/09 - added explicit revoke of execute on directory
Rem                           objects
Rem    celsbern    02/24/09 - renamed XMLDIR to SS_OE_XMLDIR
Rem    cbauwens    09/23/04 - cbauwens_bug3031915
Rem    cbauwens    03/16/04 - Created

PROMPT
PROMPT specify password for OE as parameter 1:
DEFINE pass_oe  = &1
PROMPT
PROMPT PROMPT password for SYS as parameter 2:
DEFINE pass_sys = &2
PROMPT
PROMPT specify connect string as parameter 3:
DEFINE connect_string = &3
PROMPT

DECLARE
  targetFolder VARCHAR2(256) := '/home';
  result boolean;
BEGIN
  IF (not DBMS_XDB.existsResource(targetFolder)) THEN
    result := DBMS_XDB.createFolder(targetFolder);
  END IF;

  targetFolder := targetFolder || '/OE';
  if (DBMS_XDB.existsResource(targetFolder)) then
    DBMS_XDB.deleteResource(targetFolder, DBMS_XDB.DELETE_RECURSIVE);
  end if;
  result := DBMS_XDB.createFolder(targetFolder);
  DBMS_XDB.setAcl(targetFolder, '/sys/acls/all_all_acl.xml');
  coe_utilities.createHomeFolder('OE');
END;
/ 

CONNECT OE/&pass_oe@&connect_string

--Create Oracle directory object
DROP DIRECTORY SS_OE_XMLDIR
/
CREATE DIRECTORY SS_OE_XMLDIR as '__SUB__CWD__/order_entry/'
/
COMMIT
/

CONNECT sys/&&pass_sys@&connect_string AS SYSDBA;
 
revoke execute on directory SS_OE_XMLDIR from OE
/
CONNECT OE/&pass_oe@&connect_string


