rem
rem Copyright (c) 2023 Oracle
rem
rem Permission is hereby granted, free of charge, to any person obtaining a
rem copy of this software and associated documentation files (the "Software"),
rem to deal in the Software without restriction, including without limitation
rem the rights to use, copy, modify, merge, publish, distribute, sublicense,
rem and/or sell copies of the Software, and to permit persons to whom the
rem Software is furnished to do so, subject to the following conditions:
rem
rem The above copyright notice and this permission notice shall be included in
rem all copies or substantial portions rem of the Software.
rem
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
rem THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
rem FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
rem DEALINGS IN THE SOFTWARE.
rem
rem NAME
rem   sh_create.sql - Creates schema objects for SH (Sales History) schema
rem
rem DESCRIPTON
rem   This script creates tables, associated constraints,
rem      indexes, and comments in the SH schema.
rem
rem SCHEMA VERSION
rem   21
rem
rem RELEASE DATE
rem   06-DEC-2022
rem
rem SUPPORTED with DB VERSIONS
rem   19c and higher
rem
rem MAJOR CHANGES IN THIS RELEASE
rem   New install routines.
rem
rem SCHEMA DEPENDENCIES AND REQUIREMENTS
rem   This script is called from the sh_install.sql script
rem
rem INSTALL INSTRUCTIONS
rem    Run the sh_install.sql script to call this script
rem
rem --------------------------------------------------------------------------

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET ECHO OFF

rem ********************************************************************************
rem Create the COUNTRIES table to hold information about the country a sale occurred

Prompt ******  Creating COUNTRIES table ....

CREATE TABLE countries
(
   country_id             NUMBER         NOT NULL,
   country_iso_code       CHAR(2)        NOT NULL,
   country_name           VARCHAR2(40)   NOT NULL,
   country_subregion      VARCHAR2(30)   NOT NULL,
   country_subregion_id   NUMBER         NOT NULL,
   country_region         VARCHAR2(20)   NOT NULL,
   country_region_id      NUMBER         NOT NULL,
   country_total          VARCHAR2(11)   NOT NULL,
   country_total_id       NUMBER         NOT NULL,
   CONSTRAINT countries_pk
      PRIMARY KEY (country_id)
);

rem ********************************************************************
rem Create the CUSTOMERS table to hold customer information

Prompt ******  Creating CUSTOMERS table ....

CREATE TABLE customers
(
   cust_id                  NUMBER         NOT NULL,
   cust_first_name          VARCHAR2(20)   NOT NULL,
   cust_last_name           VARCHAR2(40)   NOT NULL,
   cust_gender              CHAR(1)        NOT NULL,
   cust_year_of_birth       NUMBER(4)      NOT NULL,
   cust_marital_status      VARCHAR2(20),
   cust_street_address      VARCHAR2(40)   NOT NULL,
   cust_postal_code         VARCHAR2(10)   NOT NULL,
   cust_city                VARCHAR2(30)   NOT NULL,
   cust_city_id             NUMBER         NOT NULL,
   cust_state_province      VARCHAR2(40)   NOT NULL,
   cust_state_province_id   NUMBER         NOT NULL,
   country_id               NUMBER         NOT NULL,
   cust_main_phone_number   VARCHAR2(25)   NOT NULL,
   cust_income_level        VARCHAR2(30),
   cust_credit_limit        NUMBER,
   cust_email               VARCHAR2(50),
   cust_total               VARCHAR2(14)   NOT NULL,
   cust_total_id            NUMBER         NOT NULL,
   cust_src_id              NUMBER,
   cust_eff_from            DATE,
   cust_eff_to              DATE,
   cust_valid               VARCHAR2(1),
   CONSTRAINT customers_pk
      PRIMARY KEY (cust_id),
   CONSTRAINT customers_country_fk
      FOREIGN KEY (country_id) REFERENCES countries (country_id)
);

rem ********************************************************************
rem Create the PROMOTIONS table to hold information about sale promotion

Prompt ******  Creating PROMOTIONS table ....

