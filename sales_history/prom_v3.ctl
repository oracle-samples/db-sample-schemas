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
    INTO TABLE PROMOTIONS
    INSERT
    FIELDS TERMINATED BY '|' OPTIONALLY ENCLOSED BY '^'
(PROMO_ID,
 PROMO_NAME,
 PROMO_SUBCATEGORY,
 PROMO_SUBCATEGORY_ID,
 PROMO_CATEGORY,
 PROMO_CATEGORY_ID,
 PROMO_COST "TO_NUMBER(:PROMO_COST,'9999999999.99')",
 PROMO_BEGIN_DATE DATE(19) "YYYY-MM-DD-HH24-MI-SS",
 PROMO_END_DATE DATE(19) "YYYY-MM-DD-HH24-MI-SS",
 PROMO_TOTAL,
 PROMO_TOTAL_ID)
