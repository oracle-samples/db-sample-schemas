Rem
Rem $Header: sh_idx.sql 29-aug-2002.11:56:52 hyeh Exp $
Rem
Rem sh_idx.sql
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
Rem      sh_idx.sql - Create database objects
Rem
Rem    DESCRIPTION
Rem      SH is the Sales History schema of the Oracle 9i Sample
Rem	   Schemas
Rem
Rem    NOTES
Rem      
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem     hyeh       08/29/02 - hyeh_mv_comschema_to_rdbms
Rem     hbaer      01/29/01 - Created
Rem     ahunold    03/05/01 - no DROPs needed, part of creation suite

REM some indexes on fact table SALES

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

COMMIT;
