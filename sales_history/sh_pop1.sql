Rem
Rem $Header: sh_pop1.sql 29-aug-2002.11:56:58 hyeh Exp $
Rem
Rem sh_pop1.sql
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
Rem      sh_pop1.sql - Populates the countries and channel table 
Rem
Rem    DESCRIPTION
Rem      SH is the Sales History schema of the Oracle 9i Sample
Rem	   Schemas
Rem
Rem    NOTES
Rem      
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    hyeh       08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    hbaer      01/29/01 - Created
Rem

INSERT INTO countries VALUES('US','United States of America'
                                 ,'Northern America','Americas');
INSERT INTO countries VALUES('DE','Germany'
                                 ,'Western Europe',  'Europe');
INSERT INTO countries VALUES('UK','United Kingdom'
                                 ,'Western Europe',  'Europe');    
INSERT INTO countries VALUES('NL','The Netherlands'
                                 ,'Western Europe',  'Europe');       
INSERT INTO countries VALUES('IE','Ireland'
                                 ,'Western Europe',  'Europe');           
INSERT INTO countries VALUES('DK','Denmark'
                                 ,'Western Europe',  'Europe');           
INSERT INTO countries VALUES('FR','France'
                                 ,'Western Europe',  'Europe');            
INSERT INTO countries VALUES('ES','Spain'
                                 ,'Western Europe',  'Europe');             
INSERT INTO countries VALUES('TR','Turkey'
                                 ,'Western Europe',  'Europe');           
INSERT INTO countries VALUES('PL','Poland'
                                 ,'Eastern Europe',  'Europe');            
INSERT INTO countries VALUES('BR','Brazil'
                                 ,'Southern America','Americas');        
INSERT INTO countries VALUES('AR','Argentina'
                                 ,'Southern America','Americas');     
INSERT INTO countries VALUES('MY','Malaysia'
                                 ,'Asia',            'Asia');                      
INSERT INTO countries VALUES('JP','Japan'
                                 ,'Asia',            'Asia');                         
INSERT INTO countries VALUES('IN','India'
                                 ,'Asia',            'Asia');                         
INSERT INTO countries VALUES('AU','Australia'
                                 ,'Australia',       'Oceania');           
INSERT INTO countries VALUES('NZ','New Zealand'
                                 ,'Australia',       'Oceania');
INSERT INTO countries VALUES('ZA','South Africa'
                                 ,'Africa',  'Africa');           
INSERT INTO countries VALUES('SA','Saudi Arabia'
                                 ,'Middle East',  'Middle East');           

INSERT INTO channels VALUES('S','Direct Sales'  ,'Direct'  );
INSERT INTO channels VALUES('T','Tele Sales'    ,'Direct'  );
INSERT INTO channels VALUES('C','Catalog'       ,'Indirect');
INSERT INTO channels VALUES('I','Internet'      ,'Indirect');
INSERT INTO channels VALUES('P','Partners'      ,'Others'  );

COMMIT;



