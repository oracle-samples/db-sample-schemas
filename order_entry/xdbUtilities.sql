Rem
Rem $Header: rdbms/demo/schema/order_entry/xdbUtilities.sql maravish_bug-3267690 2/1 2021/03/30 15:40:50 maravish Exp $
Rem
Rem xdbUtilities.sql
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
Rem      xdbUtilities.sql - Collection of stored objects to support xml db schema
Rem
Rem    DESCRIPTION
Rem      .
Rem
Rem    NOTES
Rem      XDB_UTILITES should be created as XDB
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    maravish    03/25/21 - Bug 32676902: Remove xmlroot
Rem    bhammers    01/24/11 - bug 11790062: rename XDB_ to COE_
Rem    cbauwens    09/23/04 - cbauwens_bug3031915
Rem    cbauwens    03/16/04 - Created


ALTER SESSION SET current_schema = XDB
/

CREATE OR REPLACE PACKAGE COE_namespaces
AS
    RESOURCE_NAMESPACE CONSTANT VARCHAR2(128) :=
      'http://xmlns.oracle.com/xdb/XDBResource.xsd';
    METADATA_NAMESPACE CONSTANT VARCHAR2(128) :=
      'http://xmlns.oracle.com/xdb/userMetaData';
    RESOURCE_PREFIX_R  CONSTANT VARCHAR2(128) :=
      'xmlns:r="'  || RESOURCE_NAMESPACE || '"';
    METADATA_PREFIX_M  CONSTANT VARCHAR2(128) :=
      'xmlns:m="'  || METADATA_NAMESPACE || '"';
END;
/
SELECT * FROM all_errors WHERE owner = 'XDB'
/
CREATE OR REPLACE PUBLIC SYNONYM COE_NAMESPACES FOR COE_NAMESPACES
/
GRANT EXECUTE ON COE_NAMESPACES TO PUBLIC
/
CREATE OR REPLACE PACKAGE COE_DOM_helper
AS
  FUNCTION boolean_to_varchar(input BOOLEAN) RETURN VARCHAR2 DETERMINISTIC;
  FUNCTION raw_to_varchar(input RAW) RETURN VARCHAR2 DETERMINISTIC;
  FUNCTION varchar_to_boolean(input VARCHAR2) RETURN BOOLEAN DETERMINISTIC;
  FUNCTION raw_to_boolean(input RAW) RETURN BOOLEAN DETERMINISTIC;
  FUNCTION boolean_to_raw(input BOOLEAN) RETURN RAW DETERMINISTIC;
  FUNCTION varchar_to_raw(input VARCHAR2) RETURN RAW DETERMINISTIC;
  FUNCTION getTextNodeValue(parent DBMS_XMLDOM.DOMELEMENT, child VARCHAR2) 
    RETURN VARCHAR2 DETERMINISTIC;
  FUNCTION getBooleanValue(parent DBMS_XMLDOM.DOMELEMENT, child VARCHAR2) 
    RETURN RAW DETERMINISTIC;
  FUNCTION appendElement(Parent XMLType, Child XMLType) 
    RETURN XMLType DETERMINISTIC;
END;
/


SELECT * FROM all_errors WHERE owner = 'XDB'
/
CREATE OR REPLACE PACKAGE BODY COE_DOM_helper
AS
FUNCTION raw_to_varchar(input RAW)
RETURN VARCHAR2 DETERMINISTIC
IS
BEGIN
  IF (input = hexToRaw('01')) THEN
    RETURN 'TRUE';
  END IF;
  IF (input = hexToRaw('00')) THEN
    RETURN 'FALSE';
  END IF;
  RETURN NULL;
END;

FUNCTION boolean_to_varchar(input BOOLEAN)
RETURN VARCHAR2 DETERMINISTIC
IS
BEGIN
  IF (input = TRUE) THEN
    RETURN 'TRUE';
  END IF;
  IF (input =FALSE) THEN
    RETURN 'FALSE';
  END IF;
  RETURN NULL;
END;

FUNCTION varchar_to_raw(input VARCHAR2)
RETURN RAW DETERMINISTIC
IS
BEGIN
  IF (upper(input) IN ('TRUE', 'Y', 'YES', '1')) THEN
    RETURN hexToRaw('01');
  END IF;
  IF (upper(input) IN ('FALSE', 'N', 'NO', '0')) THEN
    RETURN hexToRaw('00');
  END IF;
  RETURN NULL;
