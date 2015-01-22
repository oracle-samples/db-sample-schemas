REM
REM $Header: sh_cre.sql 29-aug-2002.11:56:35 hyeh Exp $
REM
REM sh_cre.sql
REM
REM Copyright (c) 2001, 2015, Oracle Corporation.  All rights reserved.  
REM 
REM Permission is hereby granted, free of charge, to any person obtaining
REM a copy of this software and associated documentation files (the
REM "Software"), to deal in the Software without restriction, including
REM without limitation the rights to use, copy, modify, merge, publish,
REM distribute, sublicense, and/or sell copies of the Software, and to
REM permit persons to whom the Software is furnished to do so, subject to
REM the following conditions:
REM 
REM The above copyright notice and this permission notice shall be
REM included in all copies or substantial portions of the Software.
REM 
REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
REM EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
REM MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
REM NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
REM LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
REM OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
REM WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
REM
REM    NAME
REM      sh_cre.sql - Create database objects
REM
REM    DESCRIPTION
REM      SH is the Sales History schema of the Oracle 9i Sample
REM	   Schemas
REM
REM    NOTES
REM      Prerequisite: Enterprise Edition with Partitioning Option
REM      installed
REM
REM    MODIFIED   (MM/DD/YY)
REM      hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
REM      ahunold   09/04/01 - .
REM      ahunold   08/16/01 - added partitions
REM      hbaer     01/29/01 - Created
REM

REM TABLE TIMES attribute definitions and examples
REM since most of the attributes are CHARACTER values, a correct time based
REM order CANNOT be guaranteed for all of them. The ones were this is guaranteed
REM are marked accordingly
REM for correct time based ordering the VARCHAR2() attributes have to be converted
REM with the appropriate TO_DATE() function
REM     time_id                     /* day date, finest granularity, CORRECT ORDER */
REM     day_name                    /* Monday to Sunday, repeating */
REM     day_number_in_week          /* 1 to 7, repeating */
REM     day_number_in_month         /* 1 to 31, repeating */
REM     calendar_week_number        /* 1 to 53, repeating */
REM     fiscal_week_number          /* 1 to 53, repeating */
REM     week_ending_day             /* date of last day in week, CORRECT ORDER */
REM     calendar_month_number       /* 1 to 12, repeating */
REM     fiscal_month_number         /* 1 to 12, repeating */
REM     calendar_month_desc         /* e.g. 1998-01, CORRECT ORDER */
REM     fiscal_month_desc           /* e.g. 1998-01, CORRECT ORDER */
REM     calendar_month_name         /* January to December, repeating */
REM     fiscal_month_name           /* January to December, repeating */
REM     calendar_quarter_desc       /* e.g. 1998-Q1, CORRECT ORDER */
REM     fiscal_quarter_desc         /* e.g. 1999-Q3, CORRECT ORDER */
REM     calendar_quarter_number     /* 1 to 4, repeating */
REM     fiscal_quarter_number       /* 1 to 4, repeating */
REM     calendar_year               /* e.g. 1999, CORRECT ORDER */
REM     fiscal_year                 /* e.g. 1999, CORRECT ORDER */
REM     days_in_cal_month           /* e.g. 28,31, repeating */
REM     days_in_fis_month           /* e.g. 25,32, repeating */
REM     days_in_cal_quarter         /* e.g. 88,90, repeating */
REM     days_in_fis_quarter         /* e.g. 88,90, repeating */
REM     days_in_cal_year            /* 365,366 repeating */
REM     days_in_fis_year            /* e.g. 355,364, repeating */
REM     end_of_cal_month            /* last day of cal month */
REM     end_of_fis_month            /* last day of fiscal month */
REM     end_of_cal_quarte           /* last day of cal quarter */
REM     end_of_fis_quarter          /* last day of fiscal quarter */
REM     end_of_cal_year             /* last day of cal year */
REM     end_of_fis_year             /* last day of fiscal year */

