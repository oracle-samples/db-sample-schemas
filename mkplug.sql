Rem
Rem $Header: rdbms/demo/schema/mkplug.sql /st_rdbms_12.1/2 2014/06/26 10:02:08 lokeskum Exp $
Rem
Rem mkplug.sql
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
Rem      mkplug.sql - plug in transportable tablespace EXAMPLE
Rem
Rem    DESCRIPTION
Rem      tbd
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
Rem      lokeskum  06/25/14 - revert undo_management changes
Rem      lokeskum  06/19/14 - XbranchMerge lokeskum_lrg-12263194 from main
Rem      lokeskum  06/14/14 - include drop tablespace example
Rem      dgagne    10/11/13 - backout previous change.
Rem      dgagne    10/11/13 - tbs already read write after tts import
Rem      jstenois  07/18/13 - Fix TERRITORY to be AMERICA; not AMERICAN
Rem      dmatisha  12/05/12 - removing set TZ line because it is handled in
Rem                           tdss.tsc
Rem      dmatisha  11/09/12 - setting correct TZ
Rem      dmatisha  11/08/12 - fixing lrg 7324707
Rem      celsbern  07/05/12 - adding oe_data_path parameter to mkplug.sql
Rem      celsbern  04/24/12 - updating after cwm_user removal
Rem      krajaman  03/21/12 - Temporary fix for CBD from Satish
Rem      lokeskum  11/01/11 - include silent=banner paramter to impdp
Rem      jmadduku  02/18/11 - Grant Unlimited Tablespace priv with RESOURCE
Rem      celsbern  07/12/10 - added dump_path parameter
Rem      celsbern  07/07/10 - removing call to mk_expdp_do.sql script
Rem      celsbern  06/28/10 - fixing path for backup dfb file
Rem      celsbern  06/22/10 - removing mention of paths in prompts
Rem      celsbern  06/02/10 - converted to use impdp.
Rem      glyon     06/27/07 - grant CWM_USER role to SH user
Rem      bmccarth  05/29/07 - need territory american on external table
Rem      pabingha  02/26/07 - LRG 2871657 use dimension_exceptions
Rem      cbauwens  05/02/05 - bug4054905 Date & Time format 
Rem      cbauwens  04/19/05 - fix privs for SH and BI 
Rem      cbauwens  12/03/04 - add call to olp_v3.sql for cube metadata
Rem      cbauwens  10/29/04 - modifying privs after deprecation of connect 
Rem      cbauwens  07/26/04 - remove stylesheet tab 
Rem      rsahani   09/08/04 - privileges granted must be same
Rem			      as granted when creating schema
Rem      jcjeon    03/30/04 - fix lrg1628995 
Rem      huzhao    01/28/04 - validate certain AQ within IX schema after TTS import 
Rem      cbauwens  11/18/03 - lrg1582814 
Rem      cbauwens  08/21/03 - OMF support 
Rem      cbauwens  08/05/03 - profits view 
Rem      cbauwens  08/05/03 - company_id 
Rem      cbauwens  06/19/03 - bug_2878871
Rem      cbauwens  06/18/03 - bug_2878871
Rem      ahunold   03/27/03 - Objects not transported: lrg 1348159
Rem      ahunold   03/01/03 - Bug 2828348
Rem      ahunold   02/10/03 - grants AFTER mk_dir, TS ver. query
Rem      ahunold   01/27/03 - RMAN restore
Rem      ahunold   01/16/03 - CONNECT errors
Rem      ahunold   12/11/02 - password variables, line continuation
Rem      ahunold   09/30/02 - procedures, directories
Rem      ahunold   09/25/02 - imp logfile
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
PROMPT specify password for HR as parameter 2:
DEFINE password_hr         = &2
PROMPT
PROMPT specify password for OE as parameter 3:
DEFINE password_oe         = &3
PROMPT
PROMPT specify password for PM as parameter 4:
DEFINE password_pm         = &4
PROMPT
PROMPT specify password for IX as parameter 5:
DEFINE password_ix         = &5
PROMPT
PROMPT specify password for  SH as parameter 6:
DEFINE password_sh         = &6
PROMPT
PROMPT specify password for  BI as parameter 7:
DEFINE password_bi         = &7
PROMPT
PROMPT specify INPUT metadata import file as parameter 8:
DEFINE imp_file            = &8
PROMPT
PROMPT specify INPUT database backup file for tablespace EXAMPLE as parameter 9:
DEFINE data_file_backup    = &9
PROMPT
PROMPT specify OUTPUT database file for tablespace EXAMPLE as parameter 10:
DEFINE data_file_name      = &10
PROMPT 
PROMPT specify OUTPUT log directory as parameter 11:
DEFINE log_path            = &11
PROMPT
PROMPT specify OUTPUT dump file directory as parameter 12:
DEFINE dump_path           = &12
PROMPT
PROMPT specify oe data file directory for loading oe data as parameter 13:
DEFINE oe_data_path        = &13
PROMPT
PROMPT Sample Schemas are being plugged in  ...
PROMPT
DEFINE vrs = v3

