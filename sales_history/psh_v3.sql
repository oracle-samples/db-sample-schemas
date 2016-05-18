Rem
Rem $Header: rdbms/demo/schema/sales_history/psh_v3.sql /main/12 2012/06/21 14:38:37 awesley Exp $
Rem
Rem vsh_v3.sql
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
Rem      vsh_v3.sql - Post load actions for SH schema
Rem
Rem    DESCRIPTION
Rem      <short description of component this file declares/defines>
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    awesley     03/03/12 - Remove  Creating OLAP metadata olp_v3.sql
Rem    pabingha    03/08/07 - LRG 2871657 - use dimension_exceptions
Rem    huzhao      02/03/04 - gather statistics for sh.SALES_TRANSACTIONS_EXT 
Rem    huzhao      11/11/03 - fix lrg 1592368 
Rem    ahunold     07/21/03 - shreview
Rem    cbauwens    07/16/03 - add index ODM table
Rem                           supplementary demographics
Rem    ahunold     04/11/03 - bug 2896054, added olp_v3.sql
Rem    ahunold     01/22/03 - country_iso_code
Rem    ahunold     01/20/03 - NONOVALIDATE
Rem    ahunold     01/17/03 - bug 2487961
rem    ahunold     10/25/02 - display rows from mview$_exceptions
Rem    ahunold     09/16/02 - constraint validation
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     08/20/02 - constraints moved to csh_v3.sql
Rem    ahunold     07/31/02 - Created
Rem

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100

PROMPT
PROMPT Enabling constraints ...

--
-- PROMOTIONS
--

ALTER TABLE promotions
  ENABLE NOVALIDATE CONSTRAINT promo_pk;

ALTER TABLE sales
  ENABLE NOVALIDATE CONSTRAINT sales_promo_fk;

--
-- CUSTOMERS
--

ALTER TABLE customers
  ENABLE NOVALIDATE CONSTRAINT customers_pk;

ALTER TABLE sales
  ENABLE NOVALIDATE CONSTRAINT sales_customer_fk;

--
-- PRODUCTS
--

ALTER TABLE products
  ENABLE NOVALIDATE CONSTRAINT products_pk;

ALTER TABLE sales
  ENABLE NOVALIDATE CONSTRAINT sales_product_fk;

ALTER TABLE costs
  ENABLE NOVALIDATE CONSTRAINT costs_product_fk;

--
-- TIMES
--

ALTER TABLE times
  ENABLE NOVALIDATE CONSTRAINT times_pk;

ALTER TABLE sales
  ENABLE NOVALIDATE CONSTRAINT sales_time_fk;

ALTER TABLE costs
  ENABLE NOVALIDATE CONSTRAINT costs_time_fk;

--
-- CHANNELS
--

ALTER TABLE channels
  ENABLE NOVALIDATE CONSTRAINT channels_pk;

ALTER TABLE sales
  ENABLE NOVALIDATE CONSTRAINT sales_channel_fk;

--
-- COUNTRIES
--

ALTER TABLE countries
  ENABLE NOVALIDATE CONSTRAINT countries_pk;

ALTER TABLE customers
  ENABLE NOVALIDATE CONSTRAINT customers_country_fk;
  
PROMPT
PROMPT Creating additional indexes ...

CREATE BITMAP INDEX sales_prod_bix
       ON sales (prod_id)
       LOCAL NOLOGGING COMPUTE STATISTICS ;

CREATE BITMAP INDEX sales_cust_bix
       ON sales (cust_id)
       LOCAL NOLOGGING COMPUTE STATISTICS ;

CREATE BITMAP INDEX sales_time_bix
       ON sales (time_id)
       LOCAL NOLOGGING COMPUTE STATISTICS ;

CREATE BITMAP INDEX sales_channel_bix
       ON sales (channel_id)
       LOCAL NOLOGGING COMPUTE STATISTICS ;

CREATE BITMAP INDEX sales_promo_bix
       ON sales (promo_id)
       LOCAL NOLOGGING COMPUTE STATISTICS ;

CREATE INDEX sup_text_idx ON supplementary_demographics(comments)
   INDEXTYPE IS ctxsys.context PARAMETERS('nopopulate');


REM some indexes on fact table COSTS

CREATE BITMAP INDEX costs_prod_bix
       ON costs (prod_id)
       LOCAL NOLOGGING COMPUTE STATISTICS ;

