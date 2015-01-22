rem
rem Header: loe_v3.sql 09-jan-01
rem
rem Copyright (c) 2001, 2014, Oracle Corporation.  All rights reserved.  
rem 
rem Permission is hereby granted, free of charge, to any person obtaining
rem a copy of this software and associated documentation files (the
rem "Software"), to deal in the Software without restriction, including
rem without limitation the rights to use, copy, modify, merge, publish,
rem distribute, sublicense, and/or sell copies of the Software, and to
rem permit persons to whom the Software is furnished to do so, subject to
rem the following conditions:
rem 
rem The above copyright notice and this permission notice shall be
rem included in all copies or substantial portions of the Software.
rem 
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
rem EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
rem MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
rem NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
rem LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
rem OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
rem WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
rem
rem Owner  : ahunold
rem
rem NAME
rem   loe_v3.sql - load data into OE Common Schema
rem
rem DESCRIPTON
rem   Calls scripts that populate database objects.
rem
rem NOTES
rem
rem MODIFIED   (MM/DD/YY)
rem   cbauwens  01/07/04 - hardcoded dates NLS issue 
rem   ahunold   05/07/03 - back to 9i OE data volume
rem   ahunold   03/12/03 - UPDATE statements for customers
rem   ahunold   03/10/03 - OWB columns, data
rem   ahunold   11/25/02 - non-direct load to avoid disabling of constraints
rem   ahunold   11/26/02 - 200 additional customers in 10i, not 100
rem   ahunold   10/12/02 - feedback off for inserts
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   ahunold   08/15/02 - created 

PROMPT 
PROMPT specify Sample Schema version as parameter 1:
DEFINE vrs     = &1
PROMPT
PROMPT specify location for data and control files as parameter 2:
DEFINE data_file_directory = &2
PROMPT
PROMPT specify location for log files as parameter 3:
DEFINE log_file_directory  = &3
PROMPT 
PROMPT specify password for oe as parameter 4:
DEFINE oe_pass  = &4
PROMPT  
PROMPT Setting FEEDBACK OFF for inserts
PROMPT
SET FEEDBACK OFF

@__SUB__CWD__/order_entry/oe_p_pi

@__SUB__CWD__/order_entry/oe_p_pd

DEFINE vscript = __SUB__CWD__/order_entry/pwhs_&vrs
@&vscript

DEFINE vscript = __SUB__CWD__/order_entry/pcus_&vrs
@&vscript

DEFINE vscript = __SUB__CWD__/order_entry/pord_&vrs
@&vscript

@__SUB__CWD__/order_entry/oe_p_itm

@__SUB__CWD__/order_entry/oe_p_inv

PROMPT Setting FEEDBACK ON
PROMPT

SET FEEDBACK ON

--
-- OWB, BI additions
--

INSERT INTO promotions (promo_id, promo_name)
  VALUES (1, 'everyday low price');

INSERT INTO promotions (promo_id, promo_name)
  VALUES (2, 'blowout sale');

COMMIT;

ALTER TABLE customers
 ADD (date_of_birth      DATE
    , marital_status     VARCHAR2(20)
    , gender             VARCHAR2(1)
    , income_level       VARCHAR2(20));

-- Set NLS settings because of hard coded date values
ALTER SESSION SET NLS_LANGUAGE=AMERICAN;
ALTER SESSION SET NLS_TERRITORY=AMERICA;

SET FEEDBACK OFF

UPDATE customers c
SET
c.date_of_birth    = '20-FEB-72'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 101;

UPDATE customers c
SET
c.date_of_birth    = '02-MAR-53'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 102;

UPDATE customers c
SET
c.date_of_birth    = '22-MAR-83'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 103;

UPDATE customers c
SET
c.date_of_birth    = '31-MAR-72'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 104;

UPDATE customers c
SET
c.date_of_birth    = '21-APR-69'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 105;

UPDATE customers c
SET
c.date_of_birth    = '30-APR-60'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 106;

UPDATE customers c
SET
c.date_of_birth    = '21-MAY-69'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 107;

UPDATE customers c
SET
c.date_of_birth    = '20-JUN-57'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 108;

UPDATE customers c
SET
c.date_of_birth    = '30-JUN-38'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 109;

