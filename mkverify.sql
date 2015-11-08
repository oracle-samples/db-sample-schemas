Rem
Rem $Header: mkverify.sql 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem mkverify.sql
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
Rem      mkverify.sql -  Verify the Sample Schema creation
Rem
Rem    DESCRIPTION
Rem      Run various scripts against the dictionary
Rem
Rem    NOTES
Rem      Relies on accurate statistics being collected
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19/15 - added parameter 3, connect string
Rem    smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem    cbauwens    08/09/04 - sorting of constraints 
Rem    ahunold     02/11/03 - sorting of object privileges
Rem    ahunold     10/25/02 - Dimensions, XML
Rem    ahunold     10/12/02 - DBA_ALL_TABLES, data types
Rem    ahunold     09/25/02 - Created
Rem

PROMPT
PROMPT specify password for SYSTEM as parameter 1:
DEFINE password_system     = &1
PROMPT
PROMPT specify spool filename as parameter 2:
DEFINE spool_file          = &2
PROMPT 
PROMPT specify connect string as parameter 3:
DEFINE connect_string     = &3
PROMPT

CONNECT system/&password_system@&connect_string;

--
-- Workaround until situation with DBA_ALL_TABLES is clear
--

analyze table oe.categories_tab compute statistics;

analyze table oe.product_ref_list_nestedtab compute statistics;

analyze table oe.subcategory_ref_list_nestedtab compute statistics;

analyze table oe.purchaseorder compute statistics;

analyze table pm.textdocs_nestedtab compute statistics;

SET ECHO OFF
SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 90
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 999

COLUMN constraint_type  FORMAT A20
COLUMN data_type        FORMAT A35
COLUMN data_type_owner  FORMAT A16
COLUMN dimension_name   FORMAT A20
COLUMN generated        FORMAT A16
COLUMN granted_role     FORMAT A25
COLUMN grantee          FORMAT A7
COLUMN grantor          FORMAT A7
COLUMN index_name       FORMAT A25
COLUMN object_name      FORMAT A30
COLUMN object_type      FORMAT A20
COLUMN owner            FORMAT A6
COLUMN privilege        FORMAT A25
COLUMN schema_owner     FORMAT A16
COLUMN segment_type     FORMAT A20
COLUMN status           FORMAT A8
COLUMN storage_type     FORMAT A20
COLUMN subobject_name   FORMAT A16
COLUMN table_name       FORMAT A30
COLUMN validated        FORMAT A16

SPOOL &spool_file

PROMPT
PROMPT All named objects and stati

SELECT    owner, object_type, object_name, subobject_name, status
 FROM     dba_objects
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 AND      object_name NOT LIKE 'SYS%'
 ORDER BY 1,2,3,4;

PROMPT
PROMPT Data types used

SELECT    owner, data_type, data_type_owner, data_type_mod, COUNT(*)
 FROM     dba_tab_columns
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 GROUP BY owner, data_type, data_type_owner, data_type_mod
 ORDER BY 2,1,3,4;

PROMPT
PROMPT XML tables

SELECT    owner, table_name, schema_owner, storage_type
 FROM     dba_xml_tables
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 ORDER BY 1,2;

PROMPT
PROMPT All objects named 'SYS%' (LOBs etc)

SELECT    owner, object_type, status, COUNT(*)
 FROM     dba_objects
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 AND      object_name LIKE 'SYS%'
 GROUP BY owner, object_type, status
 ORDER BY 2,1,3;

PROMPT
PROMPT All constraints

SELECT	  owner, 
	  DECODE (constraint_type		,
		'C', 'Check or Not Null'	,
		'O', 'Read only view'		,
		'P', 'Primary key'		,
		'R', 'Foreign key'		,
		'U', 'Unique key'		,
		'V', 'With check view'		) CONSTRAINT_TYPE ,
	  status, 
	  validated, 
	  generated, 
	  COUNT(*)
 FROM     dba_constraints
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 GROUP BY owner, constraint_type, status, validated, generated
 ORDER BY 2,3,4,5,1;
 
PROMPT
PROMPT All dimensions

SELECT    owner, dimension_name, invalid, compile_state
 FROM     dba_dimensions
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 ORDER BY 1,2;
 
PROMPT
PROMPT All granted roles

SELECT    granted_role, grantee
 FROM     dba_role_privs
 WHERE    grantee in ('HR','OE','SH','PM','IX','BI')
 ORDER BY 1,2;

PROMPT
PROMPT All granted system privileges

SELECT    privilege, grantee
 FROM     dba_sys_privs
 WHERE    grantee in ('HR','OE','SH','PM','IX','BI')
 ORDER BY 1,2;

PROMPT
PROMPT All granted object privileges

SELECT    owner, table_name, privilege, grantee
 FROM     dba_tab_privs
 WHERE    grantee in ('HR','OE','SH','PM','IX','BI')
 ORDER BY 1,2,3,4;

PROMPT
PROMPT Space usage

SELECT    owner, segment_type, sum(bytes)
 FROM     dba_segments
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 GROUP BY ROLLUP (owner, segment_type);

PROMPT
PROMPT Table cardinality relational and object tables

SELECT    owner, table_name, num_rows
 FROM     dba_all_tables
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 ORDER BY 1,2,3;

PROMPT
PROMPT Index cardinality (without  LOB indexes)

SELECT    owner, index_name, distinct_keys, num_rows
 FROM     dba_indexes
 WHERE    owner in ('HR','OE','SH','PM','IX','BI')
 AND      index_name NOT LIKE 'SYS%'
 ORDER BY 1,2,3;        

SPOOL OFF

