rem
rem Header: oe_idx.sql 09-jan-01
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
rem   oe_idx.sql - create indexes for OE Common Schema
rem
rem DESCRIPTON
rem   Re-Creates indexes
rem
rem MODIFIED   (MM/DD/YY)
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   ahunold   03/02/01 - eliminating DROP INDEX
rem   ahunold   01/30/01 - OE script headers
rem   ahunold   01/09/01 - checkin ADE

CREATE INDEX whs_location_ix
ON warehouses (location_id);

CREATE INDEX inv_product_ix
ON inventories (product_id);

CREATE INDEX inv_warehouse_ix
ON inventories (warehouse_id);

CREATE INDEX item_order_ix
ON order_items (order_id);

CREATE INDEX item_product_ix
ON order_items (product_id);

CREATE INDEX ord_sales_rep_ix
ON orders (sales_rep_id);

CREATE INDEX ord_customer_ix
ON orders (customer_id);

CREATE INDEX ord_order_date_ix
ON orders (order_date);

CREATE INDEX cust_account_manager_ix
ON customers (account_mgr_id);

CREATE INDEX cust_lname_ix
ON customers (cust_last_name);

CREATE INDEX cust_email_ix
ON customers (cust_email);

CREATE INDEX prod_name_ix
ON product_descriptions (translated_name);

CREATE INDEX prod_supplier_ix
ON product_information (supplier_id);

CREATE INDEX cust_upper_name_ix
ON customers (UPPER(cust_last_name), UPPER(cust_first_name));
