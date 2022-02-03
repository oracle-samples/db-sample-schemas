rem
rem Copyright (c) 2022 Oracle
rem
rem Permission is hereby granted, free of charge, to any person obtaining a
rem copy of this software and associated documentation files (the "Software"),
rem to deal in the Software without restriction, including without limitation
rem the rights to use, copy, modify, merge, publish, distribute, sublicense,
rem and/or sell copies of the Software, and to permit persons to whom the
rem Software is furnished to do so, subject to the following conditions:
rem
rem The above copyright notice and this permission notice shall be included in
rem all copies or substantial portions rem of the Software.
rem 
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
rem THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
rem FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
rem DEALINGS IN THE SOFTWARE.
rem 
rem NAME
rem   README.txt - ReadMe text file for HR schema
rem
rem DESCRIPTON
rem   HR (Human Resources) is a small sample schema resembling an HR department
rem
rem SCHEMA VERSION
rem   21
rem
rem RELEASE DATE
rem   03-FEB-2022
rem
rem SUPPORTED with DB VERSIONS
rem   19c and higher
rem 
rem MAJOR CHANGES IN THIS RELEASE
rem  1. all date data is updated
rem  2. updated phone numbers in US for globalization
rem  3. regions are updated
rem  4. countries are updated: replaced UK United Kingdom with GB 
rem     United Kingdom of Great Britain and Northern Ireland
rem  5. country_name column changed from varchar2(40) to varchar2(60) 
rem
rem SCHEMA DEPENDENCIES AND REQUIREMENTS
rem  Required access to hr_install.sql, hr_cre.sql, hr_popul.sql, hr_code.sql
rem 
rem INSTALL INSTRUCTIONS
rem   1. Run as privileged user with rights to create another user 
rem      (SYSTEM, ADMIN, etc.)
rem   2. Run the hr_install.sql script to create the HR (human resources) schema
rem   3. You are prompted for:
rem      a. password - enter an Oracle Database compliant password
rem      b. tablespace - if you do not enter a tablespace, the default 
rem         database tablespace is used
rem   Note: If the HR schema already exists, it is removed/dropped and 
rem         a fresh HR schema is installed
rem
rem UNINSTALL INSTRUCTIONS
rem   1. Run as privileged user with rights to create another user 
rem      (SYSTEM, ADMIN, etc.)
rem   2. Run the hr_uninstall.sql script to remove the HR (human resources) schema
rem
rem NOTES
rem   Scripts need to be run as a privileged user with rights to create
rem   another user (SYSTEM, ADMIN, etc.)
rem 
rem --------------------------------------------------------------------------