END;

FUNCTION boolean_to_raw(input BOOLEAN)
RETURN RAW DETERMINISTIC
IS
BEGIN
  IF (input = TRUE) THEN
    RETURN hexToRaw('01');
  END IF;
  IF (input = FALSE) THEN
    RETURN hexToRaw('00');
  END IF;
  RETURN NULL;
END;

FUNCTION varchar_to_boolean(input VARCHAR2)
RETURN BOOLEAN DETERMINISTIC
IS
BEGIN
  IF (upper(input) IN ('TRUE', 'Y', 'YES', '1')) THEN
    RETURN TRUE;
  END IF;
  IF (upper(input) IN ('FALSE', 'N', 'NO', '0')) THEN
    RETURN FALSE;
  END IF;
  RETURN NULL;
END;

FUNCTION raw_to_boolean(input RAW)
RETURN BOOLEAN DETERMINISTIC
IS
BEGIN
  IF (input = hexToRaw('01')) THEN
    RETURN TRUE;
  END IF;
  IF (input = hexToRaw('00')) THEN
    RETURN FALSE;
  END IF;
  RETURN NULL;
END;

FUNCTION getBooleanValue(parent DBMS_XMLDOM.DOMELEMENT, child VARCHAR2)
RETURN RAW DETERMINISTIC
AS
BEGIN
  RETURN varchar_to_raw(getTextNodeValue(parent, child));
END;

FUNCTION getTextNodeValue(parent DBMS_XMLDOM.DOMELEMENT, child VARCHAR2)
RETURN VARCHAR2 DETERMINISTIC
AS
  nodeList      DBMS_XMLDOM.DOMNODELIST;
  childNode     DBMS_XMLDOM.DOMNODE;
  value         VARCHAR2(2048) := NULL;
BEGIN
  nodeList := DBMS_XMLDOM.GETELEMENTSBYTAGNAME(parent, child);
  IF (DBMS_XMLDOM.getlength(nodeList) > 0) THEN
    childNode := DBMS_XMLDOM.ITEM(nodeList, 0);
    childNode := DBMS_XMLDOM.GETFIRSTCHILD(childNode);
    value     := DBMS_XMLDOM.GETNODEVALUE(childNode);
  END IF;
  RETURN value;
END;

FUNCTION appendElement(PARENT XMLType, Child XMLType)
RETURN XMLType DETERMINISTIC
IS
  PARENT_DOCUMENT    DBMS_XMLDOM.DOMDOCUMENT;
  PARENT_ROOTNODE    DBMS_XMLDOM.DOMNODE;

  CHILD_DOCUMENT     DBMS_XMLDOM.DOMDOCUMENT;
  CHILD_ROOTNODE     DBMS_XMLDOM.DOMNODE;
BEGIN
  PARENT_DOCUMENT := DBMS_XMLDOM.newDOMDocument(PARENT);
  PARENT_ROOTNODE := 
    DBMS_XMLDOM.makeNode(DBMS_XMLDOM.getDocumentElement(PARENT_DOCUMENT));

  CHILD_DOCUMENT  := DBMS_XMLDOM.newDOMDocument(CHILD);
  CHILD_ROOTNODE  := 
    DBMS_XMLDOM.makeNode(DBMS_XMLDOM.getDocumentElement(CHILD_DOCUMENT));

-- Comment out the following line if working with a pre 10g database...
  
  CHILD_ROOTNODE  := DBMS_XMLDOM.importNode(PARENT_DOCUMENT, CHILD_ROOTNODE, TRUE);
  PARENT_ROOTNODE := DBMS_XMLDOM.appendChild(PARENT_ROOTNODE, CHILD_ROOTNODE);
  RETURN PARENT;
END;

END;
/