SPOOL &log_path.mkplug_&vrs._@.log 

--
-- Running the instantiated mk_dir.sql, thus connecting
-- the DIRECTORY objects with the appropriate file system
-- paths on this specific system
--

CONNECT sys/&&password_sys AS SYSDBA;

SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

--
-- Creating users and granting system privileges
--

CREATE USER hr IDENTIFIED BY &&password_hr ;
CREATE USER oe IDENTIFIED BY &&password_oe ;
CREATE USER ix IDENTIFIED BY &&password_ix ;
CREATE USER sh IDENTIFIED BY &&password_sh ;
CREATE USER pm IDENTIFIED BY &&password_pm ;
CREATE USER bi IDENTIFIED BY &&password_bi ;

@__SUB__CWD__/mk_dir

GRANT CREATE SESSION			TO hr;
GRANT ALTER SESSION			TO hr;
GRANT CREATE DATABASE LINK		TO hr; 
GRANT CREATE SEQUENCE			TO hr;
GRANT CREATE SYNONYM			TO hr;
GRANT CREATE VIEW			TO hr;
GRANT RESOURCE , UNLIMITED TABLESPACE 				TO hr;
GRANT execute ON sys.dbms_stats 	TO hr;

GRANT CREATE SESSION 			TO oe;
GRANT CREATE DATABASE LINK		TO oe;
GRANT CREATE SYNONYM			TO oe;
GRANT CREATE VIEW			TO oe;
GRANT RESOURCE , UNLIMITED TABLESPACE 				TO oe;
GRANT CREATE MATERIALIZED VIEW  	TO oe;
GRANT QUERY REWRITE             	TO oe;
GRANT execute ON sys.dbms_stats 	TO oe;
grant create trigger                    TO oe;
grant xdbadmin                          To oe;
grant create any directory TO oe; 
GRANT drop any directory TO oe;
GRANT alter session TO oe;

GRANT CONNECT 				TO pm;
GRANT RESOURCE , UNLIMITED TABLESPACE 				TO pm;
GRANT execute ON sys.dbms_stats         TO pm;
GRANT READ ON DIRECTORY media_dir       TO pm; 

GRANT CONNECT 				TO ix;
GRANT RESOURCE , UNLIMITED TABLESPACE 				TO ix;

GRANT aq_administrator_role 		TO ix;
GRANT aq_user_role 			TO ix;