UPDATE customers c
SET
c.date_of_birth    = '20-JUL-51'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 110;

UPDATE customers c
SET
c.date_of_birth    = '29-JUL-48'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 111;

UPDATE customers c
SET
c.date_of_birth    = '19-AUG-54'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 112;

UPDATE customers c
SET
c.date_of_birth    = '29-AUG-77'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 113;

UPDATE customers c
SET
c.date_of_birth    = '17-SEP-48'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 114;

UPDATE customers c
SET
c.date_of_birth    = '18-OCT-31'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 115;

UPDATE customers c
SET
c.date_of_birth    = '28-OCT-27'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 116;

UPDATE customers c
SET
c.date_of_birth    = '16-NOV-52'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 117;

UPDATE customers c
SET
c.date_of_birth    = '27-NOV-66'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 118;

UPDATE customers c
SET
c.date_of_birth    = '17-DEC-65'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 119;

UPDATE customers c
SET
c.date_of_birth    = '26-DEC-84'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 120;

UPDATE customers c
SET
c.date_of_birth    = '15-JAN-53'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 121;

UPDATE customers c
SET
c.date_of_birth    = '15-FEB-43'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 122;

UPDATE customers c
SET
c.date_of_birth    = '24-FEB-49'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 123;

UPDATE customers c
SET
c.date_of_birth    = '16-MAR-81'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 124;

UPDATE customers c
SET
c.date_of_birth    = '27-MAR-59'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 125;

UPDATE customers c
SET
c.date_of_birth    = '16-APR-46'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 126;

UPDATE customers c
SET
c.date_of_birth    = '26-APR-43'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 127;

UPDATE customers c
SET
c.date_of_birth    = '16-MAY-54'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 128;

UPDATE customers c
SET
c.date_of_birth    = '26-MAY-39'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 129;

UPDATE customers c
SET
c.date_of_birth    = '14-JUN-44'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 130;

UPDATE customers c
SET
c.date_of_birth    = '14-JUL-76'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 131;

UPDATE customers c
SET
c.date_of_birth    = '25-JUL-87'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 132;

UPDATE customers c
SET
c.date_of_birth    = '14-AUG-50'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 133;

UPDATE customers c
SET
c.date_of_birth    = '12-SEP-72'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 134;

UPDATE customers c
SET
c.date_of_birth    = '22-SEP-80'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 135;

UPDATE customers c
SET
c.date_of_birth    = '12-OCT-44'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 136;

UPDATE customers c
SET
c.date_of_birth    = '23-OCT-51'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 137;

UPDATE customers c
SET
c.date_of_birth    = '11-NOV-77'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 138;

UPDATE customers c
SET
c.date_of_birth    = '22-NOV-42'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 139;

UPDATE customers c
SET
c.date_of_birth    = '11-DEC-81'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 140;

UPDATE customers c
SET
c.date_of_birth    = '21-DEC-73'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 141;

UPDATE customers c
SET
c.date_of_birth    = '11-JAN-71'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 142;

UPDATE customers c
SET
c.date_of_birth    = '20-JAN-62'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 143;

UPDATE customers c
SET
c.date_of_birth    = '09-FEB-70'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 144;

UPDATE customers c
SET
c.date_of_birth    = '19-FEB-46'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 145;

UPDATE customers c
SET
c.date_of_birth    = '12-MAR-63'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'L: 300,000 and above'
WHERE c.customer_id = 146;

UPDATE customers c
SET
c.date_of_birth    = '21-MAR-44'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 147;

UPDATE customers c
SET
c.date_of_birth    = '10-APR-50'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 148;

UPDATE customers c
SET
c.date_of_birth    = '20-APR-41'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 149;

UPDATE customers c
SET
c.date_of_birth    = '11-MAY-51'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 150;

UPDATE customers c
SET
c.date_of_birth    = '20-MAY-76'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 151;

UPDATE customers c
SET
c.date_of_birth    = '09-JUN-22'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 152;

UPDATE customers c
SET
c.date_of_birth    = '20-JUN-67'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 153;

UPDATE customers c
SET
c.date_of_birth    = '29-JUN-65'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'L: 300,000 and above'
WHERE c.customer_id = 154;

UPDATE customers c
SET
c.date_of_birth    = '09-JUL-42'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 155;

