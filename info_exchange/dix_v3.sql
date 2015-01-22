Rem
Rem $Header: dix_v3.sql 29-aug-2002.11:44:20 hyeh Exp $
Rem
Rem dix_v3.sql
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
Rem      dix_v3.sql - Drop IX objects
Rem
Rem    DESCRIPTION
Rem      .
Rem
Rem    NOTES
Rem      Assumes connection as user IX
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     07/31/02 - Created
Rem

REM =======================================================
REM cleanup section - Remove subscribers
REM =======================================================

execute dbms_aqadm.remove_subscriber ( -
	  queue_name => 'orders_queue', -
	  subscriber => sys.aq$_agent('SHIPPING',null,null)-
);

execute dbms_aqadm.remove_subscriber ( -
	  queue_name => 'orders_queue', -
	  subscriber => sys.aq$_agent('BILLING',null,null)-
);

execute dbms_aqadm.remove_subscriber ( -
	  queue_name => 'orders_queue', -
	  subscriber => sys.aq$_agent('RUSH_ORDER',null,null)-
);


REM =======================================================
REM cleanup section - drop queues
REM =======================================================
BEGIN
  dbms_aqadm.stop_queue(queue_name => 'orders_queue');
  dbms_aqadm.drop_queue (
        queue_name              => 'orders_queue');
  dbms_aqadm.drop_queue_table (
        queue_table => 'orders_queuetable');
END;
/

REM =======================================================
REM cleanup section - delete message type
REM =======================================================

DROP TYPE order_message_typ;

COMMIT;

