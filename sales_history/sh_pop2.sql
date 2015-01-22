Rem
Rem $Header: sh_pop2.sql 29-aug-2002.11:56:59 hyeh Exp $
Rem
Rem sh_pop2.sql
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
Rem      sh_pop2.sql - Populates the times table 
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

DECLARE
   curdate DATE := TO_DATE('01-jan-1998','dd-mon-yyyy');
   weekend DATE default NULL;
BEGIN
   dbms_session.set_nls('NLS_TERRITORY','GERMANY');
   -- necessary for week/day_of_week synchronisation
   dbms_session.set_nls('NLS_DATE_LANGUAGE','AMERICAN');
   -- necessary for week/day_of_week synchronisation
   WHILE curdate < TO_DATE('01-jan-2002','dd-mon-yyyy') LOOP

   SELECT curdate+DECODE(TO_CHAR(curdate, 'DAY'),'MONDAY   ', 6
                                                ,'TUESDAY  ', 5
                                                ,'WEDNESDAY', 4
                                                ,'THURSDAY ', 3
                                                ,'FRIDAY   ', 2
                                                ,'SATURDAY ', 1
                                                ,'SUNDAY   ', 0
                        )
   INTO   weekend
   FROM   dual;
   INSERT INTO times VALUES (
	-- current date, midnight
        curdate,
	-- day name, REPEATING
        INITCAP(TO_CHAR(curdate, 'DAY')),
	-- day number in week, week starts MONDAY, REPEATING
        TO_NUMBER(TO_CHAR(curdate,'D')),
        -- day number in month, REPEATING
        TO_NUMBER(TO_CHAR(curdate,'DD')),
	-- ISO calendar week number, week starts MONDAY, REPEATING
        TO_NUMBER(TO_CHAR(curdate, 'IW')),
	-- ISO fiscal week number, week starts MONDAY, REPEATING
        TO_NUMBER(TO_CHAR(weekend, 'IW')),
	-- calculation of week ending day date, CONTINOUS
	weekend,
	-- calendar month number in year, REPEATING
        TO_NUMBER(TO_CHAR(curdate, 'MM')),
	-- fiscal month number in fiscal year, REPEATING
        TO_NUMBER(TO_CHAR(weekend, 'MM')),
	-- calendar month desc, CONTINOUS
        TO_CHAR(curdate,'YYYY')||'-'||TO_CHAR(curdate, 'MM'),
	-- fiscal month desc, CONTINOUS
        TO_CHAR(weekend,'YYYY')||'-'||TO_CHAR(weekend, 'MM'),
        999,
        999,
        TO_DATE('01-JAN-1860','DD-MON-YYYY'),
        TO_DATE('01-JAN-1860','DD-MON-YYYY'),
	-- calendar_month name, REPEATING
        INITCAP(TO_CHAR(curdate, 'MONTH')),
	-- fiscal_month name, REPEATING
        INITCAP(TO_CHAR(weekend, 'MONTH')),
	-- calendar quarter description, CONTINOUS
        TO_CHAR(curdate, 'YYYY')||'-Q'||TO_CHAR(curdate, 'Q'),
	-- fiscal quarter description calculation, CONTINOUS
        TO_CHAR(weekend, 'YYYY')||'-Q'||TO_CHAR(weekend, 'Q'),
        999,
        999,
        TO_DATE('01-JAN-1860','DD-MON-YYYY'),
        TO_DATE('01-JAN-1860','DD-MON-YYYY'),
	-- calendar quarter number, REPEATING
        TO_NUMBER(TO_CHAR(curdate, 'Q')),
	-- fiscal quarter number, REPEATING
        TO_NUMBER(TO_CHAR(weekend, 'Q')),
	-- calendar year, CONTINOUS
        TO_NUMBER(TO_CHAR(curdate, 'YYYY')),
	-- fiscal year, CONTINOUS
        TO_NUMBER(TO_CHAR(weekend, 'YYYY')),
        999,
        999,
        TO_DATE('01-JAN-1860','DD-MON-YYYY'),
        TO_DATE('01-JAN-1860','DD-MON-YYYY')
	);
        curdate := curdate + 1;
   END LOOP;
   UPDATE times SET FISCAL_WEEK_NUMBER=1
   WHERE FISCAL_WEEK_NUMBER IN (52,53) AND TO_CHAR(WEEK_ENDING_DAY,'MM')='01';

   UPDATE times a SET days_in_cal_month =
   (SELECT COUNT(*) FROM times b 
                    WHERE a.calendar_month_desc = b.calendar_month_desc 
                    GROUP BY calendar_month_desc);

   UPDATE times a SET days_in_fis_month =
   (SELECT COUNT(*) FROM times b 
                    WHERE a.fiscal_month_desc = b.fiscal_month_desc 
                    GROUP BY fiscal_month_desc);

   UPDATE times a SET days_in_cal_quarter =
   (SELECT COUNT(*) FROM times b 
                    WHERE a.calendar_quarter_desc = b.calendar_quarter_desc 
                    GROUP BY calendar_quarter_desc);

   UPDATE times a SET days_in_fis_quarter =
   (SELECT COUNT(*) FROM times b 
                    WHERE a.fiscal_quarter_desc = b.fiscal_quarter_desc 
                    GROUP BY fiscal_quarter_desc);

   UPDATE times a SET days_in_cal_year =
   (SELECT COUNT(*) FROM times b 
                    WHERE a.calendar_year = b.calendar_year 
                    GROUP BY calendar_year);

   UPDATE times a SET days_in_fis_year =
   (SELECT COUNT(*) FROM times b 
                    WHERE a.fiscal_year = b.fiscal_year 
                    GROUP BY fiscal_year);

   UPDATE times a SET end_of_cal_month = (SELECT max_time FROM (
     SELECT DISTINCT calendar_month_desc, MAX(time_id) AS max_time FROM times
     GROUP BY calendar_month_desc) b WHERE a.calendar_month_desc=b.calendar_month_desc);

   UPDATE times a SET end_of_fis_month = (SELECT max_time FROM (
     SELECT DISTINCT fiscal_month_desc, MAX(time_id) AS max_time FROM times
     GROUP BY fiscal_month_desc) b WHERE a.fiscal_month_desc=b.fiscal_month_desc);

   UPDATE times a SET end_of_cal_quarter = (SELECT max_time FROM (
     SELECT DISTINCT calendar_quarter_desc, MAX(time_id) AS max_time FROM times
     GROUP BY calendar_quarter_desc) b WHERE a.calendar_quarter_desc=b.calendar_quarter_desc);

   UPDATE times a SET end_of_fis_quarter = (SELECT max_time FROM (
     SELECT DISTINCT fiscal_quarter_desc, MAX(time_id) AS max_time FROM times
     GROUP BY fiscal_quarter_desc) b WHERE a.fiscal_quarter_desc=b.fiscal_quarter_desc);

   UPDATE times a SET end_of_cal_year = (SELECT max_time FROM (
     SELECT DISTINCT calendar_year, MAX(time_id) AS max_time FROM times
     GROUP BY calendar_year) b WHERE a.calendar_year=b.calendar_year);

   UPDATE times a SET end_of_fis_year = (SELECT max_time FROM (
     SELECT DISTINCT fiscal_year, MAX(time_id) AS max_time FROM times
     GROUP BY fiscal_year) b WHERE a.fiscal_year=b.fiscal_year);

   COMMIT;
 END;
/