UPDATE customers c
SET
c.date_of_birth    = '09-AUG-55'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 156;

UPDATE customers c
SET
c.date_of_birth    = '18-AUG-69'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 157;

UPDATE customers c
SET
c.date_of_birth    = '07-SEP-70'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 158;

UPDATE customers c
SET
c.date_of_birth    = '07-OCT-53'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 159;

UPDATE customers c
SET
c.date_of_birth    = '06-NOV-50'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 160;

UPDATE customers c
SET
c.date_of_birth    = '16-NOV-42'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 161;

UPDATE customers c
SET
c.date_of_birth    = '07-DEC-75'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 162;

UPDATE customers c
SET
c.date_of_birth    = '16-DEC-62'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 163;

UPDATE customers c
SET
c.date_of_birth    = '05-JAN-54'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 164;

UPDATE customers c
SET
c.date_of_birth    = '05-FEB-56'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 165;

UPDATE customers c
SET
c.date_of_birth    = '14-FEB-50'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 166;

UPDATE customers c
SET
c.date_of_birth    = '06-MAR-48'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 167;

UPDATE customers c
SET
c.date_of_birth    = '16-MAR-50'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 168;

UPDATE customers c
SET
c.date_of_birth    = '05-APR-81'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 169;

UPDATE customers c
SET
c.date_of_birth    = '15-APR-88'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 170;

UPDATE customers c
SET
c.date_of_birth    = '05-MAY-53'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 171;

UPDATE customers c
SET
c.date_of_birth    = '15-MAY-59'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 172;

UPDATE customers c
SET
c.date_of_birth    = '04-JUN-73'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 173;

UPDATE customers c
SET
c.date_of_birth    = '14-JUN-88'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 174;

UPDATE customers c
SET
c.date_of_birth    = '04-JUL-46'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 175;

UPDATE customers c
SET
c.date_of_birth    = '14-JUL-47'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 176;

UPDATE customers c
SET
c.date_of_birth    = '03-AUG-78'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 177;

UPDATE customers c
SET
c.date_of_birth    = '02-SEP-86'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 178;

UPDATE customers c
SET
c.date_of_birth    = '12-SEP-74'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 179;

UPDATE customers c
SET
c.date_of_birth    = '02-OCT-75'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 180;

UPDATE customers c
SET
c.date_of_birth    = '12-OCT-65'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 181;

UPDATE customers c
SET
c.date_of_birth    = '22-OCT-75'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 182;

UPDATE customers c
SET
c.date_of_birth    = '01-NOV-68'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 183;

UPDATE customers c
SET
c.date_of_birth    = '11-NOV-27'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 184;

UPDATE customers c
SET
c.date_of_birth    = '01-DEC-59'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 185;

UPDATE customers c
SET
c.date_of_birth    = '11-DEC-61'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 186;

UPDATE customers c
SET
c.date_of_birth    = '31-DEC-48'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 187;

UPDATE customers c
SET
c.date_of_birth    = '10-JAN-49'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 188;

UPDATE customers c
SET
c.date_of_birth    = '30-JAN-55'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 189;

UPDATE customers c
SET
c.date_of_birth    = '09-FEB-82'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 190;

UPDATE customers c
SET
c.date_of_birth    = '29-FEB-24'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 191;

UPDATE customers c
SET
c.date_of_birth    = '30-MAR-56'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 192;

UPDATE customers c
SET
c.date_of_birth    = '30-APR-55'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 193;

UPDATE customers c
SET
c.date_of_birth    = '30-MAY-71'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 194;

UPDATE customers c
SET
c.date_of_birth    = '09-JUN-86'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 195;

UPDATE customers c
SET
c.date_of_birth    = '29-JUN-53'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 196;

UPDATE customers c
SET
c.date_of_birth    = '08-JUL-84'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 197;

UPDATE customers c
SET
c.date_of_birth    = '29-JUL-49'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 198;

UPDATE customers c
SET
c.date_of_birth    = '07-AUG-52'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 199;

UPDATE customers c
SET
c.date_of_birth    = '28-AUG-78'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 200;

UPDATE customers c
SET
c.date_of_birth    = '27-SEP-43'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 201;

