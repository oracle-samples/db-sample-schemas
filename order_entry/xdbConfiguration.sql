Rem
Rem $Header: rdbms/demo/schema/order_entry/xdbConfiguration.sql /main/2 2011/03/02 22:41:26 bhammers Exp $
Rem
Rem xdbConfiguration.sql
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
Rem      xdbConfiguration.sql - Create view DATABASE_SUMMARY and package XDB_CONFIGURATION
Rem
Rem    DESCRIPTION
Rem      .
Rem
Rem    NOTES
Rem      .
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    bhammers    01/24/11 - bug 11790062: rename XDB_ to COE_
Rem    cbauwens    09/23/04 - cbauwens_bug3031915
Rem    cbauwens    03/16/04 - Created 


CREATE OR REPLACE VIEW DATABASE_SUMMARY 
AS
SELECT d.NAME, p.VALUE "SERVICE_NAME", i.HOST_NAME, n.VALUE "DB_CHARACTERSET" 
  FROM v$system_parameter p, v$database d, v$instance i, nls_database_parameters n
  WHERE p.name = 'service_names' 
    AND n.parameter='NLS_CHARACTERSET';
/


GRANT SELECT ON DATABASE_SUMMARY TO PUBLIC
/
ALTER SESSION SET current_schema = XDB
/

CREATE OR REPLACE PACKAGE COE_CONFIGURATION
AUTHID CURRENT_USER
AS
  PROCEDURE  setHTTPport (PORT_NUMBER number);
  PROCEDURE  setFTPport  (PORT_NUMBER number);
  FUNCTION   getDatabaseSummary return xmltype;
  PROCEDURE  folderDatabaseSummary;
END COE_CONFIGURATION;
/


CREATE OR REPLACE PACKAGE BODY COE_CONFIGURATION AS

ftp_xpath   VARCHAR2(256) := '/xdbconfig/sysconfig/protocolconfig/ftpconfig/ftp-port';
http_xpath  VARCHAR2(256) := '/xdbconfig/sysconfig/protocolconfig/httpconfig/http-port';

FUNCTION getDatabaseSummary
  RETURN XMLType
  AS
    summary XMLType;
    dummy XMLType;
BEGIN
  SELECT DBMS_XDB.cfg_get()
    INTO dummy
    FROM dual;

  SELECT xmlElement
         (
           "Database",
           XMLAttributes
           (
             x.NAME as "Name",
             extractValue(config,'/xdbconfig/sysconfig/protocolconfig/httpconfig/http-port') as "HTTP",
             extractValue(config,'/xdbconfig/sysconfig/protocolconfig/ftpconfig/ftp-port') as "FTP"
           ),
           xmlElement
           (
             "Services",
             (
               xmlForest(SERVICE_NAME as "ServiceName")
             )
           ),
           xmlElement
           (
             "NLS",
             (
               XMLForest(DB_CHARACTERSET as "DatabaseCharacterSet")
             )
           ),
           xmlElement
           (
             "Hosts",
             (
               XMLForest(HOST_NAME as "HostName")
             )
           ),
           xmlElement
           (
             "VersionInformation",
             ( XMLCONCAT
                      (
                        (select XMLAGG(XMLElement
                        (
                           "ProductVersion",
                           BANNER
                        )
                        )from V$VERSION),
                        (select XMLAGG(XMLElement
                        (
                           "ProductVersion",
                           BANNER
                        )
                        ) from ALL_REGISTRY_BANNERS)
                      )
             ) 
           )
         )
    INTO summary
    FROM SYS.DATABASE_SUMMARY x, (SELECT DBMS_XDB.cfg_get() config FROM dual);
  summary := XMLType(summary.getClobVal());
  RETURN summary;
END;

PROCEDURE folderDatabaseSummary
AS
   result BOOLEAN;
   targetResource VARCHAR2(256) := '/sys/databaseSummary.xml';

   xmlref REF XMLType;

BEGIN

   BEGIN
     DBMS_XDB.deleteResource(targetResource, DBMS_XDB.DELETE_FORCE);
   EXCEPTION
     WHEN OTHERS THEN
       NULL;
   END;

   SELECT make_ref(DATABASE_SUMMARY,'DATABASE_SUMMARY')
     INTO xmlref
     FROM DATABASE_SUMMARY;
   result := DBMS_XDB.createResource(targetResource, xmlref);
   DBMS_XDB.setAcl(targetResource, '/sys/acls/bootstrap_acl.xml');
END;

PROCEDURE setXDBport(port_xpath VARCHAR2, port_number NUMBER)
AS
   config XMLType;
BEGIN
   config := DBMS_XDB.cfg_get();
   SELECT updateXML(config, port_xpath, port_number)
     INTO config
     FROM DUAL;
   DBMS_XDB.cfg_update(config);
   COMMIT;
   DBMS_XDB.cfg_refresh();
END;
--
-- Create the setHTTPport and setFTPport procudures

PROCEDURE setHTTPport (port_number NUMBER)
AS
BEGIN
  setXDBport(HTTP_XPATH || '/text()', port_number);
END;

PROCEDURE setFTPport(port_number NUMBER)
AS
BEGIN
  setXDBport(FTP_XPATH || '/text()', port_number);
END;

END COE_CONFIGURATION;
/


CREATE OR REPLACE VIEW database_summary OF XMLType
WITH object id
(
'DATABASE_SUMMARY'
)
AS SELECT coe_configuration.getDatabaseSummary() FROM DUAL
/


ALTER PACKAGE COE_CONFIGURATION compile
/


ALTER VIEW database_summary COMPILE
/


GRANT SELECT ON database_summary TO PUBLIC
/

CREATE OR REPLACE TRIGGER no_dml_operations_allowed
INSTEAD OF INSERT OR UPDATE OR DELETE ON database_summary
BEGIN
 NULL;
END;
/


CREATE OR REPLACE PUBLIC SYNONYM COE_CONFIGURATION FOR COE_CONFIGURATION
/
GRANT EXECUTE ON COE_CONFIGURATION TO PUBLIC
/
CALL COE_CONFIGURATION.folderDatabaseSummary()
/
ALTER SESSION SET current_schema = SYS
/
