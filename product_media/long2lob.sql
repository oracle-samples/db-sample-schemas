Rem
Rem $Header: long2lob.sql 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem long2lob.sql
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
Rem      long2lob.sql - <one-line expansion of the name>
Rem
Rem    DESCRIPTION
Rem      <short description of component this file declares/defines>
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19/15 - added prompts for parameter 1
Rem    smtaylor    03/19/15 - added parameter 2, connect_string
Rem    smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem    ahunold     12/13/02 - ahunold_long2lob
Rem    ahunold     12/12/02 - Created
Rem

SET ECHO ON
SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100

SPOOL long2lob.log

PROMPT
PROMPT specify password for PM as parameter 1:
DEFINE pm_pass        = &1
PROMPT
PROMPT specify connect string as parameter 2:
DEFINE connect_string = &2
PROMPT

DEFINE ctl_file = __SUB__CWD__/product_media/long2lob.ctl
DEFINE dat_file = __SUB__CWD__/product_media/long2lob.dat
DEFINE log_file = __SUB__CWD__/log/longload.log

CONNECT pm/&pm_pass@&connect_string;

DROP TABLE long2lob;

CREATE TABLE long2lob
    ( product_id        NUMBER(6)
    , press_release     LONG
    );

CREATE UNIQUE INDEX long2lob_pk
    ON long2lob (product_id);

HOST sqlldr pm/&pm_pass -
  control=&ctl_file data=&dat_file log=&log_file

DESCRIBE long2lob
SELECT * FROM long2lob;

ALTER TABLE long2lob MODIFY ( press_release CLOB );

DESCRIBE long2lob
SELECT * FROM long2lob; 
