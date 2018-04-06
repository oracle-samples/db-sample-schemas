Rem
Rem $Header: pm_cre.sql 2018/02/28 15:43:13 jorgerod Exp $
Rem
Rem pm_cre.sql
Rem
Rem Copyright (c) 2001, 2018, Oracle Corporation.  All rights reserved.  
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
Rem      pm_cre.sql - Table creation scripts
Rem
Rem    DESCRIPTION
Rem      PM is the Product Media schema of the Oracle 9i Sample
Rem        Schemas
Rem
Rem    NOTES
Rem      The OIDs assigned for the object types are used to 
Rem      simplify the setup of Replication demos and are not needed
Rem      in most unreplicated environments.
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem      jorgerod  02/13/18 - Remove online_media table
Rem                           Ordim desupported in 19c
Rem      ahunold   12/13/02 - removing LONG column PRESS_RELEASE
Rem      hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
Rem      ahunold   04/25/01 - OID
Rem      ahunold   02/09/01 - new load method
Rem      ahunold   02/05/01 - Created
Rem 

REM ====================================================================
REM Create TYPE adheader_typ to hold different headers used in
REM advertisements, the header name, date of creation, header text, and
REM logo used. pm.print_media ad_header column has type adheader_typ.

CREATE TYPE adheader_typ 
  OID '82A4AF6A4CCE656DE034080020E0EE3D'
  AS OBJECT
    ( header_name        VARCHAR2(256)
    , creation_date      DATE
    , header_text        VARCHAR2(1024)
    , logo               BLOB
    );
/

REM =======================================================================
REM Create TYPE textdoc_tab as a nested table for
REM advertisements stored in different formats. Document type can be pdf,
REM html,Word,Frame, ...
REM pm.print_media ad_textdocs_ntab column has type textdoc_tab.

CREATE TYPE textdoc_typ
  OID '82A4AF6A4CCF656DE034080020E0EE3D'
  AS OBJECT
    ( document_typ      VARCHAR2(32)
    , formatted_doc     BLOB
    ) ;
/
CREATE TYPE textdoc_tab
  OID '82A4AF6A4CD0656DE034080020E0EE3D'
  AS TABLE OF textdoc_typ;
/

REM ========================================================================
REM Create table print_media to hold print advertising information.
REM pm.print_media has a foreign key on product_id that references the
REM oe.product_information table. pm.print_media has a primary key on
REM ad_id and product. pm.print_media references a nested table, ad_textdoc_ntab, and
REM column object of type adheader_typ.
REM ========================================================================
REM NOTE: Earlier releases of the Sample Schemas contained a LONG column
REM ***** press_release in this table.
REM       For LONG column data and demo, please use long2lob.sql
REM ========================================================================

CREATE TABLE print_media
    ( product_id        NUMBER(6)
    , ad_id             NUMBER(6)
    , ad_composite      BLOB
    , ad_sourcetext     CLOB
    , ad_finaltext      CLOB
    , ad_fltextn        NCLOB
    , ad_textdocs_ntab  textdoc_tab
    , ad_photo          BLOB
    , ad_graphic        BFILE
    , ad_header         adheader_typ
    ) NESTED TABLE ad_textdocs_ntab STORE AS textdocs_nestedtab;

CREATE UNIQUE INDEX printmedia_pk
    ON print_media (product_id, ad_id);

ALTER TABLE print_media
ADD ( CONSTRAINT printmedia__pk
      PRIMARY KEY (product_id, ad_id)
    , CONSTRAINT printmedia_fk
                 FOREIGN KEY (product_id)
                 REFERENCES oe.product_information(product_id)
    ) ;

COMMIT;