GRANT ALTER SESSION TO ix;
GRANT CREATE CLUSTER TO ix;
GRANT CREATE DATABASE LINK TO ix;
GRANT CREATE SEQUENCE TO ix;
GRANT CREATE SESSION TO ix;
GRANT CREATE SYNONYM TO ix;
GRANT CREATE TABLE TO ix;
GRANT CREATE VIEW TO ix;
GRANT CREATE CLUSTER TO ix;
GRANT CREATE INDEXTYPE TO ix;
GRANT CREATE OPERATOR TO ix;
GRANT CREATE PROCEDURE TO ix;
GRANT CREATE SEQUENCE TO ix;
GRANT CREATE TABLE TO ix;
GRANT CREATE TRIGGER TO ix;
GRANT CREATE TYPE TO ix;
GRANT CREATE SESSION TO ix;

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE, SELECT_CATALOG_ROLE TO ix; 

GRANT EXECUTE ON sys.dbms_stats         TO ix;
GRANT EXECUTE ON DBMS_AQ                TO ix;
GRANT EXECUTE ON DBMS_AQADM             TO ix;
GRANT EXECUTE ON DBMS_APPLY_ADM 	TO ix;
GRANT EXECUTE ON DBMS_CAPTURE_ADM 	TO ix;
GRANT EXECUTE ON DBMS_FLASHBACK 	TO ix;
GRANT EXECUTE ON DBMS_PROPAGATION_ADM 	TO ix;
GRANT EXECUTE ON DBMS_STREAMS_ADM 	TO ix;
GRANT SELECT ANY DICTIONARY 		TO ix;

EXECUTE DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE( -	
    privilege    => DBMS_RULE_ADM.CREATE_RULE_SET_OBJ,  -
    grantee      => 'ix', - 
    grant_option => FALSE);

EXECUTE DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE( -
    privilege    => DBMS_RULE_ADM.CREATE_RULE_OBJ,  -
    grantee      => 'ix', - 
    grant_option => FALSE);

GRANT CREATE SESSION                    TO sh;
GRANT CREATE TABLE                      TO sh;
GRANT CREATE VIEW                       TO sh;
GRANT CREATE CLUSTER                    TO sh;
GRANT ALTER SESSION                     TO sh;
GRANT CREATE SEQUENCE                   TO sh;
GRANT CREATE SYNONYM                    TO sh;
GRANT CREATE DATABASE LINK              TO sh;
GRANT CREATE DIMENSION         		TO sh;
GRANT QUERY REWRITE            		TO sh;
GRANT CREATE MATERIALIZED VIEW 		TO sh;
GRANT CREATE VIEW 		        TO sh;
GRANT RESOURCE , UNLIMITED TABLESPACE              		TO sh;
GRANT select_catalog_role   		TO sh;
GRANT execute ON sys.dbms_stats 	TO sh;
rem   ALTER USER sh GRANT CONNECT THROUGH olapsvr;

GRANT CREATE SESSION                    TO bi;
GRANT CREATE TABLE                      TO bi;
GRANT CREATE VIEW                       TO bi;
GRANT CREATE CLUSTER                    TO bi;
GRANT ALTER SESSION                     TO bi;
GRANT CREATE SEQUENCE                   TO bi;
GRANT CREATE SYNONYM                    TO bi;
GRANT CREATE DATABASE LINK              TO bi;
GRANT RESOURCE , UNLIMITED TABLESPACE 				TO bi;

--
-- Restoring database file backup
-- (Using RMAN works in OMF, OCFS, raw devices and in normal file systems)
--

set echo off;
set serveroutput on;
SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;
variable new_datafile varchar2(512)
declare
  done boolean;
  v_db_create_file_dest VARCHAR2(512);
  devicename varchar2(255);
  data_file_id number;
  rec_id number;
  stamp number;
  resetlogs_change number;
  creation_change number;
  checkpoint_change number;
  blksize number; 
  omfname varchar2(512);
  real_file_name varchar2(512);
  v_is_pdb number;

  begin
    dbms_output.put_line(' ');
    dbms_output.put_line(' Allocating device.... ');
    dbms_output.put_line(' Specifying datafiles... ');
       devicename := dbms_backup_restore.deviceAllocate;
    dbms_output.put_line(' Specifing datafiles... ');

