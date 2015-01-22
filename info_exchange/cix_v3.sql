Rem
Rem $Header: cix_v3.sql 29-aug-2002.11:44:16 hyeh Exp $
Rem
Rem cix_v3.sql
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
Rem      cix_v3.sql - Create IX schema objects
Rem
Rem    DESCRIPTION
Rem	 Script specific to version 9.2
Rem
Rem    NOTES
Rem      assumes active connection as user IX
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem      hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
Rem      meyoung   07/31/02 - Created
Rem

REM =======================================================
REM Creates the order_event_type. Users using this type would
REM need execute privilege on this type
REM =======================================================

CREATE OR REPLACE TYPE order_event_typ AS OBJECT (
	order_id 	NUMBER(12),
	product_id  	NUMBER(6),
	customer_id	NUMBER(6),
	cust_first_name	VARCHAR2(20),
	cust_last_name	VARCHAR2(20),
	order_status  	NUMBER(2),
	delivery_date	DATE
);
/	

REM =======================================================
REM Create queue tables, queues for IX
REM =======================================================

EXECUTE dbms_aqadm.create_queue_table(		 -
        queue_table => 'orders_queuetable', -
        comment => 'Orders queue table',	-
	multiple_consumers => true, -
        queue_payload_type => 'order_event_typ',-
	primary_instance => 1,-
        secondary_instance => 2);

REM =======================================================
REM Create Orders Queue 
REM =======================================================

BEGIN
dbms_aqadm.create_queue (
        queue_name              => 'orders_queue',
        queue_table             => 'orders_queuetable');
END;
/

REM =======================================================
REM Start Orders Queue
REM =======================================================

BEGIN
  dbms_aqadm.start_queue (
        queue_name              => 'orders_queue');
END;
/

REM =======================================================
REM Create TYPE ANY Queue for Streams
REM =======================================================

EXECUTE DBMS_STREAMS_ADM.SET_UP_QUEUE();