UPDATE customers c
SET
c.date_of_birth    = '27-OCT-39'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 202;

UPDATE customers c
SET
c.date_of_birth    = '05-NOV-48'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 203;

UPDATE customers c
SET
c.date_of_birth    = '26-NOV-61'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 204;

UPDATE customers c
SET
c.date_of_birth    = '06-DEC-55'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'L: 300,000 and above'
WHERE c.customer_id = 205;

UPDATE customers c
SET
c.date_of_birth    = '26-DEC-83'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 206;

UPDATE customers c
SET
c.date_of_birth    = '04-JAN-89'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 207;

UPDATE customers c
SET
c.date_of_birth    = '25-JAN-56'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 208;

UPDATE customers c
SET
c.date_of_birth    = '04-FEB-46'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 209;

UPDATE customers c
SET
c.date_of_birth    = '24-FEB-74'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 210;

UPDATE customers c
SET
c.date_of_birth    = '06-MAR-83'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 211;

UPDATE customers c
SET
c.date_of_birth    = '25-MAR-72'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'L: 300,000 and above'
WHERE c.customer_id = 212;

UPDATE customers c
SET
c.date_of_birth    = '24-APR-76'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 213;

UPDATE customers c
SET
c.date_of_birth    = '05-MAY-46'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 214;

UPDATE customers c
SET
c.date_of_birth    = '24-MAY-85'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 215;

UPDATE customers c
SET
c.date_of_birth    = '04-JUN-79'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 216;

UPDATE customers c
SET
c.date_of_birth    = '23-JUN-73'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 217;

UPDATE customers c
SET
c.date_of_birth    = '04-JUL-66'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 218;

UPDATE customers c
SET
c.date_of_birth    = '13-JUL-77'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 219;

UPDATE customers c
SET
c.date_of_birth    = '23-JUL-76'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 220;

UPDATE customers c
SET
c.date_of_birth    = '02-AUG-53'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 221;

UPDATE customers c
SET
c.date_of_birth    = '23-AUG-63'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 222;

UPDATE customers c
SET
c.date_of_birth    = '02-SEP-35'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 223;

UPDATE customers c
SET
c.date_of_birth    = '22-SEP-59'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 224;

UPDATE customers c
SET
c.date_of_birth    = '02-OCT-59'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 225;

UPDATE customers c
SET
c.date_of_birth    = '21-OCT-56'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 226;

UPDATE customers c
SET
c.date_of_birth    = '01-NOV-83'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 227;

UPDATE customers c
SET
c.date_of_birth    = '20-NOV-41'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 228;

UPDATE customers c
SET
c.date_of_birth    = '30-NOV-65'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 229;

UPDATE customers c
SET
c.date_of_birth    = '20-DEC-48'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 230;

UPDATE customers c
SET
c.date_of_birth    = '31-DEC-47'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 231;

UPDATE customers c
SET
c.date_of_birth    = '20-JAN-60'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 232;

UPDATE customers c
SET
c.date_of_birth    = '29-JAN-70'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 233;

UPDATE customers c
SET
c.date_of_birth    = '18-FEB-73'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 234;

UPDATE customers c
SET
c.date_of_birth    = '21-MAR-55'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 235;

UPDATE customers c
SET
c.date_of_birth    = '30-MAR-86'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 236;

UPDATE customers c
SET
c.date_of_birth    = '19-APR-48'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 237;

UPDATE customers c
SET
c.date_of_birth    = '19-MAY-81'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 238;

UPDATE customers c
SET
c.date_of_birth    = '29-MAY-66'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 239;

UPDATE customers c
SET
c.date_of_birth    = '19-JUN-55'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 240;

UPDATE customers c
SET
c.date_of_birth    = '28-JUN-52'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 241;

UPDATE customers c
SET
c.date_of_birth    = '18-JUL-62'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 242;

UPDATE customers c
SET
c.date_of_birth    = '18-AUG-55'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 243;

UPDATE customers c
SET
c.date_of_birth    = '27-AUG-52'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 244;

UPDATE customers c
SET
c.date_of_birth    = '07-SEP-67'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 245;

UPDATE customers c
SET
c.date_of_birth    = '16-SEP-84'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 246;

UPDATE customers c
SET
c.date_of_birth    = '16-OCT-54'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 247;

