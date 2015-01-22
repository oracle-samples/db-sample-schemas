Rem
Rem $Header: doe_xml.sql 02-may-2005.16:39:14 cbauwens Exp $
Rem
Rem doe_xml.sql
Rem
Rem Copyright (c) 2002, 2015, Oracle. All rights reserved.  
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
Rem      doe_xml.sql - <one-line expansion of the name>
Rem
Rem    DESCRIPTION
Rem      <short description of component this file 
Rem
Rem    NOTESSELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS') FROM DUAL
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    cbauwens    05/02/05 - bug4054905 Date & Time format 
Rem    cbauwens    03/16/04 - Modify ref in deleteSchema
Rem    ahunold     03/01/03 - Delete folders
Rem    ahunold     10/07/02 - Create select timestamp from dual
Rem

SET ECHO ON
SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100


SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS') FROM DUAL;


BEGIN
   DBMS_XMLSCHEMA.deleteSchema('http://localhost:8080/source/schemas/poSource/xsd/purchaseOrder.xsd',
    DBMS_XMLSCHEMA.DELETE_CASCADE_FORCE);
end;
/

SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS') FROM DUAL;

BEGIN
   DBMS_XDB.deleteResource('/home',dbms_xdb.DELETE_RECURSIVE_FORCE);
end;
/



COMMIT;

