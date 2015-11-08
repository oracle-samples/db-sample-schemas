Rem
Rem $Header: rdbms/demo/schema/order_entry/xdb03usg.sql /main/6 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem coe_xml.sql
Rem
Rem Copyright (c) 2002, 2015, Oracle and/or its affiliates.  All rights reserved. 
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
Rem      xdb03usg.sql - Create XML DB data for user OE
Rem
Rem    DESCRIPTION
Rem      .
Rem
Rem    NOTES
Rem      .
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19/15 - added @&&connect_string to CONNECT
Rem    celsbern    06/15/12 - using force=TRUE on registerSchema
Rem    bhammers    01/24/11 - bug 11790062: rename XDB_ to COE_, bug 11790009: 
Rem                           consistent variable name for sys pwd 
Rem    celsbern    07/17/09 - added explicit revoke of execute on SUBDIR
Rem                           directory
Rem    celsbern    02/24/09 - renamed XMLDIR to SS_OE_XMLDIR
Rem    cbauwens    05/25/05 - rename nested tables 
Rem    cbauwens    09/23/04 - cbauwens_bug3031915
Rem    cbauwens    03/16/04 - Created

--
--
-- Create Repository Folder Hierarchy
--
@__SUB__CWD__/order_entry/createFolders.sql


--
-- Load example documents into the XDB repository
--
@__SUB__CWD__/order_entry/createResources.sql


--
--Register schema
--
BEGIN
  DBMS_XMLSCHEMA.registerSchema('http://localhost:8080/source/schemas/poSource/xsd/purchaseOrder.xsd',
                                XDBURIType('/home/OE/purchaseOrder.xsd').getClob(),
                                TRUE, 
                                TRUE, 
                                FALSE, 
                                TRUE,
                                TRUE);
END;
/

--
--Rename the cryptic nested tables
--
call coe_utilities.renameCollectionTable ('PURCHASEORDER','"XMLDATA"."LINEITEMS"."LINEITEM"','LINEITEM_TABLE')
/
call coe_utilities.renameCollectionTable ('PURCHASEORDER','"XMLDATA"."ACTIONS"."ACTION"','ACTION_TABLE')
/

--
-- Upload the Directory containing the sample documents
--
BEGIN
 COE_UTILITIES.uploadFiles('filelist.xml', 
                               'SS_OE_XMLDIR', 
                               '/home/OE/PurchaseOrders');
END;
/

-- revoke the grant of execute on the SUBDIR directory 
CONNECT sys/&&pass_sys@&&connect_string AS SYSDBA;
 
revoke execute on directory SUBDIR from OE
/
CONNECT OE/&pass_oe@&&connect_string
