Rem $Header: bi_views.sql 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem Copyright (c) 2002, 2015, Oracle Corporation.  All rights reserved.  
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
Rem      bi_views.sql - Views and synonyms for schema BI
Rem
Rem    DESCRIPTION
Rem      tbd
Rem
Rem    MODIFIED     (MM/DD/YY)
Rem      smtaylor    03/19/15 - added parameter 2, connect_string
Rem      smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem      ahunold     05/07/03 - no COMPANY_ID
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
PROMPT specify password for BI as parameter 1:
DEFINE bi_pass             = &1
PROMPT
PROMPT specify connect string as parameter 2:
DEFINE connect_string     = &2
PROMPT

CONNECT bi/&bi_pass@&connect_string;

CREATE SYNONYM channels		FOR sh.channels;
CREATE SYNONYM countries	FOR sh.countries;
CREATE SYNONYM times		FOR sh.times;
CREATE SYNONYM costs		FOR sh.costs;
CREATE SYNONYM customers	FOR sh.customers;
CREATE SYNONYM products		FOR sh.products;
CREATE SYNONYM promotions	FOR sh.promotions;
CREATE SYNONYM sales		FOR sh.sales;

COMMIT;