CREATE BITMAP INDEX costs_time_bix
       ON costs (time_id)
       LOCAL NOLOGGING COMPUTE STATISTICS ;

REM some indexes on dimension tables

CREATE BITMAP INDEX products_prod_status_bix
	ON products(prod_status)
        NOLOGGING COMPUTE STATISTICS ;

CREATE INDEX products_prod_subcat_ix
	ON products(prod_subcategory)
        NOLOGGING COMPUTE STATISTICS ;

CREATE INDEX products_prod_cat_ix
	ON products(prod_category)
        NOLOGGING COMPUTE STATISTICS ;

CREATE BITMAP INDEX customers_gender_bix
	ON customers(cust_gender)
        NOLOGGING COMPUTE STATISTICS ;

CREATE BITMAP INDEX customers_marital_bix
	ON customers(cust_marital_status)
        NOLOGGING COMPUTE STATISTICS ;

CREATE BITMAP INDEX customers_yob_bix
	ON customers(cust_year_of_birth)
        NOLOGGING COMPUTE STATISTICS ;

--
-- Dimensions
--

PROMPT
PROMPT Create dimensions ...

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

PROMPT Creating MVs as tables ...
PROMPT

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
 FROM 
	costs c, sales s
 WHERE c.prod_id = s.prod_id
   AND c.time_id = s.time_id
   AND c.channel_id = s.channel_id
   AND c.promo_id = s.promo_id;

CREATE TABLE cal_month_sales_mv
AS
  SELECT   t.calendar_month_desc
  ,        sum(s.amount_sold) AS dollars
  FROM     sales s
  ,        times t
  WHERE    s.time_id = t.time_id
  GROUP BY t.calendar_month_desc;

CREATE TABLE fweek_pscat_sales_mv
AS
  SELECT   t.week_ending_day
  ,        p.prod_subcategory
  ,        sum(s.amount_sold) AS dollars
  ,        s.channel_id
  ,        s.promo_id
  FROM     sales s
  ,        times t
  ,        products p
  WHERE    s.time_id = t.time_id
  AND      s.prod_id = p.prod_id
  GROUP BY t.week_ending_day
  ,        p.prod_subcategory
  ,        s.channel_id
  ,        s.promo_id;

CREATE BITMAP INDEX FW_PSC_S_MV_SUBCAT_BIX	
ON fweek_pscat_sales_mv(prod_subcategory);

CREATE BITMAP INDEX FW_PSC_S_MV_CHAN_BIX
ON fweek_pscat_sales_mv(channel_id);

CREATE BITMAP INDEX FW_PSC_S_MV_PROMO_BIX	
ON fweek_pscat_sales_mv(promo_id);

CREATE BITMAP INDEX FW_PSC_S_MV_WD_BIX
ON fweek_pscat_sales_mv(week_ending_day);

--
-- The following MVs will be deleted and recreated to allow
-- the tablespace to be transported (see mkunplug.sql)
--

PROMPT Creating materialized views ...
PROMPT

CREATE MATERIALIZED VIEW cal_month_sales_mv
  ON PREBUILT TABLE
  ENABLE QUERY REWRITE
  AS
  SELECT   t.calendar_month_desc
  ,        sum(s.amount_sold) AS dollars
  FROM     sales s
  ,        times t
  WHERE    s.time_id = t.time_id
  GROUP BY t.calendar_month_desc;

CREATE MATERIALIZED VIEW fweek_pscat_sales_mv 
  ON PREBUILT TABLE
  ENABLE QUERY REWRITE
  AS
  SELECT   t.week_ending_day
  ,        p.prod_subcategory
  ,        sum(s.amount_sold) AS dollars
  ,        s.channel_id
  ,        s.promo_id
  FROM     sales s
  ,        times t
  ,        products p
  WHERE    s.time_id = t.time_id
  AND      s.prod_id = p.prod_id
  GROUP BY t.week_ending_day
  ,        p.prod_subcategory
  ,        s.channel_id
  ,        s.promo_id;

PROMPT
PROMPT Creating comments ...

COMMENT ON TABLE times
IS 'Time dimension table to support multiple hierarchies and materialized views';

COMMENT ON COLUMN times.time_id
IS 'primary key; day date, finest granularity, CORRECT ORDER';

COMMENT ON COLUMN times.day_name
IS 'Monday to Sunday, repeating';

