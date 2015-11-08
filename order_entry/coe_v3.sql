rem
rem Header: coe_v3.sql 2015/03/19 10:23:26 smtaylor EXP $
rem
rem Copyright (c) 2001, 2015, Oracle and/or its affiliates.  All rights reserved. 
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
rem   coe_v3.sql - create OE Common Schema
rem
rem DESCRIPTON
rem   Creates database objects. The script assumes that the HR schema
rem   is present.
rem
rem NOTES
rem   The OIDs assigned for the object types are used to 
rem   simplify the setup of Replication demos and are not needed
rem   in most unreplicated environments.
rem
rem MODIFIED   (MM/DD/YY)
rem   smtaylor  03/19/15 - added parameter 4, connect_string
rem   smtaylor  03/19/15 - added pararmeter &connect_string to script calls
rem   bhammers  01/24/11 - bug 11790009: consistent variable name for sys pwd 
rem   ahunold   10/10/02 - bug 2376117
rem   ahunold   10/07/02 - coe_xml.sql
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   ahunold   08/15/02 - copied from oe_cre, added PROMOTIONS
rem   ahunold   09/17/01 - FK in PRODUCT_DESCRIPTIONS
rem   ahunold   04/25/01 - OID
rem   ahunold   03/02/01 - eliminating DROP SEQUENCE
rem   ahunold   01/30/01 - OE script headers
rem   ahunold   01/24/01 - Eliminate extra lines from last merge
rem   ahunold   01/05/01 - promo_id
rem   ahunold   01/05/01 - NN constraints in product_descriptions
rem   ahunold   01/09/01 - checkin ADE

PROMPT 
PROMPT specify Sample Schema version as parameter 1:
DEFINE vrs     = &1
PROMPT 
PROMPT specify password for OE as parameter 2:
DEFINE pwd_oe  = &2
PROMPT
PROMPT PROMPT password for SYS as parameter 3:
DEFINE pass_sys = &3
PROMPT
PROMPT specify connect string as parameter 4:
DEFINE connect_string     = &4
PROMPT
 
-- ======================================================================
-- Type definitions
-- ======================================================================

CREATE TYPE cust_address_typ
  OID '82A4AF6A4CD1656DE034080020E0EE3D'
  AS OBJECT
    ( street_address     VARCHAR2(40)
    , postal_code        VARCHAR2(10)
    , city               VARCHAR2(30)
    , state_province     VARCHAR2(10)
    , country_id         CHAR(2)
    );
/

REM ===========================================================================
REM Create phone_list_typ varray to be varray column in customers table.
REM ===========================================================================

CREATE TYPE phone_list_typ
  OID '82A4AF6A4CD2656DE034080020E0EE3D'
  AS VARRAY(5) OF VARCHAR2(25);
/

REM ===========================================================================
REM Create customers table.
REM The cust_geo_location column will become MDSYS.SDO_GEOMETRY (spatial) 
REM datatype when appropriate scripts and data are available.
REM ===========================================================================


DEFINE vscript = __SUB__CWD__/order_entry/ccus_&vrs

@&vscript

CREATE UNIQUE INDEX customers_pk
   ON customers (customer_id) ;
   
REM Both table and indexes are analyzed using the oe_analz.sql script.

ALTER TABLE customers 
ADD ( CONSTRAINT customers_pk
      PRIMARY KEY (customer_id)
    ) ;

REM ===========================================================================
REM Create warehouses table; 
REM  includes spatial data column wh_geo_location and
REM  XML type warehouse_spec (was bug b41)
REM ===========================================================================

DEFINE vscript = __SUB__CWD__/order_entry/cwhs_&vrs

@&vscript

CREATE UNIQUE INDEX warehouses_pk
ON warehouses (warehouse_id) ;

ALTER TABLE warehouses 
ADD (CONSTRAINT warehouses_pk PRIMARY KEY (warehouse_id)
    );

REM ===========================================================================
REM Create table order_items.
REM ===========================================================================
	
CREATE TABLE order_items
    ( order_id           NUMBER(12) 
    , line_item_id       NUMBER(3)  NOT NULL
    , product_id         NUMBER(6)  NOT NULL
    , unit_price         NUMBER(8,2)
    , quantity           NUMBER(8)
    ) ;

CREATE UNIQUE INDEX order_items_pk
ON order_items (order_id, line_item_id) ;

CREATE UNIQUE INDEX order_items_uk
ON order_items (order_id, product_id) ;

ALTER TABLE order_items
ADD ( CONSTRAINT order_items_pk PRIMARY KEY (order_id, line_item_id)
    );

CREATE OR REPLACE TRIGGER insert_ord_line
  BEFORE INSERT ON order_items
  FOR EACH ROW 
  DECLARE 
    new_line number; 
  BEGIN 
    SELECT (NVL(MAX(line_item_id),0)+1) INTO new_line 
      FROM order_items
      WHERE order_id = :new.order_id; 
    :new.line_item_id := new_line; 
  END; 
/

REM ===========================================================================
REM Create table orders, which includes a TIMESTAMP column and a check
REM constraint.
REM ===========================================================================

DEFINE vscript = __SUB__CWD__/order_entry/cord_&vrs

@&vscript

CREATE UNIQUE INDEX order_pk 
ON orders (order_id) ;

ALTER TABLE orders
ADD ( CONSTRAINT order_pk 
      PRIMARY KEY (order_id)
    );

REM ===========================================================================
REM Create inventories table, which contains a concatenated primary key.
REM  Note that PK is only enable after supporting non-unique index is created
REM ===========================================================================
    