SELECT * FROM all_errors WHERE owner = 'XDB'
/
CREATE OR REPLACE PUBLIC SYNONYM COE_DOM_HELPER FOR COE_DOM_HELPER
/
GRANT EXECUTE ON COE_DOM_HELPER TO PUBLIC
/
CREATE OR REPLACE PACKAGE COE_UTILITIES
AUTHID CURRENT_USER
AS
   FUNCTION getBinaryContent(file BFILE) RETURN BLOB;
   FUNCTION getBinaryContent(filename VARCHAR2, 
                             directoryName VARCHAR2 DEFAULT USER) 
     RETURN BLOB;
   FUNCTION getBinaryContent(file BFILE, tempBLOB IN OUT BLOB) RETURN BLOB;
   FUNCTION getBinaryContent(filename VARCHAR2, 
                             directoryName VARCHAR2 DEFAULT USER, 
                             tempBLOB IN OUT BLOB) 
     RETURN BLOB;

   FUNCTION getFileContent(file BFILE, charset VARCHAR2 DEFAULT 'WE8MSWIN1252') 
     RETURN CLOB;
   FUNCTION getFileContent(filename VARCHAR2, 
                           directoryName VARCHAR2 DEFAULT USER, 
                           charset VARCHAR2 DEFAULT 'WE8MSWIN1252') 
     RETURN CLOB;
   FUNCTION getFileContent(file BFILE, 
                           charset VARCHAR2 DEFAULT 'WE8MSWIN1252', 
                           tempCLOB IN OUT CLOB) 
     RETURN CLOB;
   FUNCTION getFileContent(filename VARCHAR2, 
                           directoryName VARCHAR2 DEFAULT USER, 
                           charset VARCHAR2 DEFAULT 'WE8MSWIN1252', 
                           tempCLOB IN OUT CLOB) 
     RETURN CLOB;

   PROCEDURE createHomeFolder(userName VARCHAR2);
   PROCEDURE createDirectoryTree(path VARCHAR2);
   PROCEDURE uploadFiles(file_list VARCHAR2 DEFAULT 'ls.xml', 
                         upload_directory_name VARCHAR2 DEFAULT USER, 
                         repository_folder_path VARCHAR2 DEFAULT '/public',
                         batch_size NUMBER DEFAULT 1);

   PROCEDURE put_xml(XML XMLType);
   
   PROCEDURE addUserMetaDataNode(OID VARCHAR2);
      
   PROCEDURE renameCollectionTable (xmltable VARCHAR2, 
                                    xpath VARCHAR2, 
                                    collection_table_name VARCHAR2);

END COE_UTILITIES;
/


SELECT * FROM all_errors WHERE owner = 'XDB'
/
CREATE OR REPLACE PACKAGE BODY COE_UTILITIES
AS
--
-- When using getFileContent(), the application must explicitly free
-- the CLOB that the function returns
--
FUNCTION getBinaryContent(file BFILE, tempBLOB IN OUT BLOB)
RETURN BLOB
IS
  targetFile      BFILE;

  dest_offset     NUMBER :=  1;
  src_offset      NUMBER := 1;
  lang_context    NUMBER := 0;
  conv_warning    NUMBER := 0;
  BEGIN
    targetFile := file;
    IF (tempBLOB IS NULL) THEN
      DBMS_LOB.createTemporary(tempBLOB, true, DBMS_LOB.SESSION);
    ELSE 
      DBMS_LOB.trim(tempBLOB, 0);
    END IF;
    DBMS_LOB.fileopen(targetFile, DBMS_LOB.file_readonly);
    DBMS_LOB.loadBlobfromFile(tempBLOB,
                              targetFile,
                              DBMS_LOB.getLength(targetFile),
                              dest_offset,
                              src_offset);
    DBMS_LOB.fileclose(targetFile);
    RETURN tempBLOB;
END;


FUNCTION getBinaryContent(file BFILE)
RETURN BLOB
IS
  tempBLOB BLOB := NULL;
BEGIN
  RETURN getBinaryContent(file, tempBLOB);
END;

FUNCTION getBinaryContent(filename VARCHAR2,
                          directoryName VARCHAR2 DEFAULT USER,
                          tempBLOB IN OUT BLOB)
RETURN BLOB
IS
   file            BFILE := bfilename(directoryName, filename);
BEGIN
  RETURN getBinaryContent(file, tempBLOB);
END;

FUNCTION getBinaryContent(filename VARCHAR2,
                          directoryName VARCHAR2 DEFAULT USER)		      
RETURN BLOB
IS
   tempBLOB BLOB := NULL;
BEGIN
  RETURN getBinaryContent(filename, directoryName, tempBLOB);
END;

FUNCTION getFileContent(file BFILE,
		        charset VARCHAR2 DEFAULT 'WE8MSWIN1252',
		        tempCLOB IN OUT CLOB)
