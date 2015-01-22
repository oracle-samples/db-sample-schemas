Rem
Rem $Header: hr_dn_c.sql 29-aug-2002.11:44:05 hyeh Exp $
Rem
Rem hr_dn_c.sql
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
Rem      hr_dn_c.sql - Add DN column to HR.EMPLOYEES and DEPARTMENTS
Rem
Rem    DESCRIPTION
Rem      the DN (distinguished Name) column is used by OID.
Rem      This script adds the column to the HR schema. It is not
Rem      part of the default set of Sample Schemas, but shipped
Rem      as an extension script for demo purposes.
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     02/20/01 - Created
Rem    vpatabal    03/02/01 - Modified dn for employee 178 
Rem    ahunold     03/03/01 - employee 104, triggers

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET ECHO ON

DROP TRIGGER secure_employees;
DROP TRIGGER update_job_history;

ALTER TABLE departments
 ADD dn VARCHAR2(300);

COMMENT ON COLUMN departments.dn IS
'Distinguished name for each deparment.
e.g: "ou=Purchasing, o=IMC, c=US"';

ALTER TABLE employees
 ADD dn VARCHAR2(300);

COMMENT ON COLUMN employees.dn IS
'Distinguished name of the employee.
e.g. "cn=Lisa Ozer, ou=Sales, o=IMC, c=us"';

UPDATE departments SET
 dn='"ou=Administration, o=IMC, c=US"'
 WHERE department_id=10;

UPDATE departments SET
 dn='"ou=Mktg, o=IMC, c=US"'
 WHERE department_id=20;

UPDATE departments SET
 dn='"ou=Purchasing, o=IMC, c=US"'
 WHERE department_id=30;

UPDATE departments SET
 dn='"ou=HR, o=IMC, c=US"'
 WHERE department_id=40;

UPDATE departments SET
 dn='"ou=Shipping, o=IMC, c=US"'
 WHERE department_id=50;

UPDATE departments SET
 dn='"ou=IT, o=IMC, c=US"'
 WHERE department_id=60;

UPDATE departments SET
 dn='"ou=PR, o=IMC, c=US"'
 WHERE department_id=70;

UPDATE departments SET
 dn='"ou=Sales, o=IMC, c=US"'
 WHERE department_id=80;

UPDATE departments SET
 dn='"ou=Executive, o=IMC, c=US"'
 WHERE department_id=90;

UPDATE departments SET
 dn='"ou=Finance, ou=Fin-Accounting, o=IMC, c=US"'
 WHERE department_id=100;

UPDATE departments SET
 dn='"ou=Accounting, ou=Fin-Accounting, o=IMC, c=US"'
 WHERE department_id=110;

UPDATE departments SET
 dn='"ou=Treasury, ou=Fin-Accounting, ou=Europe, o=IMC, c=US"'
 WHERE department_id=120;

UPDATE departments SET
 dn='"ou=Corporate Tax, ou=Fin-Accounting, o=IMC, c=US"'
 WHERE department_id=130;

UPDATE departments SET
 dn='"ou=Control and Credit, ou=Fin-Accounting, o=IMC, c=US"'
 WHERE department_id=140;

UPDATE departments SET
 dn='"ou=Shareholder Services, ou=Fin-Accounting, ou=Europe, o=IMC, c=US"'
 WHERE department_id=150;

UPDATE departments SET
 dn='"ou=Benefits, o=IMC, c=US"'
 WHERE department_id=160;

UPDATE departments SET
 dn='"ou=Manufacturing, o=IMC, c=US"'
 WHERE department_id=170;

UPDATE departments SET
 dn='"ou=Construction, ou=Manufacturing, o=IMC, c=US"'
 WHERE department_id=180;

UPDATE departments SET
 dn='"ou=Contracting, ou = Manufacturing, o=IMC, c=US"'
 WHERE department_id=190;

UPDATE departments SET
 dn='"ou=Operations, ou=Manufacturing, ou=Americas, o=IMC, c=US"'
 WHERE department_id=200;