/*************************************************************************/
/* Note that the 'select 10' statement below here is a workaround for    */
/* INSTALL and pdb databases.                                            */
/* If you receive an error about not being able to find a tablespace     */
/* the file_id needs to change from 10 to something else.                */
/*************************************************************************/

    select 10 into data_file_id from dual;

    SELECT value INTO v_db_create_file_dest FROM v$parameter WHERE name ='db_create_file_dest';
    IF v_db_create_file_dest IS NOT NULL
     THEN
      dbms_backup_restore.restoreSetDataFile;
      dbms_backup_restore.getOMFFileName('EXAMPLE',omfname);
      dbms_backup_restore.restoreDataFileTo(data_file_id, omfname, 0,'EXAMPLE');
     ELSE
      dbms_backup_restore.restoreSetDataFile; 
      dbms_backup_restore.restoreDataFileTo(data_file_id,'&data_file_name');
     END IF;
    dbms_output.put_line(' Restoring ... ');
    dbms_backup_restore.restoreBackupPiece('&dump_path'||'&data_file_backup', done);
    SELECT max(recid) INTO rec_id FROM v$datafile_copy;

    -- Now get the real file name. It could be also OMF filename
    SELECT name, stamp, resetlogs_change#, creation_change#, checkpoint_change#,block_size
    INTO real_file_name, stamp,resetlogs_change, creation_change, checkpoint_change, blksize
    FROM V$DATAFILE_COPY
    WHERE recid = rec_id and rfile# = data_file_id;

    -- Set the bindvariable to the real filename                                       
    :new_datafile := real_file_name;

    -- Uncatalog the file from V$DATAFILE_COPY. This important.
    dbms_backup_restore.deleteDataFileCopy(recid => rec_id, 
                                           stamp => stamp, 
                                           fname => real_file_name,
                                           dfnumber => data_file_id, 
                                           resetlogs_change => resetlogs_change, 
                                           creation_change => creation_change, 
                                           checkpoint_change => checkpoint_change, 
                                           blksize => blksize,
                                           no_delete => 1, 
                                           force => 1);
    if done then
        dbms_output.put_line(' Restore done.');
    else
        dbms_output.put_line(' ORA-XXXX: Restore failed ');
    end if;
  end;
/
rem Transfer the value from the bind variable to the substitution variable
rem so it can be used in the imp command
col subnew_datafile new_value datafile noprint
select :new_datafile subnew_datafile from dual;

SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

-- create the 'SS_IMPEXP_DIR' directory object for imp/exp
-- this will be explicitly dropped at the end.
create or replace directory SS_IMPEXP_DIR as '&dump_path';
grant read,write on directory SS_IMPEXP_DIR to public;
create or replace directory SS_LOGPATH_DIR as '&log_path';
grant read,write on directory SS_LOGPATH_DIR to public;

--
-- Importing the metadata and plugging in the tablespace at the same
-- time, using the restored database file 
--

-- When importing use filename got after restore is finished
host impdp "'sys/&&password_sys AS SYSDBA'" directory=SS_IMPEXP_DIR logfile=SS_LOGPATH_DIR:tts_example_imp.log dumpfile=&imp_file transport_datafiles='&datafile' EXCLUDE=trigger,functional_index,index_statistics silent=banner

CONNECT sys/&&password_sys AS SYSDBA;

SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

ALTER TABLESPACE example READ WRITE;

COLUMN tablespace_name FORMAT A15
COLUMN file_name       FORMAT A46
 
SELECT    tablespace_name, file_name, status
 FROM     dba_data_files
 ORDER BY file_id;


REM	
REM   Now we rebuild the objects that cannot 
REM   be part of a transportable tablespace set
REM   ==========================================
REM

PROMPT
PROMPT Creating sequences, views, procedures and objects privileges for HR ...
SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

CONNECT hr/&&password_hr;

--
-- Sequences
--