COMMENT ON COLUMN times.day_number_in_week
IS '1 to 7, repeating';

COMMENT ON COLUMN times.day_number_in_month
IS '1 to 31, repeating';

COMMENT ON COLUMN times.calendar_week_number
IS '1 to 53, repeating';

COMMENT ON COLUMN times.fiscal_week_number
IS '1 to 53, repeating';

COMMENT ON COLUMN times.week_ending_day
IS 'date of last day in week, CORRECT ORDER';

COMMENT ON COLUMN times.calendar_month_number
IS '1 to 12, repeating';

COMMENT ON COLUMN times.fiscal_month_number
IS '1 to 12, repeating';

COMMENT ON COLUMN times.calendar_month_desc
IS 'e.g. 1998-01, CORRECT ORDER';

COMMENT ON COLUMN times.fiscal_month_desc
IS 'e.g. 1998-01, CORRECT ORDER';

COMMENT ON COLUMN times.calendar_month_name
IS 'January to December, repeating';

COMMENT ON COLUMN times.fiscal_month_name
IS 'January to December, repeating';

COMMENT ON COLUMN times.calendar_quarter_desc
IS 'e.g. 1998-Q1, CORRECT ORDER';

COMMENT ON COLUMN times.fiscal_quarter_desc
IS 'e.g. 1999-Q3, CORRECT ORDER';

COMMENT ON COLUMN times.calendar_quarter_number
IS '1 to 4, repeating';

COMMENT ON COLUMN times.fiscal_quarter_number
IS '1 to 4, repeating';

COMMENT ON COLUMN times.calendar_year
IS 'e.g. 1999, CORRECT ORDER';

COMMENT ON COLUMN times.fiscal_year
IS 'e.g. 1999, CORRECT ORDER';

COMMENT ON COLUMN times.days_in_cal_month
IS 'e.g. 28,31, repeating';

COMMENT ON COLUMN times.days_in_fis_month
IS 'e.g. 25,32, repeating';

COMMENT ON COLUMN times.days_in_cal_quarter
IS 'e.g. 88,90, repeating';

COMMENT ON COLUMN times.days_in_fis_quarter
IS 'e.g. 88,90, repeating';

COMMENT ON COLUMN times.days_in_cal_year
IS '365,366 repeating';

COMMENT ON COLUMN times.days_in_fis_year
IS 'e.g. 355,364, repeating';

COMMENT ON COLUMN times.end_of_cal_month
IS 'last day of calendar month';

COMMENT ON COLUMN times.end_of_fis_month
IS 'last day of fiscal month';

COMMENT ON COLUMN times.end_of_cal_quarter
IS 'last day of calendar quarter';

COMMENT ON COLUMN times.end_of_fis_quarter
IS 'last day of fiscal quarter';

COMMENT ON COLUMN times.end_of_cal_year
IS 'last day of cal year';

COMMENT ON COLUMN times.end_of_fis_year
IS 'last day of fiscal year';

rem =============================================

COMMENT ON TABLE channels
IS 'small dimension table';

COMMENT ON COLUMN channels.channel_id
IS 'primary key column';

COMMENT ON COLUMN channels.channel_desc
IS 'e.g. telesales, internet, catalog';

COMMENT ON COLUMN channels.channel_class
IS 'e.g. direct, indirect';

rem =============================================

COMMENT ON TABLE promotions
IS 'dimension table without a PK-FK relationship with the facts table, to show outer join functionality';

COMMENT ON COLUMN promotions.promo_id
IS 'primary key column';

COMMENT ON COLUMN promotions.promo_name
IS 'promotion description';

COMMENT ON COLUMN promotions.promo_subcategory
IS 'enables to investigate promotion hierarchies';

COMMENT ON COLUMN promotions.promo_category
IS 'promotion category';

COMMENT ON COLUMN promotions.promo_cost
IS 'promotion cost, to do promotion effect calculations';

COMMENT ON COLUMN promotions.promo_begin_date
IS 'promotion begin day';

COMMENT ON COLUMN promotions.promo_end_date
IS 'promotion end day';

rem =============================================

COMMENT ON TABLE countries
IS 'country dimension table (snowflake)';

COMMENT ON COLUMN countries.country_id
IS 'primary key';

COMMENT ON COLUMN countries.country_name
IS 'country name';

COMMENT ON COLUMN countries.country_subregion
IS 'e.g. Western Europe, to allow hierarchies';