UPDATE customers c
SET
c.date_of_birth    = '26-OCT-53'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 248;

UPDATE customers c
SET
c.date_of_birth    = '16-NOV-75'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 249;

UPDATE customers c
SET
c.date_of_birth    = '25-NOV-84'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 250;

UPDATE customers c
SET
c.date_of_birth    = '15-DEC-45'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 251;

UPDATE customers c
SET
c.date_of_birth    = '25-DEC-57'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 252;

UPDATE customers c
SET
c.date_of_birth    = '14-JAN-85'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 253;

UPDATE customers c
SET
c.date_of_birth    = '25-JAN-40'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 254;

UPDATE customers c
SET
c.date_of_birth    = '13-FEB-85'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 255;

UPDATE customers c
SET
c.date_of_birth    = '24-FEB-80'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 256;

UPDATE customers c
SET
c.date_of_birth    = '15-MAR-75'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 257;

UPDATE customers c
SET
c.date_of_birth    = '14-APR-77'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 258;

UPDATE customers c
SET
c.date_of_birth    = '24-APR-43'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 259;

UPDATE customers c
SET
c.date_of_birth    = '14-MAY-62'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 260;

UPDATE customers c
SET
c.date_of_birth    = '13-JUN-61'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 261;

UPDATE customers c
SET
c.date_of_birth    = '13-JUL-58'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 262;

UPDATE customers c
SET
c.date_of_birth    = '23-JUL-79'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 263;

UPDATE customers c
SET
c.date_of_birth    = '12-AUG-47'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 264;

UPDATE customers c
SET
c.date_of_birth    = '22-AUG-73'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 265;

UPDATE customers c
SET
c.date_of_birth    = '01-SEP-70'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'L: 300,000 and above'
WHERE c.customer_id = 266;

UPDATE customers c
SET
c.date_of_birth    = '11-SEP-53'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 267;

UPDATE customers c
SET
c.date_of_birth    = '21-SEP-52'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 268;

UPDATE customers c
SET
c.date_of_birth    = '11-OCT-58'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 269;

UPDATE customers c
SET
c.date_of_birth    = '10-NOV-71'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 270;

UPDATE customers c
SET
c.date_of_birth    = '20-NOV-87'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 271;

UPDATE customers c
SET
c.date_of_birth    = '10-DEC-60'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 272;

UPDATE customers c
SET
c.date_of_birth    = '09-JAN-54'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 273;

UPDATE customers c
SET
c.date_of_birth    = '19-JAN-46'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 274;

UPDATE customers c
SET
c.date_of_birth    = '08-FEB-84'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 275;

UPDATE customers c
SET
c.date_of_birth    = '10-MAR-51'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 276;

UPDATE customers c
SET
c.date_of_birth    = '20-MAR-50'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 277;

UPDATE customers c
SET
c.date_of_birth    = '08-APR-64'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 278;

UPDATE customers c
SET
c.date_of_birth    = '19-APR-61'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 279;

UPDATE customers c
SET
c.date_of_birth    = '09-MAY-49'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 280;

UPDATE customers c
SET
c.date_of_birth    = '18-MAY-56'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 281;

UPDATE customers c
SET
c.date_of_birth    = '07-JUN-88'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 282;

UPDATE customers c
SET
c.date_of_birth    = '18-JUN-94'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 283;

UPDATE customers c
SET
c.date_of_birth    = '08-JUL-57'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 308;

UPDATE customers c
SET
c.date_of_birth    = '18-JUL-55'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 309;

UPDATE customers c
SET
c.date_of_birth    = '06-AUG-80'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 323;

UPDATE customers c
SET
c.date_of_birth    = '06-SEP-59'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 326;

UPDATE customers c
SET
c.date_of_birth    = '15-SEP-56'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 327;

UPDATE customers c
SET
c.date_of_birth    = '06-OCT-85'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 328;

UPDATE customers c
SET
c.date_of_birth    = '16-OCT-53'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 333;

UPDATE customers c
SET
c.date_of_birth    = '15-NOV-81'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 334;

UPDATE customers c
SET
c.date_of_birth    = '05-DEC-82'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 335;

UPDATE customers c
SET
c.date_of_birth    = '03-JAN-73'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 337;

