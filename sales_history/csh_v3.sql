Rem
Rem $Header: rdbms/demo/schema/sales_history/csh_v3.sql /main/11 2011/01/19 12:56:23 celsbern Exp $
Rem
Rem csh_v3.sql
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
Rem      csh_v3.sql - Create 10i SH objects
Rem
Rem    DESCRIPTION
Rem      Creates tables, referential integrity constraints  
Rem
Rem    NOTES
Rem      Does not create indexes. These are created after the load
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    celsbern    12/08/10 - widening cust_email column to fix bug 6962986
Rem    cbauwens    07/16/03 - add ODM table
Rem                           supplementary_demographics
Rem    ahunold     05/07/03 - ahunold_remove_company_id
Rem    ahunold     03/11/03 - slowly changing dimensions
Rem    ahunold     03/03/03 - new product names and weight classes Rem                           company_id=1
Rem    ahunold     02/20/03 - compress some partitions, add primary to ODM tables
Rem    ahunold     01/22/03 - country_iso_code
Rem    ahunold     01/16/03 - bug 2487961 reopened
Rem    ahunold     12/17/02 - eliminate _old columns
Rem    ahunold     10/25/02 - promotion_name
Rem    ahunold     10/14/02 - ODM tables
Rem    ahunold     09/16/02 - no primary
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     08/20/02 - constraints added
Rem    ahunold     07/31/02 - Created
Rem

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100

