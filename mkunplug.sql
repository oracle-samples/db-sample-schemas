Rem
Rem $Header: rdbms/demo/schema/mkunplug.sql /main/18 2012/08/08 17:51:26 celsbern Exp $
Rem
Rem mkunplug.sql
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
Rem      mkunplug.sql - Unplug transportable tablespace EXAMPLE
Rem
Rem    DESCRIPTION
Rem      Once the Sample Schemas are initially created using mksample.sql,
Rem      this script creates a set of tranportable files containing
Rem      metadata and data from the EXAMPLE tablespace.
Rem
Rem    NOTES
Rem      The EXAMPLE tablespace only contains the Sample Schemas
Rem      - CAUTION: Never use the Sample Schemas for
Rem        anything other than demos and examples
Rem      - USAGE: tbd
Rem      - LOG FILES: The log files are written
Rem        to the equivalent of $ORACLE_HOME/demo/schema/log
Rem        If you edit the log file location further down in this
Rem        script, use absolute pathnames
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem      celsbern  06/12/12 - removed drop of objects before export
Rem      lokeskum  11/01/11 - include silent=banner paramter to expdp
Rem      celsbern  07/12/10 - added dump_path parameter
Rem      celsbern  07/07/10 - removing call to mk_expdp_do.sql script
Rem      celsbern  06/28/10 - fixing path for backup dfb file
Rem      celsbern  06/22/10 - removing mention of paths in prompts
Rem      celsbern  05/31/10 - converted to dpexp
Rem      cbauwens  05/02/05 - bug4054905 Date & Time format 
Rem      cbauwens  08/01/03 - rman compress
Rem      cbauwens  07/31/03 - rman compress
Rem      cbauwens  07/24/03 - rman compress
Rem      ahunold   03/28/03 - oc_drop.sql
Rem      ahunold   04/02/03 - bug-2884943
Rem      ahunold   02/27/03 - bug 2824141 (workaround)
Rem      ahunold   03/01/03 - Bug 2828348
Rem      ahunold   01/27/03 - RMAN backup finalized
Rem      ahunold   01/14/03 - Invalid View workaround, comments
Rem      ahunold   09/25/02 - exp logfile 
Rem      ahunold   09/18/02 - Created
Rem

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 999
SET ECHO OFF
SET CONCAT '.'
SET SHOWMODE OFF

PROMPT 
PROMPT specify password for SYS as parameter 1:
DEFINE password_sys        = &1
PROMPT 
PROMPT specify OUTPUT export file name, excluding path, as parameter 2:
DEFINE exp_file            = &2
PROMPT
PROMPT specify OUTPUT tablespace backup file name, excluding path, as parameter 3:
DEFINE backup_file         = &3
PROMPT 
PROMPT specify LOG directory, open for write, as parameter 4:
DEFINE log_path            = &4
PROMPT 
PROMPT specify DUMP directory as parameter 5:
DEFINE dump_path            = &5
PROMPT 
DEFINE vrs = v3

SPOOL &log_path.mkunplug_&vrs._@.log 

CONNECT sys/&&password_sys AS SYSDBA;

--
-- Check for violations of TTS prerequisites
--

EXECUTE dbms_tts.transport_set_check('EXAMPLE',TRUE);

SELECT * FROM TRANSPORT_SET_VIOLATIONS;

-- create the 'SS_IMPEXP_DIR' directory object for the dump files
create or replace directory SS_IMPEXP_DIR as '&dump_path';
grant read,write on directory SS_IMPEXP_DIR to public;
create or replace directory SS_LOGPATH_DIR as '&log_path';
grant read,write on directory SS_LOGPATH_DIR to public;

--
-- Begin unplugging
--

ALTER TABLESPACE example READ ONLY;

-- export the meta data for the tablespace
host expdp "'sys/&&password_sys AS SYSDBA'" dumpfile=&exp_file logfile=SS_LOGPATH_DIR:tts_example_exp.log transport_tablespaces=EXAMPLE directory=SS_IMPEXP_DIR silent=banner

SET PAGESIZE 0

SELECT 'Backing up tablespace file '||file_name
 FROM  dba_data_files
 WHERE tablespace_name='EXAMPLE';

set serveroutput on;

SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

-- back up the data in the tablespace
variable devicename varchar2(255);
variable set_stamp number;
variable devicename varchar2(255);
variable set_stamp number;
variable set_count number;
variable data_file_id number;

declare
    done boolean;
    concur boolean;
    pieceno binary_integer;
    handle varchar2(255);
    comment varchar2(255);
    media varchar2(255);
    params varchar2(255);
    archlog_failover boolean;
    recid number;
    stamp number;
    tag varchar2(32);
    
    
begin
    dbms_output.put_line(' ');
    dbms_output.put_line(' BACKUP: Allocating device... ');
      :devicename := dbms_backup_restore.deviceAllocate;
    dbms_output.put_line(' BACKUP: Specifing datafiles... ');
    dbms_backup_restore.backupSetDataFile(:set_stamp, :set_count);
    SELECT file_id INTO :data_file_id FROM dba_data_files WHERE tablespace_name='EXAMPLE';
    dbms_backup_restore.backupDataFile(:data_file_id);
    dbms_output.put_line(' BACKUP: Create piece ');
    dbms_backup_restore.backupPieceCreate('&dump_path'||'&backup_file',pieceno,done,handle,comment,media,concur,params,reuse=>true,archlog_failover=>archlog_failover,deffmt=>0,recid=>recid,stamp=>stamp,tag=>tag,docompress=>true);
    IF done then
        dbms_output.put_line(' BACKUP: Unplugged example tablespace backed up.');
    else
        dbms_output.put_line(' BACKUP: Backup of example tablespace failed');
    end if;
  end;
/

SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

-- clean up the directory object now that we're done with it.
drop directory SS_IMPEXP_DIR;
drop directory SS_LOGPATH_DIR;

PROMPT
PROMPT Ready to transport export file &exp_file
PROMPT Ready to transport tablespace backup file &backup_file
PROMPT
PROMPT Please copy both, the tablespace backup and export file, to the target database location 

EXIT

