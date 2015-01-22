rem
rem Header: oe_p_whs.sql 09-jan-01
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
rem   oe_p_whs.sql - populate OE Common Schema
rem
rem DESCRIPTON
rem   Table warehouses
rem
rem MODIFIED   (MM/DD/YY)
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   ahunold   02/21/01 - XML update statements
rem   ahunold   01/09/01 - checkin ADE

INSERT INTO warehouses VALUES (1,NULL,'Southlake, Texas',1400, 
	MDSYS.SDO_GEOMETRY(2001, 8307, 
	MDSYS.SDO_POINT_TYPE(-103.00195, 36.500374, NULL), NULL, NULL)); 
INSERT INTO warehouses VALUES (2,NULL,'San Francisco',1500, 
	MDSYS.SDO_GEOMETRY(2001, 8307, 
	MDSYS.SDO_POINT_TYPE(-124.21014, 41.998016, NULL), NULL, NULL)); 
INSERT INTO warehouses VALUES (3,NULL,'New Jersey',1600, 
	MDSYS.SDO_GEOMETRY(2001, 8307, 
	MDSYS.SDO_POINT_TYPE(-74.695305, 41.35733, NULL), NULL, NULL)); 
INSERT INTO warehouses VALUES (4,NULL,'Seattle, Washington',1700, 
	MDSYS.SDO_GEOMETRY(2001, 8307, 
	MDSYS.SDO_POINT_TYPE(-123.61526, 46.257458, NULL), NULL, NULL)); 
INSERT INTO warehouses VALUES (5,NULL,'Toronto',1800,NULL);
INSERT INTO warehouses VALUES (6,NULL,'Sydney',2200,NULL);
INSERT INTO warehouses VALUES (7,NULL,'Mexico City',3200,NULL);
INSERT INTO warehouses VALUES (8,NULL,'Beijing',2000,NULL);
INSERT INTO warehouses VALUES (9,NULL,'Bombay',2100,NULL);

commit;

UPDATE warehouses SET warehouse_spec = sys.xmltype.createxml( 
'<?xml version="1.0"?> 
<Warehouse> 
<Building>Owned</Building> 
<Area>25000</Area> 
<Docks>2</Docks> 
<DockType>Rear load</DockType> 
<WaterAccess>Y</WaterAccess> 
<RailAccess>N</RailAccess> 
<Parking>Street</Parking> 
<VClearance>10 ft</VClearance> 
</Warehouse>' 
) WHERE warehouse_id = 1; 

UPDATE warehouses SET warehouse_spec = sys.xmltype.createxml( 
'<?xml version="1.0"?> 
<Warehouse> 
<Building>Rented</Building> 
<Area>50000</Area> 
<Docks>1</Docks> 
<DockType>Side load</DockType> 
<WaterAccess>Y</WaterAccess> 
<RailAccess>N</RailAccess> 
<Parking>Lot</Parking> 
<VClearance>12 ft</VClearance> 
</Warehouse>' 
) WHERE warehouse_id = 2; 

UPDATE warehouses SET warehouse_spec = sys.xmltype.createxml( 
'<?xml version="1.0"?> 
<Warehouse> 
<Building>Rented</Building> 
<Area>85700</Area> 
<DockType></DockType> 
<WaterAccess>N</WaterAccess> 
<RailAccess>N</RailAccess> 
<Parking>Street</Parking> 
<VClearance>11.5 ft</VClearance> 
</Warehouse>' 
) WHERE warehouse_id = 3; 

UPDATE warehouses SET warehouse_spec = sys.xmltype.createxml( 
'<?xml version="1.0"?> 
<Warehouse> 
<Building>Owned</Building> 
<Area>103000</Area> 
<Docks>3</Docks> 
<DockType>Side load</DockType> 
<WaterAccess>N</WaterAccess> 
<RailAccess>Y</RailAccess> 
<Parking>Lot</Parking> 
<VClearance>15 ft</VClearance> 
</Warehouse>' 
) WHERE warehouse_id = 4; 

commit;