UPDATE departments SET
 dn='"ou=Field Support, ou=IT, ou=Americas, o=IMC, c=US"'
 WHERE department_id=210;

UPDATE departments SET
 dn='"ou=Network Operations Center, ou=IT, ou=Europe, o=IMC, c=US"'
 WHERE department_id=220;

UPDATE departments SET
 dn='"ou=Help Desk, ou=IT, ou=Europe, o=IMC, c=US"'
 WHERE department_id=230;

UPDATE departments SET
 dn='"ou=Government, ou=Sales, ou=Americas, o=IMC, c=US"'
 WHERE department_id=240;

UPDATE departments SET
 dn='"ou=Retail, ou=Sales, ou=Europe, o=IMC, c=US"'
 WHERE department_id=250;

UPDATE departments SET
 dn='"ou=Recruiting, ou=HR, ou=Europe, o=IMC, c=US"'
 WHERE department_id=260;

UPDATE departments SET
 dn='"ou=Payroll, ou=HR, ou=Europe, o=IMC, c=US"'
 WHERE department_id=270;

UPDATE employees SET
 dn='"cn=Steven King, ou=Executive, o=IMC, c=us"'
 WHERE employee_id=100;

UPDATE employees SET
 dn='"cn=Neena Kochhar, ou=Executive, o=IMC, c=us"'
 WHERE employee_id=101;

UPDATE employees SET
 dn='"cn=Lex De Haan, ou=Executive, o=IMC, c=us"'
 WHERE employee_id=102;

UPDATE employees SET
 dn='"cn=Alexander Hunold, ou=IT, o=IMC, c=us"'
 WHERE employee_id=103;

UPDATE employees SET
 dn='"cn=Bruce Ernst, ou=IT, o=IMC, c=us"'
 WHERE employee_id=104;

UPDATE employees SET
 dn='"cn=David Austin, ou=IT, o=IMC, c=us"'
 WHERE employee_id=105;

UPDATE employees SET
 dn='"cn=Valli Pataballa, ou=IT, o=IMC, c=us"'
 WHERE employee_id=106;

UPDATE employees SET
 dn='"cn=Diana Lorentz, ou=IT, o=IMC, c=us"'
 WHERE employee_id=107;

UPDATE employees SET
 dn='"cn=Nancy Greenberg, ou=Accounting, o=IMC, c=us"'
 WHERE employee_id=108;

UPDATE employees SET
 dn='"cn=Daniel Faviet, ou=Accounting, o=IMC, c=us"'
 WHERE employee_id=109;

UPDATE employees SET
 dn='"cn=John Chen, ou=Accounting, o=IMC, c=us"'
 WHERE employee_id=110;

UPDATE employees SET
 dn='"cn=Ismael Sciarra, ou=Accounting, o=IMC, c=us"'
 WHERE employee_id=111;

UPDATE employees SET
 dn='"cn=Jose Manuel Urman, ou=Accounting, o=IMC, c=us"'
 WHERE employee_id=112;

UPDATE employees SET
 dn='"cn=Luis Popp, ou=Accounting, o=IMC, c=us"'
 WHERE employee_id=113;

UPDATE employees SET
 dn='"cn=Den Raphaely, ou=Purchasing, o=IMC, c=us"'
 WHERE employee_id=114;

UPDATE employees SET
 dn='"cn=Alexander Khoo, ou=Purchasing, o=IMC, c=us"'
 WHERE employee_id=115;

UPDATE employees SET
 dn='"cn=Shelli Baida, ou=Purchasing, o=IMC, c=us"'
 WHERE employee_id=116;

UPDATE employees SET
 dn='"cn=Sigal Tobias, ou=Purchasing, o=IMC, c=us"'
 WHERE employee_id=117;

UPDATE employees SET
 dn='"cn=Guy Himuro, ou=Purchasing, o=IMC, c=us"'
 WHERE employee_id=118;

UPDATE employees SET
 dn='"cn=Karen Colmenares, ou=Purchasing, o=IMC, c=us"'
 WHERE employee_id=119;

UPDATE employees SET
 dn='"cn=Matthew Weiss, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=120;

