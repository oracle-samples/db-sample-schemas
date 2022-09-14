Rem
Rem $Header: pm_analz.sql 29-aug-2002.11:48:12 hyeh Exp $
Rem
Rem pm_analz.sql
Rem
Rem Copyright (c) 2001, 2015, Oracle Corporation.  All rights reserved.
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
Rem      pm_analz.sql - Gathering statistics for HR schema
Rem
Rem    DESCRIPTION
Rem      Staistics are used by the cost based optimizer to
Rem      choose the best physical access strategy
Rem
Rem    NOTES
Rem      Results can be viewed in columns of DBA_TABLES,
Rem      DBA_TAB_COLUMNS and such
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    lorin       09/15/22 - remove spaces at end of lines
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     08/15/02 - whole schema
Rem    ahunold     03/07/01 - Merged ahunold_hr_analz
Rem    ahunold     03/07/01 - Created
Rem

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100

EXECUTE dbms_stats.gather_schema_stats( -
        'PM'                            ,       -
        granularity => 'ALL'            ,       -
        cascade => TRUE                 ,       -
        block_sample => TRUE            );

