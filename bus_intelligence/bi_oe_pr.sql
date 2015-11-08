Rem $Header: bi_oe_pr.sql 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem Copyright (c) 2002, 2015 Oracle Corporation.  All rights reserved.  
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
Rem      bi_oe_pr.sql - Object privileges for user BI
Rem
Rem    DESCRIPTION
Rem      tbd
Rem
Rem    MODIFIED     (MM/DD/YY)
Rem      smtaylor    03/19/15 - added parameter 2, connect string
Rem      smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem      ahunold     09/18/02 - ahunold_sep17_02
Rem      ahunold     09/17/02 - created
Rem

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100

PROMPT
PROMPT specify password for oe as parameter 1:
DEFINE oe_pass             = &1
PROMPT
PROMPT specify connect string as parameter 2:
DEFINE connect_string     = &2
PROMPT

CONNECT oe/&oe_pass@&connect_string;

GRANT SELECT ON BOMBAY_INVENTORY TO bi;
GRANT SELECT ON CUSTOMERS TO bi;
GRANT SELECT ON INVENTORIES TO bi;
GRANT SELECT ON ORDERS TO bi;
GRANT SELECT ON ORDER_ITEMS TO bi;
GRANT SELECT ON PRODUCTS TO bi;
GRANT SELECT ON PRODUCT_DESCRIPTIONS TO bi;
GRANT SELECT ON PRODUCT_INFORMATION TO bi;
GRANT SELECT ON PRODUCT_PRICES TO bi;
GRANT SELECT ON PROMOTIONS TO bi;
GRANT SELECT ON SYDNEY_INVENTORY TO bi;
GRANT SELECT ON TORONTO_INVENTORY TO bi;
GRANT SELECT ON WAREHOUSES TO bi;

COMMIT;
