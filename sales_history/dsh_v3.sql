Rem
Rem $Header: dsh_v3.sql 16-jan-2003.20:11:04 ahunold Exp $
Rem
Rem sh_drop.sql
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
Rem      sh_drop.sql - Drop database objects
Rem
Rem    DESCRIPTION
Rem      SH is the Sales History schema of the Oracle 9i Sample
Rem	   Schemas
Rem
Rem    NOTES
Rem      
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem     ahunold    01/16/03 - bug 2487961 reopened
Rem     hyeh       08/29/02 - hyeh_mv_comschema_to_rdbms
Rem     ahunold    05/29/02 - directory objects owned by sys
Rem     ahunold    04/09/02 - dropping directory
Rem     ahunold    02/01/02 - bug2206757
Rem     hbaer      01/29/01 - Created
Rem

REM drop all tables of schema

DROP TABLE sales      CASCADE CONSTRAINTS ;
DROP TABLE costs      CASCADE CONSTRAINTS ;
DROP TABLE times      CASCADE CONSTRAINTS ;
DROP TABLE channels   CASCADE CONSTRAINTS ;
DROP TABLE promotions CASCADE CONSTRAINTS ;
DROP TABLE customers  CASCADE CONSTRAINTS ;
DROP TABLE countries  CASCADE CONSTRAINTS ;
DROP TABLE products   CASCADE CONSTRAINTS ;

DROP TABLE mv_capabilities_table  CASCADE CONSTRAINTS ;
DROP TABLE plan_table             CASCADE CONSTRAINTS ;
DROP TABLE rewrite_table          CASCADE CONSTRAINTS ;
DROP TABLE sales_transactions_ext CASCADE CONSTRAINTS ;

REM drop all dimensions

DROP DIMENSION customers_dim;
DROP DIMENSION times_dim;
DROP DIMENSION products_dim;
DROP DIMENSION promotions_dim;
DROP DIMENSION channels_dim;

REM drop materialized views

DROP MATERIALIZED VIEW cal_month_sales_mv;
DROP MATERIALIZED VIEW fweek_pscat_sales_mv;

COMMIT;