RETURN CLOB
IS
  targetFile      BFILE;

  dest_offset     NUMBER :=  1;
  src_offset      NUMBER := 1;
  lang_context    NUMBER := 0;
  conv_warning    NUMBER := 0;
  BEGIN
    targetFile := file;
    IF (tempCLOB IS NULL) THEN
      DBMS_LOB.createTemporary(tempCLOB, true, DBMS_LOB.SESSION);
    ELSE 
      DBMS_LOB.trim(tempCLOB, 0);
    END IF;
    DBMS_LOB.fileopen(targetFile, DBMS_LOB.file_readonly);
    DBMS_LOB.loadClobfromFile(tempCLOB,
                              targetFile,
                              DBMS_LOB.getLength(targetFile),
                              dest_offset,
                              src_offset,
                              nls_charset_id(charset),
                              lang_context,
                              conv_warning);
    DBMS_LOB.fileclose(targetFile);
    RETURN tempCLOB;
END;

FUNCTION getFileContent(file BFILE,
		        charset VARCHAR2 DEFAULT 'WE8MSWIN1252')
RETURN CLOB
IS
  tempCLOB CLOB := NULL;
BEGIN
  RETURN getFileContent(file, charset, tempCLOB);
END;
--
-- When using getFileContent() the application must explicitly free
-- the CLOB that the function returns
--
FUNCTION getFileContent(filename VARCHAR2,
                        directoryName VARCHAR2 DEFAULT USER,
		        charset VARCHAR2 DEFAULT 'WE8MSWIN1252',
		        tempCLOB IN OUT CLOB)
RETURN CLOB
IS
   file            BFILE := bfilename(directoryName, filename);
BEGIN
  RETURN getFileContent(file, charset, tempCLOB);
END;

FUNCTION getFileContent(filename VARCHAR2,
                        directoryName VARCHAR2 DEFAULT USER,
		        charset VARCHAR2 DEFAULT 'WE8MSWIN1252')		      
RETURN CLOB
IS
   tempCLOB CLOB := NULL;
BEGIN
  RETURN getFileContent(filename, directoryName, charset, tempCLOB);
END;

PROCEDURE createHomeFolder(userName VARCHAR2)
AS
  targetResource VARCHAR2(256);
  realUserName VARCHAR2(64);
  result BOOLEAN;
BEGIN

  realUserName := upper(userName);
  targetResource := '/home';

  IF (NOT DBMS_XDB.existsResource(targetResource)) THEN
    result := DBMS_XDB.createFolder(targetResource);
    DBMS_XDB.setAcl(targetResource, '/sys/acls/bootstrap_acl.xml');
  END IF;

  targetResource := '/home/' || realUserName;

  IF (NOT DBMS_XDB.existsResource(targetResource)) THEN
    result := DBMS_XDB.createFolder(targetResource);
  END IF;
  
  DBMS_XDB.setAcl(targetResource, '/sys/acls/all_owner_acl.xml');

  UPDATE RESOURCE_VIEW
         SET res = updateXml(res, '/Resource/Owner/text()', realUserName)
  WHERE equals_path(res, targetResource) = 1;
 
END;
 
PROCEDURE createDirectoryTree(path VARCHAR2)
AS
  pathSeperator VARCHAR2(1) := '/';
  parentFolderPath VARCHAR2(256);
  result BOOLEAN;
  folderExists NUMBER(6):= 1;
BEGIN
  -- DBMS_OUTPUT.put_line('Processing ' || path);
  SELECT count(*)
  INTO folderExists
  FROM RESOURCE_VIEW
  WHERE equals_path(RES, path) = 1;
  -- DBMS_OUTPUT.put_line('FolderExists = ' || folderExists);
  IF (folderExists = 0) THEN
    parentFolderPath := substr(path, 1, instr(path, pathSeperator, -1) -1);
    -- DBMS_OUTPUT.put_line('FolderExists = ' || FolderExists);
    createDirectoryTree(parentFolderPath);
    result := DBMS_XDB.createFolder(path);
  END IF;
END;

PROCEDURE uploadFiles(file_list VARCHAR2 DEFAULT 'ls.xml',
                      upload_directory_name VARCHAR2 DEFAULT USER, 
                      repository_folder_path VARCHAR2 DEFAULT '/public', 
                      batch_size NUMBER DEFAULT 1)
