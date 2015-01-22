Rem
Rem $Header: rdbms/demo/schema/order_entry/createResources.sql /main/2 2009/02/25 20:16:33 celsbern Exp $
Rem
Rem createResources.sql
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
Rem      createResources.sql - Load example documents into the XDB repository
Rem
Rem    DESCRIPTION
Rem      .
Rem
Rem    NOTES
Rem      .
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    celsbern    02/24/09 - renamed XMLDIR to SS_OE_XMLDIR
Rem    cbauwens    09/23/04 - cbauwens_bug3031915
Rem    cbauwens    03/16/04 - add empdept 
Rem    cbauwens    03/14/04 - Created 


DECLARE
  res BOOLEAN;
BEGIN
  res := DBMS_XDB.createResource('/home/OE/purchaseOrder.xsd',
                                 bfilename('SS_OE_XMLDIR', 
                                  'purchaseOrder.xsd'),
                                 nls_charset_id('AL32UTF8'));
  res := DBMS_XDB.createResource('/home/OE/purchaseOrder.xsl',
                                 bfilename('SS_OE_XMLDIR', 
                                  'purchaseOrder.xsl'),
                                 nls_charset_id('AL32UTF8'));
                                 
                               
  res := DBMS_XDB.createResource('/home/OE/xsl/empdept.xsl',
                                 bfilename('SS_OE_XMLDIR', 'empdept.xsl'),
                                 nls_charset_id('AL32UTF8'));

END;
/