CREATE SEQUENCE locations_seq
 START WITH     3300
 INCREMENT BY   100
 MAXVALUE       9900
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE departments_seq
 START WITH     280
 INCREMENT BY   10
 MAXVALUE       9990
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE employees_seq
 START WITH     207
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

--
-- Views
--

CREATE OR REPLACE VIEW emp_details_view
  (employee_id,
   job_id,
   manager_id,
   department_id,
   location_id,
   country_id,
   first_name,
   last_name,
   salary,
   commission_pct,
   department_name,
   job_title,
   city,
   state_province,
   country_name,
   region_name)
AS SELECT
  e.employee_id, 
  e.job_id, 
  e.manager_id, 
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id 
WITH READ ONLY;

--
-- Rebuilding procedural objects
--

@__SUB__CWD__/human_resources/hr_code

-- rebuild OE by dropping and recreating
CONNECT sys/&&password_sys AS SYSDBA;

drop user oe cascade;
CREATE USER oe IDENTIFIED BY &&password_oe ;
GRANT CREATE SESSION TO oe;
GRANT CREATE DATABASE LINK TO oe;
GRANT CREATE SYNONYM TO oe;
GRANT CREATE VIEW TO oe;
GRANT RESOURCE,UNLIMITED TABLESPACE TO oe;
GRANT CREATE MATERIALIZED VIEW TO oe;
GRANT QUERY REWRITE TO oe;
GRANT execute ON sys.dbms_stats to oe;
grant create trigger TO oe;
grant xdbadmin To oe;
grant create any directory TO oe; 
GRANT drop any directory TO oe;
GRANT alter session TO oe;

@__SUB__CWD__/order_entry/oe_main.sql &&password_oe EXAMPLE TEMP  &&password_hr &&password_sys &&oe_data_path &&log_path &vrs

-- 
-- oe_main.sql creates and closes it's own log file.  start part2 of mkplug here
--
-- the '.' is the sql concat charater - that's why there are 2 '.' before log

SPOOL &log_path.mkplug_p2_&vrs..log 

--
-- Object privileges
--

connect hr/&&password_hr;

GRANT REFERENCES, SELECT ON employees 	TO oe;
GRANT REFERENCES, SELECT ON countries 	TO oe;
GRANT REFERENCES, SELECT ON locations 	TO oe;
GRANT SELECT ON jobs 			TO oe;
GRANT SELECT ON job_history 		TO oe;
GRANT SELECT ON departments 		TO oe;

PROMPT
PROMPT Creating synonyms, sequences, views and functions for OE ...
SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

CONNECT oe/&&password_oe;

--
-- Create cross-schema synonyms
--

GRANT SELECT ON bombay_inventory 	TO bi;
GRANT SELECT ON customers 		TO bi;
GRANT SELECT ON inventories 		TO bi;
GRANT SELECT ON orders 			TO bi;
GRANT SELECT ON order_items 		TO bi;
GRANT SELECT ON products 		TO bi;
GRANT SELECT ON product_descriptions	TO bi;
GRANT SELECT ON product_information 	TO bi;
GRANT SELECT ON product_prices 		TO bi;
GRANT SELECT ON promotions 		TO bi;
GRANT SELECT ON sydney_inventory 	TO bi;
GRANT SELECT ON toronto_inventory 	TO bi;
GRANT SELECT ON warehouses 		TO bi;

GRANT REFERENCES, SELECT ON product_information TO pm;
GRANT SELECT ON order_items 			TO pm;
GRANT SELECT ON orders 				TO pm;
GRANT SELECT ON product_descriptions 		TO pm;
GRANT SELECT ON inventories 			TO pm;
GRANT SELECT ON customers 			TO pm;
GRANT SELECT ON warehouses 			TO pm;

PROMPT
PROMPT Creating dimensions, materialized views, external table and object privileges for SH ...
SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

CONNECT sh/&&password_sh;

