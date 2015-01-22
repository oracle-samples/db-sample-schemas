Rem
Rem $Header: sh_olp_d.sql 29-aug-2002.11:56:57 hyeh Exp $
Rem
Rem sh_olp_d.sql
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
Rem      sh_olp_d.sql - Drop columns used by OLAP Server 
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
Rem    ahunold    03/16/02 - fweek_pscat_sales_mv COMPILE
Rem    ahunold    09/17/01 - sh_analz.sql
Rem    ahunold    04/23/01 - duplicate lines
Rem    ahunold    04/05/01 - dimension names
Rem    ahunold    03/05/01 - external table, no DROPs
Rem    ahunold    02/07/01 - CMWLite
Rem    ahunold    02/01/01 - Merged ahunold_two_facts
Rem    hbaer      01/29/01 - Created
Rem

ALTER TABLE products
	DROP COLUMN prod_total;

ALTER TABLE customers
	DROP COLUMN cust_total;

ALTER TABLE promotions
	DROP COLUMN promo_total;

ALTER TABLE channels
	DROP COLUMN channel_total;

ALTER TABLE countries
	DROP COLUMN country_total;

COMMIT;

REM redefinition of original dimensions

DROP DIMENSION times_dim;

DROP DIMENSION customers_dim;

DROP DIMENSION products_dim;

DROP DIMENSION promotions_dim;

DROP DIMENSION channels_dim;

@@sh_hiera
ALTER MATERIALIZED VIEW fweek_pscat_sales_mv COMPILE;
@@sh_analz