AS
  pathSeperator VARCHAR2(1) := '/';

  directory_path      VARCHAR2(256);  

  subdirectory_path   VARCHAR2(256);
  target_folder_path  VARCHAR2(256);
  target_file_path    VARCHAR2(256);
  target_file_name    VARCHAR2(256);
  resource_path       VARCHAR2(256);
  last_folder_path    VARCHAR2(256) := ' ';
  
  sqlStatement        VARCHAR2(256);

  filelist_xml        XMLTYPE := XMLType(bfilename(upload_directory_name, 
                                                   file_list), 
                                         nls_charset_id('AL32UTF8'));
  content_xml         XMLType;

  result              BOOLEAN;

  filecount           BINARY_INTEGER := 0;

  filelist_DOM    DBMS_XMLDOM.DOMDOCUMENT;
  files_nl        DBMS_XMLDOM.DOMNODELIST;
  directory_nl    DBMS_XMLDOM.DOMNODELIST;
  filename_nl     DBMS_XMLDOM.DOMNODELIST;
  files_node      DBMS_XMLDOM.DOMNODE;
  directory_node  DBMS_XMLDOM.DOMNODE;
  file_node       DBMS_XMLDOM.DOMNODE;
  text_node       DBMS_XMLDOM.DOMNODE;
  encoding_attr   DBMS_XMLDOM.DOMATTR;
  replace_attr    DBMS_XMLDOM.DOMATTR;
  
  path            VARCHAR2(256);
  file_name       VARCHAR2(256);
  encoding_text   VARCHAR2(32);
  attr_value      VARCHAR2(256);
  replace_option  BOOLEAN;  
  replace_default BOOLEAN;
  
  debug_buffer    VARCHAR2(255);
