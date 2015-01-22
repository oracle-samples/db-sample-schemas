Rem
Rem $Header: mk_dir.sql.sbs 15-aug-2006.07:55:56 dkapoor Exp $
Rem
Rem mk_dir.sql
Rem
Rem Copyright (c) 2001, 2015, Oracle. All rights reserved.  
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
Rem      mk_dir.sql - Overwrites seed database directory objects
Rem
Rem    DESCRIPTION
Rem      The location of the Sample Schema directories are specific to
Rem      your Oracle installation. This script connects the directory
Rem      objects inside your demo database with the appropriate paths
Rem      in your file system.
Rem
Rem    NOTES
Rem      Run this script as SYS - directories are owned by SYS
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    dkapoor     08/15/06 - call recreation of path for OCM dir object
Rem    tbgraves    05/21/04 - data_pump_dir added 
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     04/30/02 - no grants to public
Rem    ahunold     04/18/02 - create as SYS
Rem    ahunold     04/03/02 - bug 2290347
Rem    ahunold     08/28/01 - Merged ahunold_mk_dir
Rem    ahunold     08/28/01 - Created
Rem

SET ECHO ON
SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100

CREATE OR REPLACE DIRECTORY data_file_dir AS '__SUB__CWD__/sales_history/'; 
CREATE OR REPLACE DIRECTORY log_file_dir  AS '__SUB__CWD__/log/'; 
CREATE OR REPLACE DIRECTORY media_dir     AS '__SUB__CWD__/product_media/';

GRANT READ ON DIRECTORY media_dir      TO pm;
GRANT READ ON DIRECTORY log_file_dir   TO sh;
GRANT READ ON DIRECTORY data_file_dir  TO sh;  
GRANT WRITE ON DIRECTORY log_file_dir  TO sh;
EXECUTE DBMS_DATAPUMP_UTL.REPLACE_DEFAULT_DIR;
EXECUTE ORACLE_OCM.MGMT_CONFIG_UTL.create_replace_dir_obj;