UPDATE customers c
SET
c.date_of_birth    = '13-JAN-33'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 339;

UPDATE customers c
SET
c.date_of_birth    = '03-FEB-63'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 341;

UPDATE customers c
SET
c.date_of_birth    = '13-FEB-47'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 342;

UPDATE customers c
SET
c.date_of_birth    = '04-MAR-60'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 343;

UPDATE customers c
SET
c.date_of_birth    = '14-MAR-60'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 344;

UPDATE customers c
SET
c.date_of_birth    = '04-APR-62'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 345;

UPDATE customers c
SET
c.date_of_birth    = '13-APR-88'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 346;

UPDATE customers c
SET
c.date_of_birth    = '03-MAY-29'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 347;

UPDATE customers c
SET
c.date_of_birth    = '14-MAY-71'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 348;

UPDATE customers c
SET
c.date_of_birth    = '03-JUN-67'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 349;

UPDATE customers c
SET
c.date_of_birth    = '13-JUN-51'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 350;

UPDATE customers c
SET
c.date_of_birth    = '03-JUL-62'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 351;

UPDATE customers c
SET
c.date_of_birth    = '13-JUL-71'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 352;

UPDATE customers c
SET
c.date_of_birth    = '01-AUG-77'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 360;

UPDATE customers c
SET
c.date_of_birth    = '11-AUG-89'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 361;

UPDATE customers c
SET
c.date_of_birth    = '31-AUG-56'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 363;

UPDATE customers c
SET
c.date_of_birth    = '30-SEP-53'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 378;

UPDATE customers c
SET
c.date_of_birth    = '10-OCT-61'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 380;

UPDATE customers c
SET
c.date_of_birth    = '30-OCT-81'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 447;

UPDATE customers c
SET
c.date_of_birth    = '30-NOV-54'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 448;

UPDATE customers c
SET
c.date_of_birth    = '10-DEC-51'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 449;

UPDATE customers c
SET
c.date_of_birth    = '01-JAN-41'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 450;

UPDATE customers c
SET
c.date_of_birth    = '11-JAN-50'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 451;

UPDATE customers c
SET
c.date_of_birth    = '31-JAN-49'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 452;

UPDATE customers c
SET
c.date_of_birth    = '10-FEB-45'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 453;

UPDATE customers c
SET
c.date_of_birth    = '02-MAR-77'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 454;

UPDATE customers c
SET
c.date_of_birth    = '12-MAR-86'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 458;

UPDATE customers c
SET
c.date_of_birth    = '01-APR-49'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 463;

UPDATE customers c
SET
c.date_of_birth    = '11-APR-47'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 466;

UPDATE customers c
SET
c.date_of_birth    = '01-MAY-71'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 467;

UPDATE customers c
SET
c.date_of_birth    = '11-MAY-83'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 468;

UPDATE customers c
SET
c.date_of_birth    = '31-MAY-67'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'L: 300,000 and above'
WHERE c.customer_id = 470;

UPDATE customers c
SET
c.date_of_birth    = '10-JUN-49'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 473;

UPDATE customers c
SET
c.date_of_birth    = '29-JUN-76'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 474;

UPDATE customers c
SET
c.date_of_birth    = '10-JUL-33'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 475;

UPDATE customers c
SET
c.date_of_birth    = '30-JUL-79'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 476;

UPDATE customers c
SET
c.date_of_birth    = '09-AUG-70'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 477;

UPDATE customers c
SET
c.date_of_birth    = '29-AUG-67'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 478;

UPDATE customers c
SET
c.date_of_birth    = '08-SEP-63'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 479;

UPDATE customers c
SET
c.date_of_birth    = '18-SEP-73'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'L: 300,000 and above'
WHERE c.customer_id = 480;

UPDATE customers c
SET
c.date_of_birth    = '28-SEP-67'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 481;

UPDATE customers c
SET
c.date_of_birth    = '28-OCT-55'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 482;

UPDATE customers c
SET
c.date_of_birth    = '07-NOV-42'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 483;

UPDATE customers c
SET
c.date_of_birth    = '26-NOV-60'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 487;

UPDATE customers c
SET
c.date_of_birth    = '26-DEC-52'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 488;