CREATE TABLE promotions
(
   promo_id               NUMBER(6)      NOT NULL,
   promo_name             VARCHAR2(30)   NOT NULL,
   promo_subcategory      VARCHAR2(30)   NOT NULL,
   promo_subcategory_id   NUMBER         NOT NULL,
   promo_category         VARCHAR2(30)   NOT NULL,
   promo_category_id      NUMBER         NOT NULL,
   promo_cost             NUMBER(10,2)   NOT NULL,
   promo_begin_date       DATE           NOT NULL,
   promo_end_date         DATE           NOT NULL,
   promo_total            VARCHAR2(15)   NOT NULL,
   promo_total_id         NUMBER         NOT NULL,
   CONSTRAINT promo_pk
      PRIMARY KEY (promo_id)
);

rem ********************************************************************
rem Create the PRODUCTS table to hold the product information

Prompt ******  Creating PRODUCTS table ....

CREATE TABLE products
(
   prod_id                 NUMBER(6)        NOT NULL,
   prod_name               VARCHAR2(50)     NOT NULL,
   prod_desc               VARCHAR2(4000)   NOT NULL,
   prod_subcategory        VARCHAR2(50)     NOT NULL,
   prod_subcategory_id     NUMBER           NOT NULL,
   prod_subcategory_desc   VARCHAR2(2000)   NOT NULL,
   prod_category           VARCHAR2(50)     NOT NULL,
   prod_category_id        NUMBER           NOT NULL,
   prod_category_desc      VARCHAR2(2000)   NOT NULL,
   prod_weight_class       NUMBER(3)        NOT NULL,
   prod_unit_of_measure    VARCHAR2(20),
   prod_pack_size          VARCHAR2(30)     NOT NULL,
   supplier_id             NUMBER(6)        NOT NULL,
   prod_status             VARCHAR2(20)     NOT NULL,
   prod_list_price         NUMBER(8,2)      NOT NULL,
   prod_min_price          NUMBER(8,2)      NOT NULL,
   prod_total              VARCHAR2(13)     NOT NULL,
   prod_total_id           NUMBER           NOT NULL,
   prod_src_id             NUMBER,
   prod_eff_from           DATE,
   prod_eff_to             DATE,
   prod_valid              VARCHAR2(1),
   CONSTRAINT products_pk
      PRIMARY KEY (prod_id)
);

rem ********************************************************************
rem Create the TIMES table to hold the time information for a sale

Prompt ******  Creating TIMES table ....

CREATE TABLE times
(
   time_id                   DATE          NOT NULL,
   day_name                  VARCHAR2(9)   NOT NULL,
   day_number_in_week        NUMBER(1)     NOT NULL,
   day_number_in_month       NUMBER(2)     NOT NULL,
   calendar_week_number      NUMBER(2)     NOT NULL,
   fiscal_week_number        NUMBER(2)     NOT NULL,
   week_ending_day           DATE          NOT NULL,
   week_ending_day_id        NUMBER        NOT NULL,
   calendar_month_number     NUMBER(2)     NOT NULL,
   fiscal_month_number       NUMBER(2)     NOT NULL,
   calendar_month_desc       VARCHAR2(8)   NOT NULL,
   calendar_month_id         NUMBER        NOT NULL,
   fiscal_month_desc         VARCHAR2(8)   NOT NULL,
   fiscal_month_id           NUMBER        NOT NULL,
   days_in_cal_month         NUMBER        NOT NULL,
   days_in_fis_month         NUMBER        NOT NULL,
   end_of_cal_month          DATE          NOT NULL,
   end_of_fis_month          DATE          NOT NULL,
   calendar_month_name       VARCHAR2(9)   NOT NULL,
   fiscal_month_name         VARCHAR2(9)   NOT NULL,
   calendar_quarter_desc     CHAR(7)       NOT NULL,
   calendar_quarter_id       NUMBER        NOT NULL,
   fiscal_quarter_desc       CHAR(7)       NOT NULL,
   fiscal_quarter_id         NUMBER        NOT NULL,
   days_in_cal_quarter       NUMBER        NOT NULL,
   days_in_fis_quarter       NUMBER        NOT NULL,
   end_of_cal_quarter        DATE          NOT NULL,
   end_of_fis_quarter        DATE          NOT NULL,
   calendar_quarter_number   NUMBER(1)     NOT NULL,
   fiscal_quarter_number     NUMBER(1)     NOT NULL,
   calendar_year             NUMBER(4)     NOT NULL,
   calendar_year_id          NUMBER        NOT NULL,
   fiscal_year               NUMBER(4)     NOT NULL,
   fiscal_year_id            NUMBER        NOT NULL,
   days_in_cal_year          NUMBER        NOT NULL,
   days_in_fis_year          NUMBER        NOT NULL,
   end_of_cal_year           DATE          NOT NULL,
   end_of_fis_year           DATE          NOT NULL,
   CONSTRAINT times_pk
      PRIMARY KEY (time_id)
);

