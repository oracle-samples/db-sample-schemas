Rem
Rem $Header: rdbms/demo/schema/drop_sch.sql /main/2 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem drop_sch.sql
Rem
Rem Copyright (c) 2009, 2015 Oracle and/or its affiliates.All rights reserved. 
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
Rem      drop_sch.sql
Rem
Rem    DESCRIPTION
Rem      Drops all Sample Schemas (HR,OE,IX,PM,SH)
Rem
Rem    NOTES
Rem      Must be run as SYSTEM
Rem      
Rem      CAUTION: Never use the above mentioned Sample Schemas for
Rem               anything other than demos and examples.
Rem      CAUTION: Do not use this script if you have production user accounts
Rem               named HR,OE,IX,PM,SH
Rem
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19/15 - added parameter 3, connect string
Rem    smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem    cbauwens    03/05/09 - Drop Sample Schemas
Rem    cbauwens    03/05/09 - Created
Rem

SET ECHO ON
SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 120
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET PAUSE OFF

COLUMN object_name      FORMAT A30
COLUMN object_type      FORMAT A20
COLUMN owner            FORMAT A6
COLUMN schema_owner     FORMAT A16
COLUMN status           FORMAT A8



PROMPT 
PROMPT specify password for SYSTEM:
DEFINE pwd_system

PROMPT specify spoolfile name:
DEFINE spl_file
PROMPT 

PROMPT specify connect string:
DEFINE connect_string
PROMPT


CONNECT system/&pwd_system@&connect_string
SPOOL &spl_file

Rem ******** List schemas and objects ********
PROMPT
PROMPT All user named objects owned by schema accounts

 SELECT   owner, object_type, object_name, status
 FROM     dba_objects
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 AND      object_name NOT LIKE 'SYS%'
 ORDER BY 1,2,3,4;


PROMPT
PROMPT All SYS named objects owned by schema accounts

 SELECT    owner, object_type, object_name, status
 FROM     dba_objects
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 AND      object_name LIKE 'SYS%'
 ORDER BY 2,1,3;

Rem ******** Drop Sample Schemas, cascade to objects ********
PROMPT
PROMPT Dropping Sample Schemas

DROP USER hr CASCADE;
DROP USER oe CASCADE;
DROP USER pm CASCADE;
DROP USER ix CASCADE;
DROP USER sh CASCADE;
DROP USER bi CASCADE;


Rem ******** Verify that all Sample Schemas and objects have been dropped ********
PROMPT
PROMPT Verifying drop of Sample Schemas

SELECT   owner, object_type, object_name
 FROM     dba_objects
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 ORDER BY 1,2,3;

SPOOL OFF
UNDEFINE pwd_system
UNDEFINE spl_file

PROMPT
PROMPT ALL Sample Schemas have been dropped.