UPDATE customers c
SET
c.date_of_birth    = '06-JAN-80'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 492;

UPDATE customers c
SET
c.date_of_birth    = '25-JAN-45'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 496;

UPDATE customers c
SET
c.date_of_birth    = '05-FEB-59'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 605;

UPDATE customers c
SET
c.date_of_birth    = '25-FEB-38'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 606;

UPDATE customers c
SET
c.date_of_birth    = '06-MAR-49'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 607;

UPDATE customers c
SET
c.date_of_birth    = '26-MAR-57'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 609;

UPDATE customers c
SET
c.date_of_birth    = '25-APR-69'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 615;

UPDATE customers c
SET
c.date_of_birth    = '05-MAY-84'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 621;

UPDATE customers c
SET
c.date_of_birth    = '25-MAY-49'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 627;

UPDATE customers c
SET
c.date_of_birth    = '05-JUN-83'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 712;

UPDATE customers c
SET
c.date_of_birth    = '24-JUN-48'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 713;

UPDATE customers c
SET
c.date_of_birth    = '05-JUL-51'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 715;

UPDATE customers c
SET
c.date_of_birth    = '25-JUL-74'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 717;

UPDATE customers c
SET
c.date_of_birth    = '04-AUG-62'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 719;

UPDATE customers c
SET
c.date_of_birth    = '23-AUG-44'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 721;

UPDATE customers c
SET
c.date_of_birth    = '02-SEP-49'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 727;

UPDATE customers c
SET
c.date_of_birth    = '23-SEP-42'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 729;

UPDATE customers c
SET
c.date_of_birth    = '02-OCT-33'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 731;

UPDATE customers c
SET
c.date_of_birth    = '22-OCT-48'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 754;

UPDATE customers c
SET
c.date_of_birth    = '21-NOV-81'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 755;

UPDATE customers c
SET
c.date_of_birth    = '02-DEC-86'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 756;

UPDATE customers c
SET
c.date_of_birth    = '21-DEC-53'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 757;

UPDATE customers c
SET
c.date_of_birth    = '01-JAN-55'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 766;

UPDATE customers c
SET
c.date_of_birth    = '20-JAN-70'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 767;

UPDATE customers c
SET
c.date_of_birth    = '31-JAN-80'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 768;

UPDATE customers c
SET
c.date_of_birth    = '19-FEB-49'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 769;

UPDATE customers c
SET
c.date_of_birth    = '02-MAR-55'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 770;

UPDATE customers c
SET
c.date_of_birth    = '21-MAR-77'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 771;

UPDATE customers c
SET
c.date_of_birth    = '01-APR-43'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 772;

UPDATE customers c
SET
c.date_of_birth    = '21-APR-83'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 782;

UPDATE customers c
SET
c.date_of_birth    = '30-APR-76'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 825;

UPDATE customers c
SET
c.date_of_birth    = '20-MAY-69'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 826;

UPDATE customers c
SET
c.date_of_birth    = '19-JUN-73'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 827;

UPDATE customers c
SET
c.date_of_birth    = '20-JUL-55'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 828;

UPDATE customers c
SET
c.date_of_birth    = '19-AUG-59'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 829;

UPDATE customers c
SET
c.date_of_birth    = '29-AUG-47'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 830;

UPDATE customers c
SET
c.date_of_birth    = '17-SEP-52'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 831;

UPDATE customers c
SET
c.date_of_birth    = '27-SEP-76'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 832;

UPDATE customers c
SET
c.date_of_birth    = '17-OCT-34'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 833;

UPDATE customers c
SET
c.date_of_birth    = '27-OCT-64'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 834;

UPDATE customers c
SET
c.date_of_birth    = '16-NOV-42'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 835;

UPDATE customers c
SET
c.date_of_birth    = '16-DEC-52'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'C: 50,000 - 69,999'
WHERE c.customer_id = 836;

UPDATE customers c
SET
c.date_of_birth    = '15-JAN-65'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 837;

UPDATE customers c
SET
c.date_of_birth    = '25-JAN-85'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 838;

UPDATE customers c
SET
c.date_of_birth    = '14-FEB-57'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 839;

UPDATE customers c
SET
c.date_of_birth    = '16-MAR-51'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 840;