REM creation of dimension table TIMES ...
CREATE TABLE times
    ( 
      time_id                 DATE
    , day_name                VARCHAR2(9)  
        CONSTRAINT 	      tim_day_name_nn           NOT NULL
    , day_number_in_week      NUMBER(1)    
        CONSTRAINT 	      tim_day_in_week_nn        NOT NULL
    , day_number_in_month     NUMBER(2)
        CONSTRAINT 	      tim_day_in_month_nn       NOT NULL
    , calendar_week_number    NUMBER(2)
        CONSTRAINT 	      tim_cal_week_nn           NOT NULL
    , fiscal_week_number      NUMBER(2)
        CONSTRAINT 	      tim_fis_week_nn           NOT NULL
    , week_ending_day         DATE     
        CONSTRAINT 	      tim_week_ending_day_nn    NOT NULL
    , calendar_month_number   NUMBER(2)
        CONSTRAINT 	      tim_cal_month_number_nn   NOT NULL
    , fiscal_month_number     NUMBER(2)
        CONSTRAINT 	      tim_fis_month_number_nn   NOT NULL
    , calendar_month_desc     VARCHAR2(8)
        CONSTRAINT 	      tim_cal_month_desc_nn     NOT NULL
    , fiscal_month_desc       VARCHAR2(8)
        CONSTRAINT 	      tim_fis_month_desc_nn     NOT NULL
    , days_in_cal_month       NUMBER
        CONSTRAINT 	      tim_days_cal_month_nn     NOT NULL
    , days_in_fis_month       NUMBER
        CONSTRAINT	      tim_days_fis_month_nn     NOT NULL
    , end_of_cal_month	      DATE
        CONSTRAINT	      tim_end_of_cal_month_nn   NOT NULL
    , end_of_fis_month	      DATE
        CONSTRAINT	      tim_end_of_fis_month_nn   NOT NULL
    , calendar_month_name     VARCHAR2(9)
        CONSTRAINT 	      tim_cal_month_name_nn     NOT NULL
    , fiscal_month_name       VARCHAR2(9)
        CONSTRAINT 	      tim_fis_month_name_nn     NOT NULL
    , calendar_quarter_desc   CHAR(7)   
        CONSTRAINT 	      tim_cal_quarter_desc_nn   NOT NULL
    , fiscal_quarter_desc     CHAR(7)    
        CONSTRAINT            tim_fis_quarter_desc_nn   NOT NULL
    , days_in_cal_quarter     NUMBER
        CONSTRAINT            tim_days_cal_quarter_nn   NOT NULL
    , days_in_fis_quarter     NUMBER
        CONSTRAINT            tim_days_fis_quarter_nn   NOT NULL
    , end_of_cal_quarter      DATE
        CONSTRAINT	      tim_end_of_cal_quarter_nn NOT NULL
    , end_of_fis_quarter      DATE
        CONSTRAINT	      tim_end_of_fis_quarter_nn NOT NULL
    , calendar_quarter_number NUMBER(1)  
        CONSTRAINT            tim_cal_quarter_number_nn NOT NULL
    , fiscal_quarter_number   NUMBER(1)  
        CONSTRAINT            tim_fis_quarter_number_nn NOT NULL
    , calendar_year           NUMBER(4)  
        CONSTRAINT            tim_cal_year_nn           NOT NULL
    , fiscal_year             NUMBER(4)  
        CONSTRAINT            tim_fis_year_nn           NOT NULL
    , days_in_cal_year        NUMBER
        CONSTRAINT            tim_days_cal_year_nn      NOT NULL
    , days_in_fis_year        NUMBER
        CONSTRAINT            tim_days_fis_year_nn      NOT NULL
    , end_of_cal_year         DATE
        CONSTRAINT	      tim_end_of_cal_year_nn    NOT NULL
    , end_of_fis_year         DATE
        CONSTRAINT	      tim_end_of_fis_year_nn    NOT NULL
    )
PCTFREE 5;

CREATE UNIQUE INDEX time_pk
ON times (time_id) ;

ALTER TABLE times
ADD ( CONSTRAINT time_pk
      PRIMARY KEY (time_id) RELY ENABLE VALIDATE
    ) ;

REM creation of dimension table CHANNELS ...
CREATE TABLE channels
    ( channel_id       CHAR(1)
    , channel_desc     VARCHAR2(20)
        CONSTRAINT     chan_desc_nn NOT NULL
    , channel_class    VARCHAR2(20) 
    ) 
PCTFREE 5;

CREATE UNIQUE INDEX chan_pk
ON channels (channel_id) ;

ALTER TABLE channels
ADD ( CONSTRAINT chan_pk
      PRIMARY KEY (channel_id) RELY ENABLE VALIDATE
    ) ;

REM creation of dimension table PROMOTIONS ...
CREATE TABLE promotions
    ( promo_id           NUMBER(6)
    , promo_name         VARCHAR2(20)
        CONSTRAINT 	 promo_name_nn       NOT NULL
    , promo_subcategory  VARCHAR2(30)
        CONSTRAINT 	 promo_subcat_nn     NOT NULL
    , promo_category     VARCHAR2(30)
        CONSTRAINT 	 promo_cat_nn        NOT NULL
    , promo_cost         NUMBER(10,2)
        CONSTRAINT 	 promo_cost_nn       NOT NULL
    , promo_begin_date   DATE
        CONSTRAINT 	 promo_begin_date_nn NOT NULL
    , promo_end_date     DATE
        CONSTRAINT 	 promo_end_date_nn   NOT NULL
    ) 
PCTFREE 5;


CREATE UNIQUE INDEX promo_pk
ON promotions (promo_id) ;