CREATE DIMENSION customers_dim 
	LEVEL customer		IS (customers.cust_id)
	LEVEL city 		IS (customers.cust_city_id) 
	LEVEL state 		IS (customers.cust_state_province_id) 
	LEVEL country 		IS (countries.country_id) 
	LEVEL subregion		IS (countries.country_subregion_id) 
	LEVEL region 		IS (countries.country_region_id) 
	LEVEL geog_total 	IS (countries.country_total_id) 
	LEVEL cust_total 	IS (customers.cust_total_id) 
	HIERARCHY cust_rollup (customer	CHILD OF
			       city		CHILD OF 
			       state		CHILD OF 
			       cust_total)
	HIERARCHY geog_rollup (customer	CHILD OF
			       city		CHILD OF 
			       state		CHILD OF 
			       country 		CHILD OF 
			       subregion 	CHILD OF
			       region   	CHILD OF
			       geog_total
	JOIN KEY (customers.country_id) REFERENCES country)
	ATTRIBUTE customer DETERMINES
	(cust_first_name, cust_last_name, cust_gender, 
	 cust_marital_status, cust_year_of_birth, 
	 cust_income_level, cust_credit_limit,
         cust_street_address, cust_postal_code,
         cust_main_phone_number, cust_email)
        ATTRIBUTE city DETERMINES (cust_city) 
        ATTRIBUTE state DETERMINES (cust_state_province) 
	ATTRIBUTE country DETERMINES (countries.country_name,countries.country_iso_code)
        ATTRIBUTE subregion DETERMINES (countries.country_subregion)
        ATTRIBUTE region DETERMINES (countries.country_region) 
        ATTRIBUTE geog_total DETERMINES (countries.country_total) 
        ATTRIBUTE cust_total DETERMINES (customers.cust_total);
COMMIT;

CREATE DIMENSION products_dim 
	LEVEL product 		IS (products.prod_id)
 	LEVEL subcategory 	IS (products.prod_subcategory_id) 
	LEVEL category		IS (products.prod_category_id) 
	LEVEL prod_total	IS (products.prod_total_id) 
	HIERARCHY prod_rollup (product	CHILD OF 
			       subcategory 	CHILD OF 
			       category         CHILD OF
			       prod_total) 
	ATTRIBUTE product DETERMINES 
        (products.prod_name, products.prod_desc,
         prod_weight_class, prod_unit_of_measure,
         prod_pack_size,prod_status, prod_list_price, prod_min_price)
	ATTRIBUTE subcategory DETERMINES 
        (prod_subcategory, prod_subcategory_desc)
	ATTRIBUTE category DETERMINES 
        (prod_category, prod_category_desc)
	ATTRIBUTE prod_total DETERMINES 
        (prod_total);

CREATE DIMENSION times_dim
   LEVEL day         IS TIMES.TIME_ID
   LEVEL month       IS TIMES.CALENDAR_MONTH_ID
   LEVEL quarter     IS TIMES.CALENDAR_QUARTER_ID
   LEVEL year        IS TIMES.CALENDAR_YEAR_ID
   LEVEL fis_week    IS TIMES.WEEK_ENDING_DAY_ID
   LEVEL fis_month   IS TIMES.FISCAL_MONTH_ID
   LEVEL fis_quarter IS TIMES.FISCAL_QUARTER_ID
   LEVEL fis_year    IS TIMES.FISCAL_YEAR_ID
   HIERARCHY cal_rollup    (day     	CHILD OF
   			    month 	CHILD OF
   			    quarter 	CHILD OF
   			    year)
   HIERARCHY fis_rollup    (day     	CHILD OF
   			    fis_week   	CHILD OF
   			    fis_month	CHILD OF
   			    fis_quarter	CHILD OF
   			    fis_year)
   ATTRIBUTE day DETERMINES 
	(day_number_in_week, day_name, day_number_in_month,
         calendar_week_number)
   ATTRIBUTE month DETERMINES
	(calendar_month_desc,
         calendar_month_number, calendar_month_name,
         days_in_cal_month, end_of_cal_month)
   ATTRIBUTE quarter DETERMINES
	(calendar_quarter_desc,
         calendar_quarter_number,days_in_cal_quarter,
	 end_of_cal_quarter)
   ATTRIBUTE year DETERMINES
	(calendar_year,
         days_in_cal_year, end_of_cal_year)
   ATTRIBUTE fis_week DETERMINES
	(week_ending_day,
         fiscal_week_number)
   ATTRIBUTE fis_month DETERMINES
	(fiscal_month_desc, fiscal_month_number, fiscal_month_name,
	 days_in_fis_month, end_of_fis_month)
   ATTRIBUTE fis_quarter DETERMINES
	(fiscal_quarter_desc,
         fiscal_quarter_number, days_in_fis_quarter,
	 end_of_fis_quarter)
   ATTRIBUTE fis_year DETERMINES
	(fiscal_year, 
         days_in_fis_year, end_of_fis_year);