UPDATE customers c
SET
c.date_of_birth    = '26-MAR-51'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 841;

UPDATE customers c
SET
c.date_of_birth    = '15-APR-77'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 842;

UPDATE customers c
SET
c.date_of_birth    = '25-APR-59'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 843;

UPDATE customers c
SET
c.date_of_birth    = '15-MAY-44'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 844;

UPDATE customers c
SET
c.date_of_birth    = '25-MAY-44'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 845;

UPDATE customers c
SET
c.date_of_birth    = '14-JUN-62'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'L: 300,000 and above'
WHERE c.customer_id = 846;

UPDATE customers c
SET
c.date_of_birth    = '14-JUL-42'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 847;

UPDATE customers c
SET
c.date_of_birth    = '24-JUL-48'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 848;

UPDATE customers c
SET
c.date_of_birth    = '13-AUG-80'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 849;

UPDATE customers c
SET
c.date_of_birth    = '23-AUG-91'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 850;

UPDATE customers c
SET
c.date_of_birth    = '12-SEP-51'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'B: 30,000 - 49,999'
WHERE c.customer_id = 851;

UPDATE customers c
SET
c.date_of_birth    = '22-SEP-53'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 852;

UPDATE customers c
SET
c.date_of_birth    = '12-OCT-77'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 853;

UPDATE customers c
SET
c.date_of_birth    = '22-OCT-87'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 905;

UPDATE customers c
SET
c.date_of_birth    = '11-NOV-58'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 906;

UPDATE customers c
SET
c.date_of_birth    = '21-NOV-49'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 909;

UPDATE customers c
SET
c.date_of_birth    = '11-DEC-81'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 911;

UPDATE customers c
SET
c.date_of_birth    = '21-DEC-56'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 912;

UPDATE customers c
SET
c.date_of_birth    = '10-JAN-85'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 913;

UPDATE customers c
SET
c.date_of_birth    = '20-JAN-78'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'J: 190,000 - 249,999'
WHERE c.customer_id = 916;

UPDATE customers c
SET
c.date_of_birth    = '09-FEB-75'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 917;

UPDATE customers c
SET
c.date_of_birth    = '19-FEB-62'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 919;

UPDATE customers c
SET
c.date_of_birth    = '10-MAR-72'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 920;

UPDATE customers c
SET
c.date_of_birth    = '20-MAR-48'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 921;

UPDATE customers c
SET
c.date_of_birth    = '09-APR-60'
, c.marital_status   = 'married'
, c.gender           = 'F'
, c.income_level     = 'G: 130,000 - 149,999'
WHERE c.customer_id = 923;

UPDATE customers c
SET
c.date_of_birth    = '20-APR-34'
, c.marital_status   = 'single'
, c.gender           = 'F'
, c.income_level     = 'D: 70,000 - 89,999'
WHERE c.customer_id = 924;

UPDATE customers c
SET
c.date_of_birth    = '10-MAY-61'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'I: 170,000 - 189,999'
WHERE c.customer_id = 927;

UPDATE customers c
SET
c.date_of_birth    = '09-JUN-54'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'E: 90,000 - 109,999'
WHERE c.customer_id = 928;

UPDATE customers c
SET
c.date_of_birth    = '19-JUN-78'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 929;

UPDATE customers c
SET
c.date_of_birth    = '08-JUL-24'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'A: Below 30,000'
WHERE c.customer_id = 930;

UPDATE customers c
SET
c.date_of_birth    = '08-AUG-47'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 931;

UPDATE customers c
SET
c.date_of_birth    = '17-AUG-52'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 932;

UPDATE customers c
SET
c.date_of_birth    = '07-SEP-59'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'H: 150,000 - 169,999'
WHERE c.customer_id = 934;

UPDATE customers c
SET
c.date_of_birth    = '17-SEP-70'
, c.marital_status   = 'single'
, c.gender           = 'M'
, c.income_level     = 'F: 110,000 - 129,999'
WHERE c.customer_id = 980;

UPDATE customers c
SET
c.date_of_birth    = '07-OCT-73'
, c.marital_status   = 'married'
, c.gender           = 'M'
, c.income_level     = 'K: 250,000 - 299,999'
WHERE c.customer_id = 981;

SET FEEDBACK ON

COMMIT;
