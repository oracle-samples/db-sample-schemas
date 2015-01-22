Rem
Rem $Header: sh_comnt.sql 29-aug-2002.11:56:33 hyeh Exp $
Rem
Rem sh_comnt.sql
Rem
Rem Copyright (c) 2001, 2015, Oracle Corporation.  All rights reserved.  
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
Rem      sh_comnt.sql - Populates the countries and channel table 
Rem
Rem    DESCRIPTION
Rem      SH is the Sales History schema of the Oracle 9i Sample
Rem	   Schemas
Rem
Rem    NOTES
Rem      
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    hyeh       08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    hbaer      01/29/01 - Created
Rem

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

COMMENT ON COLUMN products.prod_subcat_desc
IS 'product subcategory description';

COMMENT ON COLUMN products.prod_category
IS 'product category';

COMMENT ON COLUMN products.prod_cat_desc
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
