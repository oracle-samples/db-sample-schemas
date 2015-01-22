rem
Rem $Header: oc_popul.sql 29-aug-2002.11:45:08 hyeh Exp $  
rem
rem Copyright (c) 2001, 2015, Oracle Corporation.  All rights reserved.  
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
rem   oc_popul.sql - OC (Online Catalog) subschema of OE Common Schema
rem
rem DESCRIPTON
rem   Populates tables
rem
rem MODIFIED   (MM/DD/YY)
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   gxlee     09/17/01 - categories hierarchy
rem   gxlee     03/05/01 - substituteable object table
rem   ahunold   01/29/01 - typo
rem   ahunold   01/09/01 - checkin ADE

INSERT INTO categories_tab
  VALUES (leaf_category_typ('hardware1', 'monitors', 11,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 11) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('hardware2', 'printers', 12,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 12) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('hardware3', 'harddisks', 13,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 13) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('hardware4', 'memory components/upgrades', 14,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 14) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('hardware5'
         , 'processors, sound and video cards, network cards, motherboards', 15,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 15) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('hardware6', 'keyboards, mouses, mouse pads', 16,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 16) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('hardware7'
         , 'other peripherals (CD-ROM, DVD, tape cartridge drives, ...)', 17,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 17) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('hardware8'
         , 'miscellaneous hardware (cables, screws, power supplies ...)', 19,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 19) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('software1', 'spreadsheet software', 21,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 21) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('software2', 'word processing software', 22,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 22) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('software3', 'database software', 23,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 23) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('software4', 'operating systems', 24,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 24) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('software5', 'software development tools (including languages)', 25,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 25) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('software6', 'miscellaneous software', 29,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 29) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('office1', 'capitalizable assets (desks, chairs, phones ...)', 31,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 31) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('office2'
         , 'office supplies for daily use (pencils, erasers, staples, ...)', 32,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 32) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('office3', 'manuals, other books', 33,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 33) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (leaf_category_typ('office4', 'miscellaneous office supplies', 39,
  CAST(MULTISET(SELECT o.product_id
    FROM oc_product_information o
    WHERE o.category_id = 39) as product_ref_list_typ))) ;

INSERT INTO categories_tab
  VALUES (composite_category_typ('hardware', 'computer hardware and peripherals', 10,
  CAST(MULTISET(SELECT REF(g)
    FROM categories_tab g
    WHERE g.category_id IN (11, 12, 13, 14, 15, 16, 17, 19)) as
         subcategory_ref_list_typ)));

INSERT INTO categories_tab
  VALUES (composite_category_typ('software', 'computer software', 20,
  CAST(MULTISET(SELECT REF(g)
    FROM categories_tab g
    WHERE g.category_id IN (21, 22, 23, 24, 25, 29)) as 
         subcategory_ref_list_typ)));

INSERT INTO categories_tab
  VALUES (composite_category_typ('office equipment', 'office furniture and supplies', 30,
  CAST(MULTISET(SELECT REF(g)
    FROM categories_tab g
    WHERE g.category_id IN (31, 32, 33, 39)) as
         subcategory_ref_list_typ)));

INSERT INTO categories_tab
  VALUES (catalog_typ('online catalog'
         , 'catalog of computer hardware, software, and office equipment'
         , 90,
  CAST(MULTISET(SELECT REF(g)
    FROM categories_tab g
    WHERE g.category_id IN (10, 20, 30)) as
         subcategory_ref_list_typ)));

ALTER TYPE category_typ
 ADD ATTRIBUTE (parent_category_id number(2)) CASCADE;

UPDATE categories_tab
  SET parent_category_id = 90
  WHERE category_id IN (10, 20, 30);

UPDATE categories_tab
  SET parent_category_id = 10
  WHERE category_id IN (11, 12, 13, 14, 15, 16, 17, 19);

UPDATE categories_tab
  SET parent_category_id = 20
  WHERE category_id IN (21, 22, 23, 24, 25, 29);

UPDATE categories_tab
  SET parent_category_id = 30
  WHERE category_id IN (31, 32, 33, 39);

COMMIT;

ALTER TYPE catalog_typ COMPILE BODY;
ALTER TYPE composite_category_typ COMPILE BODY;
ALTER TYPE leaf_category_typ COMPILE BODY; 


