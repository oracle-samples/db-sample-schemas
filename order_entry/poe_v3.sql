Rem
Rem $Header: poe_v3.sql 12-mar-2003.15:29:55 ahunold Exp $
Rem
Rem poe_v3.sql
Rem
Rem Copyright (c) 2002, 2015, Oracle Corporation.  All rights reserved.  
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
Rem      poe_v3.sql - post load tasks for OE schema
Rem
Rem    DESCRIPTION
Rem      Creates views, indexes, comments
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    ahunold     03/10/03 - customers and orders views
Rem    ahunold     11/26/02 - ahunold_bug-2635796
Rem    ahunold     11/21/02 - Created
Rem

DEFINE vrs = &1

@__SUB__CWD__/order_entry/oe_views

CREATE OR REPLACE VIEW account_managers AS
SELECT		c.account_mgr_id 		ACCT_MGR,
		cr.region_id 			REGION, 
		c.cust_address.country_id 	COUNTRY, 
		c.cust_address.state_province 	PROVINCE, 
		count(*) 			NUM_CUSTOMERS
FROM		customers c, countries cr
WHERE		c.cust_address.country_id = cr.country_id
GROUP BY ROLLUP (c.account_mgr_id, 
		 cr.region_id, 
		 c.cust_address.country_id, 
		 c.cust_address.state_province);

CREATE OR REPLACE FUNCTION get_phone_number_f
  (p_in INTEGER, p_phonelist phone_list_typ) 
RETURN VARCHAR2 AS
  TYPE phone_list IS VARRAY(5) OF VARCHAR2(25);
  phone_out varchar2(25) := null;
  v_size INTEGER;
BEGIN
    IF p_phonelist.FIRST IS NULL OR
       p_in > (p_phonelist.LAST + 1) - p_phonelist.FIRST THEN
      RETURN phone_out;
    ELSE
      phone_out := p_phonelist(p_in);
      RETURN phone_out;
    END IF;
END;
/

CREATE OR REPLACE VIEW customers_view
AS SELECT 
  c.customer_id,
  c.cust_first_name,
  c.cust_last_name,
  c.cust_address.street_address street_address,
  c.cust_address.postal_code postal_code,
  c.cust_address.city city,
  c.cust_address.state_province state_province,
  co.country_id,
  co.country_name,
  co.region_id,
  c.nls_language,
  c.nls_territory,
  c.credit_limit,
  c.cust_email,
  substr(get_phone_number_f(1,phone_numbers),1,25) Primary_Phone_number,
  substr(get_phone_number_f(2,phone_numbers),1,25) Phone_number_2,
  substr(get_phone_number_f(3,phone_numbers),1,25) Phone_number_3,
  substr(get_phone_number_f(4,phone_numbers),1,25) Phone_number_4,
  substr(get_phone_number_f(5,phone_numbers),1,25) Phone_number_5,
  c.account_mgr_id,
  c.cust_geo_location.sdo_gtype location_gtype,
  c.cust_geo_location.sdo_srid location_srid,
  c.cust_geo_location.sdo_point.x location_x,
  c.cust_geo_location.sdo_point.y location_y,
  c.cust_geo_location.sdo_point.z location_z
FROM 
  countries co, 
  customers c
WHERE 
  c.cust_address.country_id = co.country_id(+) 
;

CREATE OR REPLACE VIEW orders_view
As 
select order_id,
  to_date(to_char(order_date,'DD-MON-YY HH:MI:SS'),'DD-MON-YY HH:MI:SS')    order_date,
order_mode,
customer_id,
order_status,
order_total,
sales_rep_id,
promotion_id
from orders;

DEFINE vscript = __SUB__CWD__/order_entry/cmnt_&vrs
@&vscript

DEFINE vscript = __SUB__CWD__/order_entry/cidx_&vrs
@&vscript