ALTER TABLE promotions
ADD ( CONSTRAINT promo_pk
      PRIMARY KEY (promo_id) RELY ENABLE VALIDATE
    ) ;

REM creation of dimension table COUNTRIES ...
CREATE TABLE countries 
    ( country_id        CHAR(2) 
    , country_name      VARCHAR2(40) 
        CONSTRAINT      country_country_name_nn NOT NULL 
    , country_subregion VARCHAR2(30) 
    , country_region    VARCHAR2(20) 
    )
PCTFREE 5; 

ALTER TABLE countries
ADD ( CONSTRAINT country_pk
      PRIMARY KEY (country_id) RELY ENABLE VALIDATE
    ) ;

REM creation of dimension table CUSTOMERS ...
CREATE TABLE customers
    ( cust_id                NUMBER       
    , cust_first_name        VARCHAR2(20) 
        CONSTRAINT           customer_fname_nn NOT NULL
    , cust_last_name         VARCHAR2(40) 
        CONSTRAINT           customer_lname_nn NOT NULL
    , cust_gender	     CHAR(1)
    , cust_year_of_birth     NUMBER(4)
    , cust_marital_status    VARCHAR2(20)
    , cust_street_address    VARCHAR2(40) 
        CONSTRAINT           customer_st_addr_nn NOT NULL
    , cust_postal_code       VARCHAR2(10) 
        CONSTRAINT           customer_pcode_nn NOT NULL
    , cust_city              VARCHAR2(30) 
        CONSTRAINT           customer_city_nn NOT NULL
    , cust_state_province    VARCHAR2(40)
    , country_id             CHAR(2) 
        CONSTRAINT           customer_country_id_nn NOT NULL
    , cust_main_phone_number VARCHAR2(25)
    , cust_income_level      VARCHAR2(30)
    , cust_credit_limit      NUMBER
    , cust_email             VARCHAR2(30)
    ) 
PCTFREE 5;

CREATE UNIQUE INDEX customers_pk
   ON customers (cust_id) ;

ALTER TABLE customers 
ADD ( CONSTRAINT customers_pk
      PRIMARY KEY (cust_id) RELY ENABLE VALIDATE
    ) ;

ALTER TABLE customers
ADD ( CONSTRAINT customers_country_fk
      FOREIGN KEY (country_id) REFERENCES countries(country_id)
      RELY ENABLE VALIDATE);

REM creation of dimension table PRODUCTS ...
CREATE TABLE products
    ( prod_id              NUMBER(6)      
    , prod_name            VARCHAR2(50)   
	CONSTRAINT 	   products_prod_name_nn NOT NULL
    , prod_desc            VARCHAR2(4000) 
	CONSTRAINT 	   products_prod_desc_nn NOT NULL
    , prod_subcategory     VARCHAR2(50)  
	CONSTRAINT	   products_prod_subcat_nn NOT NULL
    , prod_subcat_desc     VARCHAR2(2000)  
	CONSTRAINT	   products_prod_subcatd_nn NOT NULL
    , prod_category        VARCHAR2(50)  
	CONSTRAINT	   products_prod_cat_nn NOT NULL
    , prod_cat_desc        VARCHAR2(2000)  
	CONSTRAINT	   products_prod_catd_nn NOT NULL
    , prod_weight_class    NUMBER(2)
    , prod_unit_of_measure VARCHAR2(20)
    , prod_pack_size       VARCHAR2(30)
    , supplier_id          NUMBER(6)
    , prod_status          VARCHAR2(20)
	CONSTRAINT	   products_prod_stat_nn NOT NULL
    , prod_list_price      NUMBER(8,2) 
	CONSTRAINT	   products_prod_list_price_nn NOT NULL
    , prod_min_price       NUMBER(8,2) 
	CONSTRAINT	   products_prod_min_price_nn NOT NULL
     ) 
PCTFREE 5;

CREATE UNIQUE INDEX products_pk
   ON products (prod_id) ;

ALTER TABLE products
ADD ( CONSTRAINT products_pk
      PRIMARY KEY (prod_id) RELY ENABLE VALIDATE
    ) ;

REM creation of fact table SALES ...