CREATE DIMENSION channels_dim
	LEVEL channel 	    IS (channels.channel_id) 
	LEVEL channel_class IS (channels.channel_class_id) 
	LEVEL channel_total IS (channels.channel_total_id) 
	HIERARCHY channel_rollup (channel	CHILD OF 
				  channel_class	CHILD OF 
				  channel_total)
        ATTRIBUTE channel DETERMINES (channel_desc)
        ATTRIBUTE channel_class DETERMINES (channel_class)
        ATTRIBUTE channel_total DETERMINES (channel_total);

CREATE DIMENSION promotions_dim 
	LEVEL promo 	  	IS (promotions.promo_id) 
	LEVEL subcategory 	IS (promotions.promo_subcategory_id) 
	LEVEL category 	  	IS (promotions.promo_category_id) 
	LEVEL promo_total 	IS (promotions.promo_total_id) 
	HIERARCHY promo_rollup (promo 		CHILD OF 
				subcategory 	CHILD OF 
				category	CHILD OF
				promo_total) 
	ATTRIBUTE promo DETERMINES 
        (promo_name, promo_cost,
         promo_begin_date, promo_end_date)
        ATTRIBUTE subcategory DETERMINES (promo_subcategory)
        ATTRIBUTE category DETERMINES (promo_category)
        ATTRIBUTE promo_total DETERMINES (promo_total);

SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

CREATE OR REPLACE VIEW profits
 AS SELECT 
        s.channel_id, 
        s.cust_id, 
        s.prod_id, 
        s.promo_id, 
        s.time_id,
        c.unit_cost, 
        c.unit_price, 
        s.amount_sold, 
        s.quantity_sold,
        c.unit_cost * s.quantity_sold TOTAL_COST
 FROM   costs c, sales s
 WHERE c.prod_id = s.prod_id
   AND c.time_id = s.time_id
   AND c.channel_id = s.channel_id
   AND c.promo_id = s.promo_id;

--
-- External Table
--

CREATE TABLE sales_transactions_ext
( PROD_ID        NUMBER,
  CUST_ID 	 NUMBER,
  TIME_ID 	 DATE,
  CHANNEL_ID 	 NUMBER,
  PROMO_ID 	 NUMBER,
  QUANTITY_SOLD  NUMBER,
  AMOUNT_SOLD 	 NUMBER(10,2),
  UNIT_COST 	 NUMBER(10,2),
  UNIT_PRICE 	 NUMBER(10,2)
)
ORGANIZATION external 
(
  TYPE oracle_loader
  DEFAULT DIRECTORY data_file_dir
  ACCESS PARAMETERS 
  (
    RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
    TERRITORY AMERICA
    BADFILE log_file_dir:'ext_1v3.bad'
    LOGFILE log_file_dir:'ext_1v3.log'
    FIELDS TERMINATED BY "|" OPTIONALLY ENCLOSED BY '^' LDRTRIM 
    ( PROD_ID         ,
      CUST_ID         ,
      TIME_ID         DATE(10) "YYYY-MM-DD", 
      CHANNEL_ID      ,
      PROMO_ID        ,
      QUANTITY_SOLD   ,
      AMOUNT_SOLD     ,
      UNIT_COST       ,
      UNIT_PRICE      
    ) 
 )
 LOCATION
 ('sale1v3.dat')
)
REJECT LIMIT 100;