BEGIN

  -- Create the set of Folders in the XDB Repository
  
  filelist_DOM := DBMS_XMLDOM.newDOMDocument(filelist_xml);

  directory_nl := DBMS_XMLDOM.GETELEMENTSBYTAGNAME(filelist_DOM, 'directory');
  FOR i IN 0 .. (DBMS_XMLDOM.GETLENGTH(directory_nl) - 1) LOOP
    directory_node := DBMS_XMLDOM.ITEM(directory_nl, i);
    text_node      := DBMS_XMLDOM.GETFIRSTCHILD(directory_node);
    directory_path := DBMS_XMLDOM.GETNODEVALUE(text_node);
    directory_path := repository_folder_path || directory_path;
    createDirectoryTree(directory_path);
    
  END LOOP;

  -- Find the Local File System Path to the target Directory.

  SELECT DIRECTORY_PATH 
    INTO directory_path
    FROM ALL_DIRECTORIES 
    WHERE DIRECTORY_NAME = upload_directory_name;  

  -- DBMS_OUTPUT.put_line('OS Root =  ' || directory_path);

  -- Load the Resources into the XML DB Repository

  files_nl           := DBMS_XMLDOM.GETELEMENTSBYTAGNAME(filelist_DOM, 'files');
  files_node         := DBMS_XMLDOM.ITEM(files_nl, 0);

  replace_default    := FALSE;
  replace_attr := DBMS_XMLDOM.getAttributeNode(DBMS_XMLDOM.MAKEELEMENT(files_node),
                                               'replace');
 
  IF NOT (DBMS_XMLDOM.ISNULL(replace_attr)) THEN 
    replace_default := 
      COE_dom_helper.varchar_to_boolean(DBMS_XMLDOM.getVALUE(replace_attr));
  END IF;
    
  filename_nl := DBMS_XMLDOM.GETELEMENTSBYTAGNAME(filelist_DOM, 'file');
  FOR i IN 0 .. (DBMS_XMLDOM.GETLENGTH(filename_nl) - 1) LOOP
    file_node          := DBMS_XMLDOM.ITEM(filename_nl, i);

    text_node          := DBMS_XMLDOM.GETFIRSTCHILD(file_node);
    target_file_path   := DBMS_XMLDOM.GETNODEVALUE(text_node);
    -- DBMS_OUTPUT.put_line('Source =  ' || target_file_path);
    target_file_name   := substr(target_file_path, 
                                 instr(target_file_path, pathSeperator, -1) +1);

    -- DBMS_OUTPUT.put_line('File =  ' || target_file_name);

    target_folder_path := substr(target_file_path, 1, 
                                 instr(target_file_path, pathSeperator, -1));
    target_folder_path := substr(target_folder_path, 
                                 instr(target_folder_path, pathSeperator));
    target_folder_path := substr(target_folder_path, 
                                 1, 
                                 length(target_folder_path)-1);
    
    encoding_attr := 
      DBMS_XMLDOM.getAttributeNode(DBMS_XMLDOM.MAKEELEMENT(file_node),
                                   'encoding');
    encoding_text      := 'AL32UTF8';
    IF NOT (DBMS_XMLDOM.ISNULL(encoding_attr)) THEN
      encoding_text    := DBMS_XMLDOM.getValue(encoding_attr);
      DBMS_OUTPUT.put_line('Encoding for ' || target_file_name || ' =  ' || 
                           encoding_text);  
    END IF;

    replace_attr := 
      DBMS_XMLDOM.getAttributeNode(DBMS_XMLDOM.MAKEELEMENT(file_node),
                                                 'Replace');
    replace_option     := replace_default;
    IF NOT (DBMS_XMLDOM.ISNULL(replace_attr)) THEN
      replace_option := 
        coe_dom_helper.varchar_to_boolean(DBMS_XMLDOM.getValue(replace_attr));
    END IF;
    
    IF (last_folder_path != target_folder_path) THEN
      subdirectory_path := directory_path || target_folder_path;
      -- DBMS_OUTPUT.put_line('Directory =  ' || subdirectory_path);
      sqlStatement := 
        'CREATE OR REPLACE DIRECTORY subdir AS ''' || subdirectory_path || '''';
      execute immediate sqlStatement;
      last_folder_path := target_folder_path;
    END IF;

    content_xml := XMLType(bfilename('SUBDIR', target_file_name),
                           nls_charset_id(encoding_text));
    resource_path := 
      repository_folder_path || target_folder_path || '/' || target_file_name;
    -- DBMS_OUTPUT.put_line('Target = ' || resource_path);
    
    IF (replace_option AND DBMS_XDB.existsResource(resource_path)) THEN
      DBMS_XDB.deleteResource(resource_path);
    END IF;
    
    result := DBMS_XDB.createResource(resource_path, content_xml);
    
    filecount := filecount + 1;
    
    IF (filecount = BATCH_SIZE) THEN
      filecount := 0;
      COMMIT;
    END IF;
  END LOOP;
END;

PROCEDURE put_xml(XML XMLType)
AS
  buffer CLOB;
  offset BINARY_INTEGER := 1;
  maxLength BINARY_INTEGER;
  endofLine BINARY_INTEGER := 1;
  linesize BINARY_INTEGER;
BEGIN
  buffer    := xml.getClobVal();
  maxLength := DBMS_LOB.getLength(buffer);
  endofline := DBMS_LOB.instr(buffer, chr(10), offset, 1);
  WHILE (endofLine > 0) LOOP 
     linesize  := endofline - offset;
     IF (linesize > 255) THEN
       DBMS_OUTPUT.put_line(DBMS_LOB.substr(buffer, 255, offset));
       offset := offset + 255;
     ELSE
       DBMS_OUTPUT.put_line(DBMS_LOB.substr(buffer, linesize, offset));
       offset := offset + linesize + 1;
     END IF;
     endofline := DBMS_LOB.instr(buffer, chr(10), offset, 1);
  END LOOP;
  linesize := maxLength - offset;
  DBMS_OUTPUT.put_line(DBMS_LOB.substr(buffer, linesize+1, offset));
END;

PROCEDURE addUserMetaDataNode(OID VARCHAR2)
AS
  metadata_xml XMLType := 
    XMLType('<m:UserMetaData ' || COE_NAMESPACES.METADATA_PREFIX_M || '/>'); 
BEGIN
  -- EXECUTE IMMEDIATE 'ALTER SESSION SET events=''19027 trace name context forever,level 4'' ';
  UPDATE /*+ NO_TRIGGER */ XDB.XDB$RESOURCE r
    SET r.xmldata.RESEXTRA = metadata_xml.getClobVal()
    WHERE sys_nc_oid$ = hextoraw(OID) 
     AND existsNode(OBJECT_VALUE,
                    '/r:Resource/r:Contents',
                    COE_NAMESPACES.RESOURCE_PREFIX_R)
         = 1
     AND existsNode(OBJECT_VALUE,
                    '/r:Resource/m:UserMetaData',
                    COE_NAMESPACES.RESOURCE_PREFIX_R || ' ' || 
                    COE_NAMESPACES.METADATA_PREFIX_M)
          = 0;
  -- EXECUTE IMMEDIATE 'ALTER SESSION SET events=''19027 trace name context forever,level 0'' ';
END;

PROCEDURE renameCollectionTable (xmltable VARCHAR2, 
                                 xpath VARCHAR2, 
                                 collection_table_name VARCHAR2)
AS
   system_generated_name VARCHAR2(256);
   rename_statement VARCHAR2(4000);
BEGIN
   
   SELECT TABLE_NAME
     INTO system_generated_name
     FROM ALL_NESTED_TABLES
     WHERE PARENT_TABLE_NAME = xmltable
       AND PARENT_TABLE_COLUMN = xpath
       AND OWNER = USER;
   
   rename_statement := 
     'ALTER TABLE ' || USER || '."' || system_generated_name || '" RENAME TO "' ||
     collection_table_name || '"';
   -- DBMS_OUTPUT.put_line(rename_statement);
   EXECUTE IMMEDIATE rename_statement;
   
   BEGIN
     SELECT INDEX_NAME
       INTO system_generated_name
       FROM ALL_INDEXES
       WHERE TABLE_NAME = collection_table_name
         AND INDEX_NAME LIKE 'SYS%IOT%'
         AND OWNER = USER;
        
     rename_statement := 
       'ALTER INDEX ' || USER || '."' || system_generated_name ||
       '" RENAME TO "' ||collection_table_name || '_DATA"';
     -- DBMS_OUTPUT.put_line(rename_statement);
     EXECUTE IMMEDIATE rename_statement;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
   END;

   BEGIN
     SELECT INDEX_NAME
       INTO system_generated_name
       FROM ALL_IND_COLUMNS 
       WHERE COLUMN_NAME = xpath
         AND TABLE_NAME =  xmltable
         AND TABLE_OWNER = USER;
   
     rename_statement := 
       'ALTER INDEX ' || USER || '."' || system_generated_name || 
       '" RENAME TO "' || collection_table_name || '_MEMBERS"';
     -- DBMS_OUTPUT.put_line(rename_statement);
     EXECUTE IMMEDIATE rename_statement;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
   END;
END;

END COE_UTILITIES;
/
 

SELECT * FROM ALL_ERRORS WHERE owner = 'XDB'
/
GRANT EXECUTE ON COE_UTILITIES TO PUBLIC
/
CREATE OR REPLACE PUBLIC SYNONYM COE_UTILITIES FOR COE_UTILITIES
/
--
-- Install the COE_TOOLS package
--
CREATE OR REPLACE PACKAGE COE_TOOLS
AUTHID DEFINER
AS
   PROCEDURE touchResource(path VARCHAR2);
   PROCEDURE releaseDAVLocks;
END COE_TOOLS;
/
 

SELECT * FROM ALL_ERRORS WHERE owner = 'XDB'
/
CREATE OR REPLACE PACKAGE BODY COE_TOOLS
AS
PROCEDURE touchResource(path VARCHAR2)
AS
BEGIN 
    UPDATE XDB$RESOURCE r
    SET r.XMLDATA.MODIFICATIONDATE = SYSTIMESTAMP
    WHERE ROWID = (SELECT ROWID FROM RESOURCE_VIEW 
                   WHERE equals_path(res, path) = 1);
END; 

PROCEDURE releaseDAVLocks
AS
BEGIN 
    DELETE FROM XDB$NLOCKS;
    UPDATE XDB.xdb$resource r 
    SET r.XMLDATA.LOCKS = NULL
    WHERE r.XMLDATA.LOCKS IS NOT NULL;
END; 

END COE_TOOLS;
/


SELECT * FROM ALL_ERRORS WHERE owner = 'XDB'
/
CREATE OR REPLACE PUBLIC SYNONYM COE_TOOLS FOR COE_TOOLS
/
GRANT EXECUTE ON COE_TOOLS TO PUBLIC
/
--
-- End xdbUtilities
--