CREATE TABLE inventories
  ( product_id         NUMBER(6)
  , warehouse_id       NUMBER(3) CONSTRAINT inventory_warehouse_id_nn NOT NULL
  , quantity_on_hand   NUMBER(8)
	CONSTRAINT inventory_qoh_nn NOT NULL
  , CONSTRAINT inventory_pk 
	PRIMARY KEY (product_id, warehouse_id) DISABLE NOVALIDATE
  ) ;

--
-- Enhancement request 2376117 suggested to have a PRIMARY KEY constraint
-- supported by a non-unique index
-- Starting with 10i R1, this is implemented in table INVENTORIES:
--

CREATE INDEX inventory_ix
 ON inventories (warehouse_id,product_id);

ALTER TABLE inventories ENABLE CONSTRAINT inventory_pk; 

REM ===========================================================================
REM Create table product_information, which contains an INTERVAL datatype and
REM a CHECK ... IN constraint.
REM ===========================================================================

CREATE TABLE product_information
    ( product_id          NUMBER(6)
    , product_name        VARCHAR2(50)
    , product_description VARCHAR2(2000)
    , category_id         NUMBER(2)
    , weight_class        NUMBER(1)
    , warranty_period     INTERVAL YEAR TO MONTH
    , supplier_id         NUMBER(6)
    , product_status      VARCHAR2(20)
    , list_price          NUMBER(8,2)
    , min_price           NUMBER(8,2)
    , catalog_url         VARCHAR2(50)
    , CONSTRAINT          product_status_lov
                          CHECK (product_status in ('orderable'
                                                  ,'planned'
                                                  ,'under development'
                                                  ,'obsolete')
                               )
    ) ;

ALTER TABLE product_information 
ADD ( CONSTRAINT product_information_pk PRIMARY KEY (product_id)
    );

REM ===========================================================================
REM Create table product_descriptions, which contains NVARCHAR2 columns for
REM NLS-language information.
REM ===========================================================================

CREATE TABLE product_descriptions
    ( product_id             NUMBER(6)
    , language_id            VARCHAR2(3)
    , translated_name        NVARCHAR2(50)
CONSTRAINT translated_name_nn NOT NULL
    , translated_description NVARCHAR2(2000)
CONSTRAINT translated_desc_nn NOT NULL
    );

CREATE UNIQUE INDEX prd_desc_pk
ON product_descriptions(product_id,language_id) ;

ALTER TABLE product_descriptions
ADD ( CONSTRAINT product_descriptions_pk 
	PRIMARY KEY (product_id, language_id));

REM ===========================================================================
REM Create table promotions for OWB demos, congruent with SH schema
REM ===========================================================================
   
CREATE TABLE promotions (
  promo_id NUMBER(6),
  promo_name VARCHAR2(20));

ALTER TABLE promotions
ADD CONSTRAINT promo_id_pk PRIMARY KEY (promo_id);

REM ===========================================================================
REM Create foreign key constraints
REM ===========================================================================

ALTER TABLE orders 
ADD ( CONSTRAINT orders_sales_rep_fk 
      FOREIGN KEY (sales_rep_id) 
      REFERENCES hr.employees(employee_id)
      ON DELETE SET NULL
    ) ;

ALTER TABLE orders 
ADD ( CONSTRAINT orders_customer_id_fk 
      FOREIGN KEY (customer_id) 
      REFERENCES customers(customer_id) 
      ON DELETE SET NULL 
    ) ;

ALTER TABLE warehouses 
ADD ( CONSTRAINT warehouses_location_fk 
      FOREIGN KEY (location_id)
      REFERENCES hr.locations(location_id)
      ON DELETE SET NULL
    ) ;

ALTER TABLE customers
ADD ( CONSTRAINT customers_account_manager_fk
      FOREIGN KEY (account_mgr_id)
      REFERENCES hr.employees(employee_id)
      ON DELETE SET NULL
    ) ;

ALTER TABLE inventories 
ADD ( CONSTRAINT inventories_warehouses_fk 
      FOREIGN KEY (warehouse_id)
      REFERENCES warehouses (warehouse_id)
      ENABLE NOVALIDATE
    ) ;

ALTER TABLE inventories 
ADD ( CONSTRAINT inventories_product_id_fk 
      FOREIGN KEY (product_id)
      REFERENCES product_information (product_id)
    ) ;

ALTER TABLE order_items
ADD ( CONSTRAINT order_items_order_id_fk 
      FOREIGN KEY (order_id)
      REFERENCES orders(order_id)
      ON DELETE CASCADE
enable novalidate
    ) ;

ALTER TABLE order_items
ADD ( CONSTRAINT order_items_product_id_fk 
      FOREIGN KEY (product_id)
      REFERENCES product_information(product_id)
    ) ;

ALTER TABLE product_descriptions
ADD ( CONSTRAINT pd_product_id_fk
      FOREIGN KEY (product_id)
      REFERENCES product_information(product_id)
    ) ;

REM ===========================================================================
REM Create cross-schema synonyms
REM ===========================================================================

CREATE SYNONYM countries FOR hr.countries;

CREATE SYNONYM locations FOR hr.locations;

CREATE SYNONYM departments FOR hr.departments;

CREATE SYNONYM jobs FOR hr.jobs;

CREATE SYNONYM employees FOR hr.employees;

CREATE SYNONYM job_history FOR hr.job_history;

REM ===========================================================================
REM Create sequences
REM ===========================================================================

CREATE SEQUENCE orders_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

REM ===========================================================================
REM Call XML script
REM ===========================================================================

@__SUB__CWD__/order_entry/coe_xml.sql &pwd_oe &pass_sys &connect_string

REM ===========================================================================
REM Need commit for PO
REM ===========================================================================

COMMIT;