CREATE TABLE sales (
    prod_id 		NUMBER 		NOT NULL,
    cust_id 		NUMBER 		NOT NULL,
    time_id 		DATE 		NOT NULL,
    channel_id 		NUMBER	 	NOT NULL,
    promo_id 		NUMBER 		NOT NULL,
    quantity_sold 	NUMBER(10,2) 	NOT NULL,
    amount_sold 	NUMBER(10,2) 	NOT NULL)
 --
 -- table wide physical specs
 --
 PCTFREE 5 NOLOGGING NOCOMPRESS  
 --
 -- partitions
 --  
 PARTITION BY RANGE (time_id)
  ( partition sales_1995 VALUES LESS THAN
     (TO_DATE('1996-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_1996 VALUES LESS THAN
     (TO_DATE('1997-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_h1_1997 VALUES LESS THAN  
     (TO_DATE('1997-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_h2_1997 VALUES LESS THAN  
     (TO_DATE('1998-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q1_1998 VALUES LESS THAN
     (TO_DATE('1998-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q2_1998 VALUES LESS THAN
     (TO_DATE('1998-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q3_1998 VALUES LESS THAN
     (TO_DATE('1998-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q4_1998 VALUES LESS THAN
     (TO_DATE('1999-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q1_1999 VALUES LESS THAN
     (TO_DATE('1999-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q2_1999 VALUES LESS THAN
     (TO_DATE('1999-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q3_1999 VALUES LESS THAN
     (TO_DATE('1999-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q4_1999 VALUES LESS THAN
     (TO_DATE('2000-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q1_2000 VALUES LESS THAN
     (TO_DATE('2000-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q2_2000 VALUES LESS THAN
     (TO_DATE('2000-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q3_2000 VALUES LESS THAN
     (TO_DATE('2000-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q4_2000 VALUES LESS THAN
     (TO_DATE('2001-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q1_2001 VALUES LESS THAN
     (TO_DATE('2001-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q2_2001 VALUES LESS THAN
     (TO_DATE('2001-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q3_2001 VALUES LESS THAN
     (TO_DATE('2001-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q4_2001 VALUES LESS THAN
     (TO_DATE('2002-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q1_2002 VALUES LESS THAN
     (TO_DATE('2002-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q2_2002 VALUES LESS THAN
     (TO_DATE('2002-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q3_2002 VALUES LESS THAN
     (TO_DATE('2002-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q4_2002 VALUES LESS THAN
     (TO_DATE('2003-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q1_2003 VALUES LESS THAN
     (TO_DATE('2003-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q2_2003 VALUES LESS THAN
     (TO_DATE('2003-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q3_2003 VALUES LESS THAN
     (TO_DATE('2003-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition sales_q4_2003 VALUES LESS THAN
     (TO_DATE('2004-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')));

CREATE TABLE costs (
    prod_id 	NUMBER 		NOT NULL,
    time_id 	DATE 			NOT NULL,
    promo_id	NUMBER		NOT NULL,
    channel_id	NUMBER		NOT NULL,
    unit_cost 	NUMBER(10,2) 	NOT NULL,
    unit_price 	NUMBER(10,2) 	NOT NULL)
 --
 -- table wide physical specs
 --
 PCTFREE 5 NOLOGGING NOCOMPRESS  
 --
 -- partitions
 -- 
 PARTITION BY RANGE (time_id)
  ( partition costs_1995 VALUES LESS THAN
     (TO_DATE('1996-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_1996 VALUES LESS THAN
     (TO_DATE('1997-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_h1_1997 VALUES LESS THAN  
     (TO_DATE('1997-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_h2_1997 VALUES LESS THAN  
     (TO_DATE('1998-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q1_1998 VALUES LESS THAN
     (TO_DATE('1998-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q2_1998 VALUES LESS THAN
     (TO_DATE('1998-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q3_1998 VALUES LESS THAN
     (TO_DATE('1998-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q4_1998 VALUES LESS THAN
     (TO_DATE('1999-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q1_1999 VALUES LESS THAN
     (TO_DATE('1999-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q2_1999 VALUES LESS THAN
     (TO_DATE('1999-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q3_1999 VALUES LESS THAN
     (TO_DATE('1999-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q4_1999 VALUES LESS THAN
     (TO_DATE('2000-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q1_2000 VALUES LESS THAN
     (TO_DATE('2000-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q2_2000 VALUES LESS THAN
     (TO_DATE('2000-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q3_2000 VALUES LESS THAN
     (TO_DATE('2000-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q4_2000 VALUES LESS THAN
     (TO_DATE('2001-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q1_2001 VALUES LESS THAN
     (TO_DATE('2001-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q2_2001 VALUES LESS THAN
     (TO_DATE('2001-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q3_2001 VALUES LESS THAN
     (TO_DATE('2001-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q4_2001 VALUES LESS THAN
     (TO_DATE('2002-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q1_2002 VALUES LESS THAN
     (TO_DATE('2002-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q2_2002 VALUES LESS THAN
     (TO_DATE('2002-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q3_2002 VALUES LESS THAN
     (TO_DATE('2002-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q4_2002 VALUES LESS THAN
     (TO_DATE('2003-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q1_2003 VALUES LESS THAN
     (TO_DATE('2003-04-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q2_2003 VALUES LESS THAN
     (TO_DATE('2003-07-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q3_2003 VALUES LESS THAN
     (TO_DATE('2003-10-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    partition costs_q4_2003 VALUES LESS THAN
     (TO_DATE('2004-01-01 00:00:00','SYYYY-MM-DD HH24:MI:SS','NLS_CALENDAR=GREGORIAN')));

CREATE TABLE times (
    time_id 			DATE 		NOT NULL,
    day_name 			VARCHAR2(9)	NOT NULL,
    day_number_in_week 		NUMBER(1)	NOT NULL,
    day_number_in_month 	NUMBER(2)	NOT NULL,
    calendar_week_number 	NUMBER(2)	NOT NULL,
    fiscal_week_number 		NUMBER(2)	NOT NULL,
    week_ending_day 		DATE		NOT NULL,
    week_ending_day_id	 	NUMBER		NOT NULL,
    calendar_month_number 	NUMBER(2)	NOT NULL,
    fiscal_month_number 	NUMBER(2)	NOT NULL,
    calendar_month_desc 	VARCHAR2(8)	NOT NULL,
    calendar_month_id	 	NUMBER		NOT NULL,
    fiscal_month_desc 		VARCHAR2(8)	NOT NULL,
    fiscal_month_id	 	NUMBER		NOT NULL,
    days_in_cal_month 		NUMBER		NOT NULL,
    days_in_fis_month 		NUMBER		NOT NULL,
    end_of_cal_month 		DATE		NOT NULL,
    end_of_fis_month 		DATE		NOT NULL,
    calendar_month_name 	VARCHAR2(9)	NOT NULL,
    fiscal_month_name 		VARCHAR2(9)	NOT NULL,
    calendar_quarter_desc 	CHAR(7)		NOT NULL,
    calendar_quarter_id	 	NUMBER		NOT NULL,
    fiscal_quarter_desc 	CHAR(7)		NOT NULL,
    fiscal_quarter_id	 	NUMBER		NOT NULL,
    days_in_cal_quarter 	NUMBER		NOT NULL,
    days_in_fis_quarter 	NUMBER		NOT NULL,
    end_of_cal_quarter 		DATE		NOT NULL,
    end_of_fis_quarter 		DATE		NOT NULL,
    calendar_quarter_number 	NUMBER(1)	NOT NULL,
    fiscal_quarter_number 	NUMBER(1)	NOT NULL,
    calendar_year 		NUMBER(4)	NOT NULL,
    calendar_year_id 		NUMBER		NOT NULL,
    fiscal_year 		NUMBER(4)	NOT NULL,
    fiscal_year_id 		NUMBER		NOT NULL,
    days_in_cal_year 		NUMBER		NOT NULL,
    days_in_fis_year 		NUMBER		NOT NULL,
    end_of_cal_year 		DATE		NOT NULL,
    end_of_fis_year 		DATE		NOT NULL );

CREATE TABLE products (
    prod_id 			NUMBER(6) 	NOT NULL,
    prod_name 			VARCHAR2(50)	NOT NULL,
    prod_desc 			VARCHAR2(4000)	NOT NULL,
    prod_subcategory 		VARCHAR2(50)	NOT NULL,
    prod_subcategory_id		NUMBER		NOT NULL,
    prod_subcategory_desc	VARCHAR2(2000)	NOT NULL,
    prod_category 		VARCHAR2(50)	NOT NULL,
    prod_category_id 		NUMBER		NOT NULL,
    prod_category_desc 		VARCHAR2(2000)	NOT NULL,
    prod_weight_class 		NUMBER(3)	NOT NULL,
    prod_unit_of_measure 	VARCHAR2(20)	,
    prod_pack_size 		VARCHAR2(30)	NOT NULL,
    supplier_id 		NUMBER(6)	NOT NULL,
    prod_status 		VARCHAR2(20)	NOT NULL,
    prod_list_price 		NUMBER(8,2)	NOT NULL,
    prod_min_price 		NUMBER(8,2)	NOT NULL,
    prod_total 			VARCHAR2(13)	NOT NULL,
    prod_total_id 		NUMBER		NOT NULL,
    prod_src_id        		NUMBER		,
    prod_eff_from      		DATE		,
    prod_eff_to        		DATE		,
    prod_valid         		VARCHAR2(1)	);

CREATE TABLE channels (
    channel_id 			NUMBER	 	NOT NULL,
    channel_desc 		VARCHAR2(20)	NOT NULL,
    channel_class 		VARCHAR2(20)	NOT NULL,
    channel_class_id 		NUMBER		NOT NULL,
    channel_total 		VARCHAR2(13)	NOT NULL,
    channel_total_id 		NUMBER		NOT NULL);

CREATE TABLE promotions (
    promo_id 			NUMBER(6) 	NOT NULL,
    promo_name 			VARCHAR2(30)	NOT NULL,
    promo_subcategory 		VARCHAR2(30)	NOT NULL,
    promo_subcategory_id 	NUMBER		NOT NULL,
    promo_category 		VARCHAR2(30)	NOT NULL,
    promo_category_id 		NUMBER		NOT NULL,
    promo_cost 			NUMBER(10,2)	NOT NULL,
    promo_begin_date 		DATE		NOT NULL,
    promo_end_date 		DATE		NOT NULL,
    promo_total			VARCHAR2(15)	NOT NULL,
    promo_total_id 		NUMBER		NOT NULL);

CREATE TABLE customers (
    cust_id 			NUMBER 		NOT NULL,
    cust_first_name 		VARCHAR2(20)	NOT NULL,
    cust_last_name 		VARCHAR2(40)	NOT NULL,
    cust_gender 		CHAR(1)		NOT NULL,
    cust_year_of_birth 		NUMBER(4)	NOT NULL,
    cust_marital_status 	VARCHAR2(20)	,
    cust_street_address 	VARCHAR2(40)	NOT NULL,
    cust_postal_code 		VARCHAR2(10)	NOT NULL,
    cust_city 			VARCHAR2(30)	NOT NULL,
    cust_city_id 		NUMBER		NOT NULL,
    cust_state_province 	VARCHAR2(40)	NOT NULL,
    cust_state_province_id 	NUMBER		NOT NULL,
    country_id	 		NUMBER		NOT NULL,
    cust_main_phone_number 	VARCHAR2(25)	NOT NULL,
    cust_income_level 		VARCHAR2(30)	,
    cust_credit_limit 		NUMBER		,
    cust_email 			VARCHAR2(50)	,
    cust_total 			VARCHAR2(14)	NOT NULL,
    cust_total_id 		NUMBER		NOT NULL,
    cust_src_id        		NUMBER		,
    cust_eff_from      		DATE		,
    cust_eff_to        		DATE		,
    cust_valid         		VARCHAR2(1)	);

CREATE TABLE countries (
    country_id 			NUMBER		NOT NULL,
    country_iso_code 		CHAR(2)		NOT NULL,
    country_name 		VARCHAR2(40)	NOT NULL,
    country_subregion 		VARCHAR2(30)	NOT NULL,
    country_subregion_id 	NUMBER		NOT NULL,
    country_region 		VARCHAR2(20)	NOT NULL,
    country_region_id 		NUMBER		NOT NULL,
    country_total 		VARCHAR2(11)	NOT NULL,
    country_total_id 		NUMBER		NOT NULL,
    country_name_hist 		VARCHAR2(40));


CREATE TABLE supplementary_demographics
  ( CUST_ID          NUMBER not null,
    EDUCATION        VARCHAR2(21),
    OCCUPATION       VARCHAR2(21),
    HOUSEHOLD_SIZE   VARCHAR2(21),
    YRS_RESIDENCE    NUMBER,
    AFFINITY_CARD    NUMBER(10),
    bulk_pack_diskettes NUMBER(10),
    flat_panel_monitor  NUMBER(10),
    home_theater_package NUMBER(10),
    bookkeeping_application NUMBER(10),
    printer_supplies NUMBER(10),
    y_box_games NUMBER(10),
    os_doc_set_kanji NUMBER(10),
    COMMENTS         VARCHAR2(4000));

PROMPT
PROMPT Creating constraints ...

--
-- PROMOTIONS
--

ALTER TABLE promotions
  ADD CONSTRAINT promo_pk
  PRIMARY KEY (promo_id)
  DISABLE NOVALIDATE;

ALTER TABLE sales
  ADD CONSTRAINT sales_promo_fk
  FOREIGN KEY (promo_id) REFERENCES promotions (promo_id)
  DISABLE NOVALIDATE;

ALTER TABLE costs
  ADD CONSTRAINT costs_promo_fk
  FOREIGN KEY (promo_id) REFERENCES promotions (promo_id)
  DISABLE NOVALIDATE;

--
-- CUSTOMERS
--

ALTER TABLE customers
  ADD CONSTRAINT customers_pk
  PRIMARY KEY (cust_id)
  DISABLE NOVALIDATE;

ALTER TABLE sales
  ADD CONSTRAINT sales_customer_fk
  FOREIGN KEY (cust_id) REFERENCES customers (cust_id)
  DISABLE NOVALIDATE;

--
-- PRODUCTS
--

ALTER TABLE products
  ADD CONSTRAINT products_pk
  PRIMARY KEY (prod_id)
  DISABLE NOVALIDATE;

ALTER TABLE sales
  ADD CONSTRAINT sales_product_fk
  FOREIGN KEY (prod_id) REFERENCES products (prod_id)
  DISABLE NOVALIDATE;

ALTER TABLE costs
  ADD CONSTRAINT costs_product_fk
  FOREIGN KEY (prod_id) REFERENCES products (prod_id)
  DISABLE NOVALIDATE;

--
-- TIMES
--

ALTER TABLE times
  ADD CONSTRAINT times_pk
  PRIMARY KEY (time_id)
  DISABLE NOVALIDATE;

ALTER TABLE sales
  ADD CONSTRAINT sales_time_fk
  FOREIGN KEY (time_id) REFERENCES times (time_id)
  DISABLE NOVALIDATE;

ALTER TABLE costs
  ADD CONSTRAINT costs_time_fk
  FOREIGN KEY (time_id) REFERENCES times (time_id)
  DISABLE NOVALIDATE;

--
-- CHANNELS
--

ALTER TABLE channels
  ADD CONSTRAINT channels_pk
  PRIMARY KEY (channel_id)
  DISABLE NOVALIDATE;

ALTER TABLE sales
  ADD CONSTRAINT sales_channel_fk
  FOREIGN KEY (channel_id) REFERENCES channels (channel_id)
  DISABLE NOVALIDATE;

ALTER TABLE costs
  ADD CONSTRAINT costs_channel_fk
  FOREIGN KEY (channel_id) REFERENCES channels (channel_id)
  DISABLE NOVALIDATE;

--
-- COUNTRIES
--

ALTER TABLE countries
  ADD CONSTRAINT countries_pk
  PRIMARY KEY (country_id)
  DISABLE NOVALIDATE;

ALTER TABLE customers
  ADD CONSTRAINT customers_country_fk
  FOREIGN KEY (country_id) REFERENCES countries (country_id)
  DISABLE NOVALIDATE;

--
-- SUPPLEMENTARY DEMOGRAPHICS
--

ALTER TABLE supplementary_demographics
  ADD CONSTRAINT supp_demo_pk
  PRIMARY KEY (cust_id)
  DISABLE NOVALIDATE;