UPDATE employees SET
 dn='"cn=Adam Fripp, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=121;

UPDATE employees SET
 dn='"cn=Payam Kaufling, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=122;

UPDATE employees SET
 dn='"cn=Shanta Vollman, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=123;

UPDATE employees SET
 dn='"cn=Kevin Mourgos, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=124;

UPDATE employees SET
 dn='"cn=Julia Nayer, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=125;

UPDATE employees SET
 dn='"cn=Irene Mikkilineni, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=126;

UPDATE employees SET
 dn='"cn=James Landry, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=127;

UPDATE employees SET
 dn='"cn=Steven Markle, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=128;

UPDATE employees SET
 dn='"cn=Laura Bissot, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=129;

UPDATE employees SET
 dn='"cn=Mozhe Atkinson, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=130;

UPDATE employees SET
 dn='"cn=James Marlow, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=131;

UPDATE employees SET
 dn='"cn=TJ Olson, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=132;

UPDATE employees SET
 dn='"cn=Jason Mallin, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=133;

UPDATE employees SET
 dn='"cn=Michael Rogers, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=134;

UPDATE employees SET
 dn='"cn=Ki Gee, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=135;

UPDATE employees SET
 dn='"cn=Hazel Philtanker, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=136;

UPDATE employees SET
 dn='"cn=Renske Ladwig, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=137;

UPDATE employees SET
 dn='"cn=Stephen Stiles, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=138;

UPDATE employees SET
 dn='"cn=John Seo, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=139;

UPDATE employees SET
 dn='"cn=Joshua Patel, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=140;

UPDATE employees SET
 dn='"cn=Trenna Rajs, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=141;

UPDATE employees SET
 dn='"cn=Curtis Davies, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=142;

UPDATE employees SET
 dn='"cn=Randall Matos, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=143;

UPDATE employees SET
 dn='"cn=Peter Vargas, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=144;

UPDATE employees SET
 dn='"cn=John Russell, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=145;

UPDATE employees SET
 dn='"cn=Karen Partners, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=146;

UPDATE employees SET
 dn='"cn=Alberto Errazuriz, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=147;

UPDATE employees SET
 dn='"cn=Gerald Cambrault, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=148;

UPDATE employees SET
 dn='"cn=Eleni Zlotkey, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=149;

UPDATE employees SET
 dn='"cn=Peter Tucker, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=150;

UPDATE employees SET
 dn='"cn=David Bernstein, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=151;

UPDATE employees SET
 dn='"cn=Peter Hall, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=152;

UPDATE employees SET
 dn='"cn=Christopher Olsen, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=153;

UPDATE employees SET
 dn='"cn=Nanette Cambrault, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=154;

UPDATE employees SET
 dn='"cn=Oliver Tuvault, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=155;

UPDATE employees SET
 dn='"cn=Janette King, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=156;

UPDATE employees SET
 dn='"cn=Patrick Sully, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=157;

UPDATE employees SET
 dn='"cn=Allan McEwen, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=158;

UPDATE employees SET
 dn='"cn=Lindsey Smith, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=159;

UPDATE employees SET
 dn='"cn=Louise Doran, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=160;

UPDATE employees SET
 dn='"cn=Sarath Sewall, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=161;

UPDATE employees SET
 dn='"cn=Clara Vishney, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=162;

UPDATE employees SET
 dn='"cn=Danielle Greene, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=163;

UPDATE employees SET
 dn='"cn=Mattea Marvins, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=164;

UPDATE employees SET
 dn='"cn=David Lee, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=165;

UPDATE employees SET
 dn='"cn=Sundar Ande, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=166;

UPDATE employees SET
 dn='"cn=Amit Banda, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=167;

UPDATE employees SET
 dn='"cn=Lisa Ozer, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=168;

UPDATE employees SET
 dn='"cn=Harrison Bloom, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=169;

UPDATE employees SET
 dn='"cn=Taylor Fox, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=170;

UPDATE employees SET
 dn='"cn=William Smith, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=171;

UPDATE employees SET
 dn='"cn=Elizabeth Bates, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=172;