PROMPT
PROMPT Creating OLAP metadata ...


--
-- Object Privileges
--

GRANT SELECT ON channels		TO bi;
GRANT SELECT ON countries		TO bi;
GRANT SELECT ON times			TO bi;
GRANT SELECT ON costs			TO bi;
GRANT SELECT ON customers		TO bi;
GRANT SELECT ON products		TO bi;
GRANT SELECT ON promotions		TO bi;
GRANT SELECT ON sales			TO bi;
GRANT SELECT ON times			TO bi;
GRANT SELECT ON cal_month_sales_mv	TO bi;
GRANT SELECT ON sh.fweek_pscat_sales_mv	TO bi;

PROMPT
PROMPT Creating views, synonyms for BI ...
SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;

@__SUB__CWD__/bus_intelligence/bi_views.sql &&password_bi

--
-- set up extra contraints in the PM schema
connect pm/&&password_pm;

ALTER TABLE print_media
ADD ( CONSTRAINT printmedia_fk
        FOREIGN KEY (product_id)
        REFERENCES oe.product_information(product_id) ) ;

ALTER TABLE online_media
ADD ( CONSTRAINT loc_c_id_fk
        FOREIGN KEY (product_id)
        REFERENCES oe.product_information(product_id)   ) ;


connect sys/&&password_sys as sysdba

-- reanalyze everything so that we're all up to date
connect oe/&&password_oe;
@__SUB__CWD__/order_entry/oe_analz
connect pm/&&password_pm;
@__SUB__CWD__/product_media/pm_analz
connect hr/&&password_hr;
@__SUB__CWD__/human_resources/hr_analz
connect sh/&&password_sh
@__SUB__CWD__/sales_history/sh_analz

REM Validate certain AQ within IX schema after TTS import

CONNECT sys/&&password_sys AS SYSDBA;
EXECUTE dbms_aqadm_sys.validate_Queue('IX', 'AQ$_ORDERS_QUEUETABLE_E');
EXECUTE dbms_aqadm_sys.validate_Queue('IX', 'AQ$_STREAMS_QUEUE_TABLE_E');
EXECUTE dbms_aqadm_sys.validate_Queue('IX', 'ORDERS_QUEUE');
EXECUTE dbms_aqadm_sys.validate_Queue('IX', 'STREAMS_QUEUE');

-- renanalyze ix
EXECUTE dbms_stats.gather_schema_stats('IX');

-- clean up the directory object now that we're done with it.
drop directory SS_IMPEXP_DIR;
drop directory SS_LOGPATH_DIR;

-- fix up the coe_% public synonyms
CREATE OR REPLACE PUBLIC SYNONYM COE_CONFIGURATION FOR COE_CONFIGURATION;
CREATE OR REPLACE PUBLIC SYNONYM COE_NAMESPACES FOR COE_NAMESPACES;
CREATE OR REPLACE PUBLIC SYNONYM COE_DOM_HELPER FOR COE_DOM_HELPER;
CREATE OR REPLACE PUBLIC SYNONYM COE_UTILITIES FOR COE_UTILITIES;
CREATE OR REPLACE PUBLIC SYNONYM COE_TOOLS FOR COE_TOOLS;

-- check for invalid objects
select count(*) , ' Invalid Objects' from dba_objects where status = 'INVALID';
select owner,object_name, object_type
from dba_objects where status = 'INVALID';


PROMPT
PROMPT mkplug.sql DONE
SELECT TO_CHAR(systimestamp, 'YYYYMMDD HH:MI:SS')  FROM dual;
