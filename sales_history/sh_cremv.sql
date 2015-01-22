Rem
Rem $Header: sh_cremv.sql 29-aug-2002.11:56:37 hyeh Exp $
Rem
Rem sh_cremv.sql
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
Rem      sh_cremv.sql - Create materialized views
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
Rem    ahunold    03/05/01 - no DROPs needed, part of creation script


Rem first materialized view; simple aggregate join MV
Rem equivalent to example 1 in MV chapter DWG, page 8-11

CREATE MATERIALIZED VIEW cal_month_sales_mv
PCTFREE 5
BUILD IMMEDIATE
REFRESH FORCE
ENABLE QUERY REWRITE
AS
SELECT   t.calendar_month_desc
,        sum(s.amount_sold) AS dollars
FROM     sales s
,        times t
WHERE    s.time_id = t.time_id
GROUP BY t.calendar_month_desc;


Rem more complex mv with additional key columns to join to other dimensions;

CREATE MATERIALIZED VIEW fweek_pscat_sales_mv
PCTFREE 5
BUILD IMMEDIATE
REFRESH COMPLETE
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

CREATE BITMAP INDEX FW_PSC_S_MV_SUBCAT_BIX	
ON fweek_pscat_sales_mv(prod_subcategory);

CREATE BITMAP INDEX FW_PSC_S_MV_CHAN_BIX
ON fweek_pscat_sales_mv(channel_id);

CREATE BITMAP INDEX FW_PSC_S_MV_PROMO_BIX	
ON fweek_pscat_sales_mv(promo_id);

CREATE BITMAP INDEX FW_PSC_S_MV_WD_BIX
ON fweek_pscat_sales_mv(week_ending_day);
