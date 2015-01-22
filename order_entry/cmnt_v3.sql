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
rem   cmnt_v3.sql - create comments for OE Common Schema
rem
rem DESCRIPTON
rem   
rem
rem MODIFIED   (MM/DD/YY)
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   ahunold   07/30/02 - ahunold_versions03
rem   ahunold   07/29/02 - 092 version of oe_comnt.sql
rem   ahunold   01/30/01 - OE script headers
rem   ahunold   01/24/01 - Eliminate extra lines from last merge
rem   ahunold   01/09/01 - checkin ADE

COMMENT ON TABLE oe.customers IS
'Contains customers data either entered by an employee or by the customer
him/herself over the Web.';

COMMENT ON COLUMN oe.customers.cust_address IS
'Object column of type address_typ.';

COMMENT ON COLUMN oe.customers.phone_numbers IS
'Varray column of type phone_list_typ';
.
COMMENT ON COLUMN oe.customers.cust_geo_location IS
'SDO (spatial) column.';

COMMENT ON COLUMN oe.customers.cust_first_name IS
'NOT NULL constraint.';

COMMENT ON COLUMN oe.customers.cust_last_name IS
'NOT NULL constraint.';

COMMENT ON COLUMN oe.customers.credit_limit IS
'Check constraint.';

COMMENT ON COLUMN oe.customers.customer_id IS
'Primary key column.';

COMMENT ON COLUMN oe.customers.account_mgr_id IS
'References hr.employees.employee_id.';

REM ===========================================================================

COMMENT ON TABLE oe.warehouses IS
'Warehouse data unspecific to any industry.';

COMMENT ON COLUMN oe.warehouses.wh_geo_location IS
'SDO (spatial) column.';

COMMENT ON COLUMN oe.warehouses.warehouse_id IS
'Primary key column.';

COMMENT ON COLUMN oe.warehouses.location_id IS
'Primary key column, references hr.locations.location_id.';

REM ===========================================================================

COMMENT ON TABLE oe.order_items IS
'Example of many-to-many resolution.';

COMMENT ON COLUMN oe.order_items.order_id IS
'Part of concatenated primary key, references orders.order_id.';

COMMENT ON COLUMN oe.order_items.product_id IS
'References product_information.product_id.';

COMMENT ON COLUMN oe.order_items.line_item_id IS
'Part of concatenated primary key.';

COMMENT ON COLUMN oe.orders.order_status IS
'0: Not fully entered, 1: Entered, 2: Canceled - bad credit, -
3: Canceled - by customer, 4: Shipped - whole order, -
5: Shipped - replacement items, 6: Shipped - backlog on items, -
7: Shipped - special delivery, 8: Shipped - billed, 9: Shipped - payment plan,-
10: Shipped - paid';

REM ===========================================================================

COMMENT ON TABLE oe.orders IS
'Contains orders entered by a salesperson as well as over the Web.';

COMMENT ON COLUMN oe.orders.order_date IS
'TIMESTAMP WITH LOCAL TIME ZONE column, NOT NULL constraint.';

COMMENT ON COLUMN oe.orders.order_id IS
'PRIMARY KEY column.';

COMMENT ON COLUMN oe.orders.sales_rep_id IS
'References hr.employees.employee_id.';

COMMENT ON COLUMN oe.orders.promotion_id IS
'Sales promotion ID. Used in SH schema';

COMMENT ON COLUMN oe.orders.order_mode IS
'CHECK constraint.';

COMMENT ON COLUMN oe.orders.order_total IS
'CHECK constraint.';

REM ===========================================================================

COMMENT ON TABLE oe.inventories IS
'Tracks availability of products by product_it and warehouse_id.';

COMMENT ON COLUMN oe.inventories.product_id IS
'Part of concatenated primary key, references product_information.product_id.';

COMMENT ON COLUMN oe.inventories.warehouse_id IS
'Part of concatenated primary key, references warehouses.warehouse_id.';

REM ===========================================================================

COMMENT ON TABLE oe.product_information IS
'Non-industry-specific data in various categories.';

COMMENT ON COLUMN oe.product_information.product_id IS
'Primary key column.';

COMMENT ON COLUMN oe.product_information.product_description IS
'Primary language description corresponding to translated_description in
oe.product_descriptions, added to provide non-NLS text columns for OC views
to accss.';

COMMENT ON COLUMN oe.product_information.category_id IS
'Low cardinality column, can be used for bitmap index. 
Schema SH uses it as foreign key';

COMMENT ON COLUMN oe.product_information.weight_class IS
'Low cardinality column, can be used for bitmap index.';

COMMENT ON COLUMN oe.product_information.warranty_period IS
'INTERVAL YEAER TO MONTH column, low cardinality, can be used for bitmap 
index.';

COMMENT ON COLUMN oe.product_information.supplier_id IS
'Offers possibility of extensions outside Common Schema.';

COMMENT ON COLUMN oe.product_information.product_status IS
'Check constraint. Appropriate for complex rules, such as "All products in 
status PRODUCTION must have at least one inventory entry." Also appropriate 
for a trigger auditing status change.';

REM ===========================================================================

COMMENT ON TABLE product_descriptions IS
'Non-industry-specific design, allows selection of NLS-setting-specific data
derived at runtime, for example using the products view.';


COMMENT ON COLUMN product_descriptions.product_id IS
'Primary key column.';

COMMENT ON COLUMN product_descriptions.language_id IS
'Primary key column.';

REM Description of OE views ===================================================

COMMENT ON TABLE products IS
'This view joins product_information and product_descriptions, using NLS
settings to pick the appropriate language-specific product description.';

COMMENT ON TABLE bombay_inventory IS
'This view shows inventories at the Bombay warehouse.';

COMMENT ON TABLE sydney_inventory IS
'This view shows inventories at the Sydney warehouse.';

COMMENT ON TABLE toronto_inventory IS
'This view shows inventories at the Toronto warehouse.';