CREATE TABLE sales
    ( prod_id        NUMBER(6)
        CONSTRAINT   sales_product_nn     NOT NULL
    , cust_id        NUMBER
        CONSTRAINT   sales_customer_nn    NOT NULL
    , time_id        DATE
        CONSTRAINT   sales_time_nn        NOT NULL
    , channel_id     CHAR(1)
        CONSTRAINT   sales_channel_nn     NOT NULL
    , promo_id       NUMBER(6)
        CONSTRAINT   sales_promo_nn       NOT NULL
    , quantity_sold  NUMBER(3)
        CONSTRAINT   sales_quantity_nn    NOT NULL
    , amount_sold         NUMBER(10,2)
        CONSTRAINT   sales_amount_nn      NOT NULL
    )	PCTFREE 5 NOLOGGING
        PARTITION BY RANGE (time_id)
        (PARTITION SALES_1995 VALUES LESS THAN 
		(TO_DATE('01-JAN-1996','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION SALES_1996 VALUES LESS THAN 
		(TO_DATE('01-JAN-1997','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION SALES_H1_1997 VALUES LESS THAN 
		(TO_DATE('01-JUL-1997','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION SALES_H2_1997 VALUES LESS THAN 
		(TO_DATE('01-JAN-1998','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION SALES_Q1_1998 VALUES LESS THAN 
		(TO_DATE('01-APR-1998','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q2_1998 VALUES LESS THAN 
		(TO_DATE('01-JUL-1998','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q3_1998 VALUES LESS THAN 
		(TO_DATE('01-OCT-1998','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q4_1998 VALUES LESS THAN 
		(TO_DATE('01-JAN-1999','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q1_1999 VALUES LESS THAN 
		(TO_DATE('01-APR-1999','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q2_1999 VALUES LESS THAN 
		(TO_DATE('01-JUL-1999','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q3_1999 VALUES LESS THAN 
		(TO_DATE('01-OCT-1999','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q4_1999 VALUES LESS THAN 
		(TO_DATE('01-JAN-2000','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q1_2000 VALUES LESS THAN 
		(TO_DATE('01-APR-2000','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q2_2000 VALUES LESS THAN 
		(TO_DATE('01-JUL-2000','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q3_2000 VALUES LESS THAN 
		(TO_DATE('01-OCT-2000','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
         PARTITION SALES_Q4_2000 VALUES LESS THAN 
		(TO_DATE('01-JAN-2001','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')))
;

REM creation of second fact table COSTS ...

CREATE TABLE costs
    ( prod_id        NUMBER(6)
        CONSTRAINT   costs_product_nn     NOT NULL
    , time_id        DATE
        CONSTRAINT   costs_time_nn        NOT NULL
    , unit_cost      NUMBER(10,2)
        CONSTRAINT   costs_unit_cost_nn    NOT NULL
    , unit_price     NUMBER(10,2)
        CONSTRAINT   costs_unit_price_nn      NOT NULL
    )	PCTFREE 5 NOLOGGING
	PARTITION BY RANGE (time_id)
	(PARTITION COSTS_Q1_1998 VALUES LESS THAN 
		(TO_DATE('01-APR-1998','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q2_1998 VALUES LESS THAN 
		(TO_DATE('01-JUL-1998','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q3_1998 VALUES LESS THAN 
		(TO_DATE('01-OCT-1998','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q4_1998 VALUES LESS THAN 
		(TO_DATE('01-JAN-1999','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q1_1999 VALUES LESS THAN 
		(TO_DATE('01-APR-1999','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q2_1999 VALUES LESS THAN 
		(TO_DATE('01-JUL-1999','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q3_1999 VALUES LESS THAN 
		(TO_DATE('01-OCT-1999','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q4_1999 VALUES LESS THAN 
		(TO_DATE('01-JAN-2000','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q1_2000 VALUES LESS THAN 
		(TO_DATE('01-APR-2000','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q2_2000 VALUES LESS THAN 
		(TO_DATE('01-JUL-2000','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q3_2000 VALUES LESS THAN 
		(TO_DATE('01-OCT-2000','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')),
	 PARTITION COSTS_Q4_2000 VALUES LESS THAN 
		(TO_DATE('01-JAN-2001','DD-MON-YYYY','NLS_DATE_LANGUAGE = American')))
;

REM establish foreign keys to ALL dimension tables

ALTER TABLE sales
ADD ( CONSTRAINT sales_product_fk
      FOREIGN KEY (prod_id) 
      REFERENCES products RELY ENABLE VALIDATE
    , CONSTRAINT sales_customer_fk 
      FOREIGN KEY (cust_id)
      REFERENCES customers RELY ENABLE VALIDATE 
    , CONSTRAINT sales_time_fk
      FOREIGN KEY (time_id)
      REFERENCES times RELY ENABLE VALIDATE
    , CONSTRAINT sales_channel_fk
      FOREIGN KEY (channel_id)
      REFERENCES channels RELY ENABLE VALIDATE
    , CONSTRAINT sales_promo_fk
      FOREIGN KEY (promo_id)
      REFERENCES promotions RELY ENABLE VALIDATE
    ) ;

ALTER TABLE costs
ADD ( CONSTRAINT costs_product_fk
      FOREIGN KEY (prod_id) 
      REFERENCES products RELY ENABLE VALIDATE
    , CONSTRAINT costs_time_fk
      FOREIGN KEY (time_id)
      REFERENCES times RELY ENABLE VALIDATE
    ) ;

COMMIT;