COMMENT ON COLUMN countries.country_region
IS 'e.g. Europe, Asia';

rem =============================================

COMMENT ON TABLE products
IS 'dimension table';

COMMENT ON COLUMN products.prod_id
IS 'primary key';

COMMENT ON COLUMN products.prod_name
IS 'product name';

COMMENT ON COLUMN products.prod_desc
IS 'product description';

COMMENT ON COLUMN products.prod_subcategory
IS 'product subcategory';

COMMENT ON COLUMN products.prod_subcategory_desc
IS 'product subcategory description';

COMMENT ON COLUMN products.prod_category
IS 'product category';

COMMENT ON COLUMN products.prod_category_desc
IS 'product category description';

COMMENT ON COLUMN products.prod_weight_class
IS 'product weight class';

COMMENT ON COLUMN products.prod_unit_of_measure
IS 'product unit of measure';

COMMENT ON COLUMN products.prod_pack_size
IS 'product package size';

COMMENT ON COLUMN products.supplier_id
IS 'this column';

COMMENT ON COLUMN products.prod_status
IS 'product status';

COMMENT ON COLUMN products.prod_list_price
IS 'product list price';

COMMENT ON COLUMN products.prod_min_price
IS 'product minimum price';

rem =============================================

COMMENT ON TABLE customers
IS 'dimension table';

COMMENT ON COLUMN customers.cust_id
IS 'primary key';

COMMENT ON COLUMN customers.cust_first_name
IS 'first name of the customer';

COMMENT ON COLUMN customers.cust_last_name
IS 'last name of the customer';

COMMENT ON COLUMN customers.cust_gender
IS 'gender; low cardinality attribute';

COMMENT ON COLUMN customers.cust_year_of_birth
IS 'customer year of birth';

COMMENT ON COLUMN customers.cust_marital_status
IS 'customer marital status; low cardinality attribute';

COMMENT ON COLUMN customers.cust_street_address
IS 'customer street address';

COMMENT ON COLUMN customers.cust_postal_code
IS 'postal code of the customer';

COMMENT ON COLUMN customers.cust_city
IS 'city where the customer lives';

COMMENT ON COLUMN customers.cust_state_province
IS 'customer geography: state or province';

COMMENT ON COLUMN customers.cust_main_phone_number
IS 'customer main phone number';

COMMENT ON COLUMN customers.cust_income_level
IS 'customer income level';

COMMENT ON COLUMN customers.cust_credit_limit
IS 'customer credit limit';

COMMENT ON COLUMN customers.cust_email
IS 'customer email id';

COMMENT ON COLUMN customers.country_id
IS 'foreign key to the countries table (snowflake)';

rem =============================================

COMMENT ON TABLE sales
IS 'facts table, without a primary key; all rows are uniquely identified by the combination of all foreign keys';

COMMENT ON COLUMN sales.prod_id
IS 'FK to the products dimension table';

COMMENT ON COLUMN sales.cust_id
IS 'FK to the customers dimension table';

COMMENT ON COLUMN sales.time_id
IS 'FK to the times dimension table';

COMMENT ON COLUMN sales.channel_id
IS 'FK to the channels dimension table';

COMMENT ON COLUMN sales.promo_id
IS 'promotion identifier, without FK constraint (intentionally) to show outer join optimization';

COMMENT ON COLUMN sales.quantity_sold
IS 'product quantity sold with the transaction';

COMMENT ON COLUMN sales.amount_sold
IS 'invoiced amount to the customer';

PROMPT
PROMPT gathering statistics ...

EXECUTE dbms_stats.gather_table_stats( -
        ownname          => 'SH'                     , -
        tabname          => 'SALES_TRANSACTIONS_EXT' , -
        partname         => NULL                     , -
        estimate_percent => NULL                     , -
        block_sample     => TRUE                     , -
        method_opt       => 'FOR ALL COLUMNS SIZE 1' , -
        degree           => NULL                     , -
        granularity      => 'ALL'                    , -
        cascade          => TRUE                     , -
        stattab          => NULL                     , -
        statid           => NULL                     , -
        statown          => NULL                     );

EXECUTE dbms_stats.gather_schema_stats(	-
	'SH'				,	-
	granularity => 'ALL'		,	-
	cascade => TRUE			,	-
	block_sample => TRUE		,	-
	estimate_percent => null        );