UPDATE employees SET
 dn='"cn=Sundita Kumar, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=173;

UPDATE employees SET
 dn='"cn=Ellen Abel, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=174;

UPDATE employees SET
 dn='"cn=Alyssa Hutton, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=175;

UPDATE employees SET
 dn='"cn=Jonathod Taylor, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=176;

UPDATE employees SET
 dn='"cn=Jack Livingston, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=177;

UPDATE employees SET
 dn='"cn=Kimberely Grant, ou= , o=IMC, c=us"'
 WHERE employee_id=178;

UPDATE employees SET
 dn='"cn=Charles Johnson, ou=Sales, o=IMC, c=us"'
 WHERE employee_id=179;

UPDATE employees SET
 dn='"cn=Winston Taylor, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=180;

UPDATE employees SET
 dn='"cn=Jean Fleaur, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=181;

UPDATE employees SET
 dn='"cn=Martha Sullivan, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=182;

UPDATE employees SET
 dn='"cn=Girard Geoni, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=183;

UPDATE employees SET
 dn='"cn=Nandita Sarchand, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=184;

UPDATE employees SET
 dn='"cn=Alexis Bull, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=185;

UPDATE employees SET
 dn='"cn=Julia Dellinger, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=186;

UPDATE employees SET
 dn='"cn=Anthony Cabrio, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=187;

UPDATE employees SET
 dn='"cn=Kelly Chung, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=188;

UPDATE employees SET
 dn='"cn=Jennifer Dilly, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=189;

UPDATE employees SET
 dn='"cn=Timothy Gates, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=190;

UPDATE employees SET
 dn='"cn=Randall Perkins, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=191;

UPDATE employees SET
 dn='"cn=Sarah Bell, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=192;

UPDATE employees SET
 dn='"cn=Britney Everett, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=193;

UPDATE employees SET
 dn='"cn=Samuel McCain, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=194;

UPDATE employees SET
 dn='"cn=Vance Jones, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=195;

UPDATE employees SET
 dn='"cn=Alana Walsh, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=196;

UPDATE employees SET
 dn='"cn=Kevin Feeney, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=197;

UPDATE employees SET
 dn='"cn=Donald OConnell, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=198;

UPDATE employees SET
 dn='"cn=Douglas Grant, ou=Shipping, o=IMC, c=us"'
 WHERE employee_id=199;

UPDATE employees SET
 dn='"cn=Jennifer Whalen, ou=Administration, o=IMC, c=us"'
 WHERE employee_id=200;

UPDATE employees SET
 dn='"cn=Michael Hartstein, ou=Mktg, o=IMC, c=us"'
 WHERE employee_id=201;

UPDATE employees SET
 dn='"cn=Brajesh Goyal, ou=Mktg, o=IMC, c=us"'
 WHERE employee_id=202;

UPDATE employees SET
 dn='"cn=Susan Marvis, ou=HR, o=IMC, c=us"'
 WHERE employee_id=203;

UPDATE employees SET
 dn='"cn=Hermann Baer, ou=PR, o=IMC, c=us"'
 WHERE employee_id=204;

UPDATE employees SET
 dn='"cn=Shelley Higgens, ou=Accounting, o=IMC, c=us"'
 WHERE employee_id=205;

UPDATE employees SET
 dn='"cn=William Gietz, ou=Accounting, o=IMC, c=us"'
 WHERE employee_id=206;

REM **************************************************************************

REM procedure and statement trigger to allow dmls during business hours:
CREATE OR REPLACE PROCEDURE secure_dml
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205, 
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;
/

CREATE OR REPLACE TRIGGER secure_employees
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/

Rem Recreating the triggers dropped above

REM **************************************************************************
REM procedure to add a row to the JOB_HISTORY table and row trigger 
REM to call the procedure when data is updated in the job_id or 
REM department_id columns in the EMPLOYEES table:

CREATE OR REPLACE PROCEDURE add_job_history
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type 
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date, 
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;
/

CREATE OR REPLACE TRIGGER update_job_history
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate, 
                  :old.job_id, :old.department_id);
END;
/

COMMIT;
