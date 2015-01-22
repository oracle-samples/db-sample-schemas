-- Copyright (c) 2015 Oracle
--
-- Permission is hereby granted, free of charge, to any person obtaining
-- a copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
-- LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-- WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--

LOAD DATA
APPEND
INTO TABLE customers
FIELDS TERMINATED BY '|' OPTIONALLY ENCLOSED BY '"'
(CUST_ID,
 CUST_FIRST_NAME,
 CUST_LAST_NAME,
 CUST_GENDER,
 CUST_YEAR_OF_BIRTH,
 CUST_MARITAL_STATUS,
 CUST_STREET_ADDRESS,
 CUST_POSTAL_CODE,
 CUST_CITY,
 CUST_CITY_ID,
 CUST_STATE_PROVINCE,
 CUST_STATE_PROVINCE_ID,
 COUNTRY_ID,
 CUST_MAIN_PHONE_NUMBER,
 CUST_INCOME_LEVEL,
 CUST_CREDIT_LIMIT,
 CUST_EMAIL,
 CUST_TOTAL,
 CUST_TOTAL_ID,
 COMPANY_ID FILLER,
 CUST_SRC_ID,
 CUST_EFF_FROM DATE(10) "YYYY-MM-DD",
 CUST_EFF_TO DATE(10) "YYYY-MM-DD",
 CUST_VALID)
