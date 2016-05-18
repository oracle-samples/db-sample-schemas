Rem
Rem $Header: rdbms/demo/schema/sales_history/sh_olp_c.sql /main/6 2011/12/10 19:37:28 mstasiew Exp $
Rem
Rem sh_olp_c.sql
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
Rem      sh_olp_c.sql - Create columns used by OLAP Server 
Rem
Rem    DESCRIPTION
Rem      SH is the Sales History schema of the Oracle 9i Sample
Rem	   Schemas
Rem
Rem    NOTES
Rem      
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem      mstasiew  10/19/11 - deprecate cwm, undo ramekuma 10/13/11 change.
Rem                           Since cwm portions are removed, turn back on
Rem                           add column optimization
rem      ramekuma  10/13/11 - lrg-5729910: Turn off add column optimization for
rem                           CWM lite
rem      hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem      ahunold   03/16/02 - fweek_pscat_sales_mv COMPILE
rem      ahunold   09/17/01 - sh_analz.sql
rem      ahunold   05/10/01 - Time dimension attributes
rem      pfay      04/10/01 - change case 
Rem      ahunold   04/05/01 - dimension names
Rem      ahunold   03/05/01 - external table, no DROPs
Rem      ahunold   02/07/01 - CMWLite
Rem      ahunold   02/01/01 - Merged ahunold_two_facts
Rem      hbaer     01/29/01 - Created
Rem

ALTER TABLE products
	ADD prod_total VARCHAR2(13)
	DEFAULT 'Product total';

ALTER TABLE customers
	ADD cust_total VARCHAR2(14)
	DEFAULT 'Customer total';

ALTER TABLE promotions
	ADD promo_total VARCHAR2(15)
	DEFAULT 'Promotion total';

ALTER TABLE channels
	ADD channel_total VARCHAR2(13)
	DEFAULT 'Channel total';

ALTER TABLE countries
	ADD country_total VARCHAR2(11)
	DEFAULT 'World total';

COMMIT;

Rem modified dimension definition to include new total column

DROP DIMENSION times_dim;

CREATE DIMENSION times_dim
   LEVEL day         IS TIMES.TIME_ID
   LEVEL month       IS TIMES.CALENDAR_MONTH_DESC
   LEVEL quarter     IS TIMES.CALENDAR_QUARTER_DESC
   LEVEL year        IS TIMES.CALENDAR_YEAR
   LEVEL fis_week    IS TIMES.WEEK_ENDING_DAY
   LEVEL fis_month   IS TIMES.FISCAL_MONTH_DESC
   LEVEL fis_quarter IS TIMES.FISCAL_QUARTER_DESC
   LEVEL fis_year    IS TIMES.FISCAL_YEAR
   HIERARCHY cal_rollup    (
             day     CHILD OF
             month   CHILD OF
             quarter CHILD OF
             year
   )
   HIERARCHY fis_rollup    (
             day         CHILD OF
             fis_week    CHILD OF
             fis_month	 CHILD OF
             fis_quarter CHILD OF
             fis_year
   )
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
         days_in_fis_year, end_of_fis_year)
;

DROP DIMENSION customers_dim;

CREATE DIMENSION customers_dim 
	LEVEL customer	IS (customers.cust_id)
	LEVEL city 	IS (customers.cust_city) 
	LEVEL state 	IS (customers.cust_state_province) 
	LEVEL country 	IS (countries.country_id) 
	LEVEL subregion IS (countries.country_subregion) 
	LEVEL region IS (countries.country_region) 
	LEVEL geog_total IS (countries.country_total) 
	LEVEL cust_total IS (customers.cust_total) 
	HIERARCHY cust_rollup (
		customer	CHILD OF
		city 		CHILD OF 
		state 		CHILD OF 
                cust_total
	)
	HIERARCHY geog_rollup (
		customer	CHILD OF
		city 		CHILD OF 
		state 		CHILD OF 
		country 	CHILD OF 
		subregion 	CHILD OF 		
		region          CHILD OF
                geog_total
	JOIN KEY (customers.country_id) REFERENCES country
	)
	ATTRIBUTE customer DETERMINES
	(cust_first_name, cust_last_name, cust_gender, 
	 cust_marital_status, cust_year_of_birth, 
	 cust_income_level, cust_credit_limit,
         cust_street_address, cust_postal_code,
         cust_main_phone_number, cust_email)
        ATTRIBUTE city DETERMINES (cust_city) 
        ATTRIBUTE state DETERMINES (cust_state_province) 
	ATTRIBUTE country DETERMINES (countries.country_name)
        ATTRIBUTE subregion DETERMINES (countries.country_subregion)
        ATTRIBUTE region DETERMINES (countries.country_region) 
        ATTRIBUTE geog_total DETERMINES (countries.country_total) 
        ATTRIBUTE cust_total DETERMINES (customers.cust_total) 
;

DROP DIMENSION products_dim;

CREATE DIMENSION products_dim 
	LEVEL product 		IS (products.prod_id)
 	LEVEL subcategory 	IS (products.prod_subcategory) 
	LEVEL category		IS (products.prod_category) 
	LEVEL prod_total	IS (products.prod_total) 
	HIERARCHY prod_rollup (
		product		CHILD OF 
		subcategory 	CHILD OF 
		category        CHILD OF
   		prod_total
	) 
	ATTRIBUTE product DETERMINES 
        (products.prod_name, products.prod_desc,
         prod_weight_class, prod_unit_of_measure,
         prod_pack_size,prod_status, prod_list_price, prod_min_price)
	ATTRIBUTE subcategory DETERMINES 
        (prod_subcategory, prod_subcat_desc)
	ATTRIBUTE category DETERMINES 
        (prod_category, prod_cat_desc)
	ATTRIBUTE prod_total DETERMINES 
        (prod_total)
;

DROP DIMENSION promotions_dim;

CREATE DIMENSION promotions_dim 
	LEVEL promo 	  IS (promotions.promo_id) 
	LEVEL subcategory IS (promotions.promo_subcategory) 
	LEVEL category 	  IS (promotions.promo_category) 
	LEVEL promo_total IS (promotions.promo_total) 
	HIERARCHY promo_rollup (
		promo 		CHILD OF 
		subcategory 	CHILD OF 
		category	CHILD OF
		promo_total
	) 
	ATTRIBUTE promo DETERMINES 
        (promo_name, promo_cost,
         promo_begin_date, promo_end_date)
        ATTRIBUTE subcategory DETERMINES (promo_subcategory)
        ATTRIBUTE category DETERMINES (promo_category)
        ATTRIBUTE promo_total DETERMINES (promo_total)
;

DROP DIMENSION channels_dim;

CREATE DIMENSION channels_dim 
	LEVEL channel 	   IS (channels.channel_id) 
	LEVEL channel_class IS (channels.channel_class) 
	LEVEL channel_total IS (channels.channel_total) 
	HIERARCHY channel_rollup (
		channel		CHILD OF 
		channel_class	CHILD OF 
		channel_total
	)
        ATTRIBUTE channel DETERMINES (channel_desc)
        ATTRIBUTE channel_class DETERMINES (channel_class)
        ATTRIBUTE channel_total DETERMINES (channel_total)
;

set serveroutput on size 99999

COMMIT;

-- ------------------- Statistics ---------------------------

ALTER MATERIALIZED VIEW fweek_pscat_sales_mv COMPILE;
@__SUB__CWD__/sales_history/sh_analz.sql



