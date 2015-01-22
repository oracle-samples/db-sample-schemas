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

LOAD DATA INFILE data
    INTO TABLE SUPPLEMENTARY_DEMOGRAPHICS
    INSERT
    FIELDS TERMINATED BY '|' OPTIONALLY ENCLOSED BY '"'
(CUST_ID,
 EDUCATION,
 OCCUPATION,
 HOUSEHOLD_SIZE,
 YRS_RESIDENCE,
 AFFINITY_CARD,
 BULK_PACK_DISKETTES,
 FLAT_PANEL_MONITOR,
 HOME_THEATER_PACKAGE,
 BOOKKEEPING_APPLICATION,
 PRINTER_SUPPLIES,
 Y_BOX_GAMES,
 OS_DOC_SET_KANJI,
COMMENTS)
