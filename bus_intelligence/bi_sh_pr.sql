Rem $Header: bi_sh_pr.sql 2015/03/19 10:23:26 smtaylor Exp $
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
Rem      bi_views.sql - Object privileges for user BI
Rem
Rem    DESCRIPTION
Rem      tbd
Rem
Rem    MODIFIED     (MM/DD/YY)
Rem      smtaylor    03/19/15 - added parameter 2, connect_string
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
PROMPT specify password for SH as parameter 1:
DEFINE sh_pass             = &1
PROMPT
PROMPT specify connect string as parameter 2:
DEFINE connect_string     = &2
PROMPT

CONNECT sh/&sh_pass@&connect_string;

GRANT SELECT ON channels		TO bi;
GRANT SELECT ON countries		TO bi;
GRANT SELECT ON times			TO bi;
GRANT SELECT ON costs			TO bi;
GRANT SELECT ON customers		TO bi;
GRANT SELECT ON products		TO bi;
GRANT SELECT ON promotions		TO bi;
GRANT SELECT ON sales			TO bi;
GRANT SELECT ON times			TO bi;
GRANT SELECT ON cal_month_sales_mv	TO bi;
GRANT SELECT ON sh.fweek_pscat_sales_mv	TO bi;

COMMIT;
