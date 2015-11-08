Rem
Rem $Header: pm_p_lob.sql 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem pm_p_ini.sql
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
Rem      pm_p_ini.sql - Populate script 3/3: Print_Media table
Rem
Rem    DESCRIPTION
Rem      PM is the Product Media schema of the Oracle 9i Sample
Rem        Schemas
Rem
Rem    NOTES
Rem      The data file pm_p_lob.dat has been edited during the
Rem      installation process. If you want to run this script
Rem      in any location other than the one used by the
Rem      database Configuration Assistant, you will have to
Rem      edit pm_p_lob.dat in the directory used as parameter 4
Rem      Please note that directory names need the trailing de-
Rem      limiter
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19/15 - added parameter 5, connect_string
Rem    smtaylor    03/19/15 - added @&connect_string to sqlldr
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     04/27/01 - concat filename in SQL, not SQL*Loader
Rem    ahunold     04/10/01 - Added parameter 2,3,4
Rem    ahunold     03/29/01 - absolute pathnames
Rem    ahunold     04/03/01 - split pm_p_lob.ctl > ctl , dat
Rem    ahunold     02/09/01 - Merged ahunold_pm_load
Rem    ahunold     02/05/01 - Created
Rem

SET CONCAT '.'

DEFINE pm_pass        = &1
DEFINE pm_dat_path    = &2
DEFINE pm_log_path    = &3
DEFINE pm_wrk_path    = &4
DEFINE connect_string = &5

DEFINE ctl_file = &pm_dat_path.pm_p_lob.ctl
DEFINE dat_file = &pm_wrk_path.pm_p_lob.dat
DEFINE log_file = &pm_log_path.pm_p_lob.log

HOST sqlldr pm/&pm_pass@&connect_string -
  control=&ctl_file data=&dat_file log=&log_file