rem ********************************************************************
rem Create the CHANNELS table to hold information in which channel the sale occurred

Prompt ******  Creating CHANNELS table ....

CREATE TABLE channels
(
   channel_id         NUMBER         NOT NULL,
   channel_desc       VARCHAR2(20)   NOT NULL,
   channel_class      VARCHAR2(20)   NOT NULL,
   channel_class_id   NUMBER         NOT NULL,
   channel_total      VARCHAR2(13)   NOT NULL,
   channel_total_id   NUMBER         NOT NULL,
   CONSTRAINT channels_pk
      PRIMARY KEY (channel_id)
);

rem ********************************************************************
rem Create the SALES table to hold the individual sales information

Prompt ******  Creating SALES table ....

CREATE TABLE sales
(
   prod_id         NUMBER(6)      NOT NULL,
   cust_id         NUMBER         NOT NULL,
   time_id         DATE           NOT NULL,
   channel_id      NUMBER(1)      NOT NULL,
   promo_id        NUMBER(6)      NOT NULL,
   quantity_sold   NUMBER(3)      NOT NULL,
   amount_sold     NUMBER(10,2)   NOT NULL,
   CONSTRAINT sales_promo_fk
      FOREIGN KEY (promo_id)   REFERENCES promotions (promo_id),
   CONSTRAINT sales_customer_fk
      FOREIGN KEY (cust_id)    REFERENCES customers (cust_id),
   CONSTRAINT sales_product_fk
      FOREIGN KEY (prod_id)    REFERENCES products (prod_id),
   CONSTRAINT sales_channel_fk
      FOREIGN KEY (channel_id) REFERENCES channels (channel_id),
   CONSTRAINT sales_time_fk
      FOREIGN KEY (time_id) REFERENCES times (time_id)
)
  --
  -- partitions
  -- 
 PARTITION BY RANGE (time_id)
 (
    PARTITION SALES_2018 VALUES LESS THAN 
       (TO_DATE('2019-01-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_H1_2019 VALUES LESS THAN 
       (TO_DATE('2019-07-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_H2_2019 VALUES LESS THAN 
       (TO_DATE('2020-01-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q1_2020 VALUES LESS THAN 
       (TO_DATE('2020-04-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q2_2020 VALUES LESS THAN 
       (TO_DATE('2020-07-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q3_2020 VALUES LESS THAN 
       (TO_DATE('2020-10-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q4_2020 VALUES LESS THAN 
       (TO_DATE('2021-01-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q1_2021 VALUES LESS THAN 
       (TO_DATE('2021-04-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q2_2021 VALUES LESS THAN 
       (TO_DATE('2021-07-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q3_2021 VALUES LESS THAN 
       (TO_DATE('2021-10-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q4_2021 VALUES LESS THAN 
       (TO_DATE('2022-01-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q1_2022 VALUES LESS THAN 
       (TO_DATE('2022-04-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q2_2022 VALUES LESS THAN 
       (TO_DATE('2022-07-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q3_2022 VALUES LESS THAN 
       (TO_DATE('2022-10-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American')),
    PARTITION SALES_Q4_2022 VALUES LESS THAN 
       (TO_DATE('2023-01-01','YYYY-MM-DD','NLS_DATE_LANGUAGE = American'))
    )
;

rem ********************************************************************
rem Create the COSTS table to hold the cost information for an item

Prompt ******  Creating COSTS table ....

CREATE TABLE costs
(
   prod_id      NUMBER         NOT NULL,
   time_id      DATE           NOT NULL,
   promo_id     NUMBER         NOT NULL,
   channel_id   NUMBER         NOT NULL,
   unit_cost    NUMBER(10,2)   NOT NULL,
   unit_price   NUMBER(10,2)   NOT NULL,
   CONSTRAINT costs_promo_fk
      FOREIGN KEY (promo_id)   REFERENCES promotions (promo_id),
   CONSTRAINT costs_product_fk
      FOREIGN KEY (prod_id)    REFERENCES products (prod_id),
   CONSTRAINT costs_time_fk
      FOREIGN KEY (time_id)    REFERENCES times (time_id),
   CONSTRAINT costs_channel_fk
      FOREIGN KEY (channel_id) REFERENCES channels (channel_id)
)
 --
 -- partitions
 -- 
 PARTITION BY RANGE (time_id)
  (
    PARTITION COSTS_Q1_2019 VALUES LESS THAN
       (TO_DATE('2019-04-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q2_2019 VALUES LESS THAN
       (TO_DATE('2019-07-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q3_2019 VALUES LESS THAN
       (TO_DATE('2019-10-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q4_2019 VALUES LESS THAN
       (TO_DATE('2020-01-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q1_2020 VALUES LESS THAN
       (TO_DATE('2020-04-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q2_2020 VALUES LESS THAN
       (TO_DATE('2020-07-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q3_2020 VALUES LESS THAN
       (TO_DATE('2020-10-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q4_2020 VALUES LESS THAN
       (TO_DATE('2021-01-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q1_2021 VALUES LESS THAN
       (TO_DATE('2021-04-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q2_2021 VALUES LESS THAN
       (TO_DATE('2021-07-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q3_2021 VALUES LESS THAN
       (TO_DATE('2021-10-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q4_2021 VALUES LESS THAN
       (TO_DATE('2022-01-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q1_2022 VALUES LESS THAN
       (TO_DATE('2022-04-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q2_2022 VALUES LESS THAN
       (TO_DATE('2022-07-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q3_2022 VALUES LESS THAN
       (TO_DATE('2022-10-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q4_2022 VALUES LESS THAN
       (TO_DATE('2023-01-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q1_2023 VALUES LESS THAN
       (TO_DATE('2023-04-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q2_2023 VALUES LESS THAN
       (TO_DATE('2023-07-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q3_2023 VALUES LESS THAN
       (TO_DATE('2023-10-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN')) COMPRESS,
    PARTITION COSTS_Q4_2023 VALUES LESS THAN
       (TO_DATE('2024-01-01','YYYY-MM-DD','NLS_CALENDAR=GREGORIAN'))
  )
;

rem ****************************************************************************************
rem Create the SUPPLEMENTAL_DEMOGRAPHICS table to hold supplemental demographics information

Prompt ******  Creating SUPPLEMENTAL_DEMOGRAPHICS table ....

CREATE TABLE supplementary_demographics
(
   cust_id                   NUMBER           NOT NULL,
   education                 VARCHAR2(21),
   occupation                VARCHAR2(21),
   household_size            VARCHAR2(21),
   yrs_residence             NUMBER,
   affinity_card             NUMBER(10),
   bulk_pack_diskettes       NUMBER(10),
   flat_panel_monitor        NUMBER(10),
   home_theater_package      NUMBER(10),
   bookkeeping_application   NUMBER(10),
   printer_supplies          NUMBER(10),
   y_box_games               NUMBER(10),
   os_doc_set_kanji          NUMBER(10),
   comments                  VARCHAR2(4000),
   CONSTRAINT supp_demo_pk
      PRIMARY KEY (cust_id)
);

rem ********************************************************************
rem Create views

Prompt ******  Creating views ....

rem ********************************************************************
rem A view for profits made

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

rem ********************************************************************
rem Create views

Prompt ******  Creating materialized views ....


CREATE MATERIALIZED VIEW cal_month_sales_mv
--  ON PREBUILT TABLE
   ENABLE QUERY REWRITE
   AS
   SELECT   t.calendar_month_desc,
            SUM(s.amount_sold) AS dollars
   FROM     sh.sales s,
            sh.times t
   WHERE    s.time_id = t.time_id
   GROUP BY t.calendar_month_desc;

CREATE MATERIALIZED VIEW fweek_pscat_sales_mv 
--  ON PREBUILT TABLE
   ENABLE QUERY REWRITE
   AS
   SELECT   t.week_ending_day,
            p.prod_subcategory,
            SUM(s.amount_sold) AS dollars,
            s.channel_id,
            s.promo_id
   FROM     sh.sales s,
            sh.times t,
            sh.products p
   WHERE    s.time_id = t.time_id
      AND   s.prod_id = p.prod_id
   GROUP BY t.week_ending_day,
            p.prod_subcategory,
            s.channel_id,
            s.promo_id;

rem ********************************************************************
rem Adding comments

Prompt ******  Adding comments to tables...

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
