rem
rem Header: oe_drop.sql 09-jan-01
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
rem   oe_drop.sql - drop OE Common Schema
rem
rem DESCRIPTON
rem   Deletes database objects. 
rem
rem MODIFIED   (MM/DD/YY)
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   ahunold   02/01/02 - bug2205388
rem   ahunold   01/30/01 - OE script headers
rem   ahunold   01/09/01 - checkin ADE

rem
rem  First drop the Online Catalog (OC) subschema objects
rem

@__SUB__CWD__/order_entry/oc_drop.sql

DROP TABLE        customers             CASCADE CONSTRAINTS;
DROP TABLE        inventories           CASCADE CONSTRAINTS;
DROP TABLE        order_items           CASCADE CONSTRAINTS;
DROP TABLE        orders                CASCADE CONSTRAINTS;
DROP TABLE        product_descriptions  CASCADE CONSTRAINTS;
DROP TABLE        product_information   CASCADE CONSTRAINTS;
DROP TABLE        warehouses            CASCADE CONSTRAINTS;

DROP TYPE         cust_address_typ;
DROP TYPE         phone_list_typ;

DROP SEQUENCE     orders_seq;

DROP SYNONYM      countries;
DROP SYNONYM      departments;
DROP SYNONYM      employees;
DROP SYNONYM      job_history;
DROP SYNONYM      jobs;
DROP SYNONYM      locations;

DROP VIEW         bombay_inventory;
DROP VIEW         product_prices;
DROP VIEW         products;
DROP VIEW         sydney_inventory;
DROP VIEW         toronto_inventory;

COMMIT;


