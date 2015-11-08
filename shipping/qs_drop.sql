Rem
Rem $Header: qs_drop.sql 2015/03/19 10:23:26 smtaylor Exp $
Rem
Rem qs_drop.sql
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
Rem      qs_drop.sql - Cleanup and drop all QS related schemas
Rem
Rem    DESCRIPTION
Rem      QS is the Queued Shipping schema of the Oracle 9i Sample
Rem        Schemas
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    smtaylor    03/19/15 - added @&connect_string to CONNECT
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     02/05/01 - Created
Rem

set echo on;
set serveroutput on;

CONNECT QS_ADM/&password_QS_ADM@&connect_string
execute dbms_aqadm.stop_queue(queue_name => 'QS.QS_neworders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS.QS_bookedorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS.logon_logoff');
execute dbms_aqadm.stop_queue(queue_name => 'QS_WS.QS_WS_bookedorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_WS.QS_WS_shippedorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_WS.QS_WS_backorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_ES.QS_ES_bookedorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_ES.QS_ES_shippedorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_ES.QS_ES_backorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_OS.QS_OS_bookedorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_OS.QS_OS_shippedorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_OS.QS_OS_backorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_CS.QS_CS_bookedorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_CS.QS_CS_backorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_CS.QS_CS_shippedorders_que');
execute dbms_aqadm.stop_queue(queue_name => 'QS_CS.QS_CS_billedorders_que');

Rem Drop queue tables, queues for QS
Rem
CONNECT QS/&password_QS@&connect_string
begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_neworders_que');
end;
/

begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_bookedorders_que');
end;
/

begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_orders_sqtab');
end;
/

Rem Create a priority queue table for QS
begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_orders_pr_mqtab');
end;
/

CONNECT QS/&password_QS@&connect_string

Rem
Rem   Drop the multiconsumer nonpersistent queue in QS schema
Rem   This queue is used by the conenction dispatcher to count
Rem   the number of user connections to the QS application

execute dbms_aqadm.drop_queue(queue_name => 'LOGON_LOGOFF');

Rem Drop queue tables, queues for QS_WS Shipping
CONNECT QS_WS/&password_QS_WS@&connect_string

Rem Booked orders are stored in the priority queue table
begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_WS_bookedorders_que');
end;
/

Rem Shipped orders and back orders are stored in the FIFO queue table
begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_WS_shippedorders_que');
end;
/

begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_WS_backorders_que');
end;
/

Rem Drop queue table for QS_WS shipping
begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_WS_orders_pr_mqtab');
end;
/

Rem Drop queue tables for QS_WS shipping
begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_WS_orders_mqtab');
end;
/

Rem Drop queue tables, queues for QS_ES Shipping
CONNECT QS_ES/&password_QS_ES@&connect_string

Rem Booked orders are stored in the priority queue table
begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_ES_bookedorders_que');
end;
/

Rem Shipped orders and back orders are stored in the FIFO queue table
begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_ES_shippedorders_que');
end;
/

begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_ES_backorders_que');
end;
/

Rem Drop queue table for QS_ES shipping
begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_ES_orders_mqtab');
end;
/

Rem Drop FIFO queue tables for QS_ES shipping
begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_ES_orders_pr_mqtab');
end;
/


Rem Drop queue tables, queues for Overseas Shipping
CONNECT QS_OS/&password_QS_OS@&connect_string


Rem Booked orders are stored in the priority queue table
begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_OS_bookedorders_que');
end;
/

Rem Shipped orders and back orders are stored in the FIFO queue table
begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_OS_shippedorders_que');
end;
/

begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_OS_backorders_que');
end;
/

Rem Create a priority queue table for QS_OS shipping
begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_OS_orders_pr_mqtab');
end;
/

Rem Create a FIFO queue tables for QS_OS shipping
begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_OS_orders_mqtab');
end;
/

Rem Create queue tables, queues for Customer Billing
CONNECT QS_CBADM/&password_QS_CBADM@&connect_string

begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_CBADM_shippedorders_q');

end;
/

begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_CBADM_billedorders_q');
end;
/

begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_CBADM_orders_sqtab', force => true);

dbms_aqadm.drop_queue_table(
        queue_table => 'QS_CBADM_orders_mqtab', force => true);

end;
/

CONNECT QS_CS/&password_QS_CS@&connect_string

DROP TABLE Order_Status_Table;

Rem Drop queue tables, queues for Customer Service

begin
dbms_aqadm.drop_queue (
        queue_name              => 'QS_CS_bookedorders_que');

dbms_aqadm.drop_queue (
        queue_name              => 'QS_CS_backorders_que');

dbms_aqadm.drop_queue (
        queue_name              => 'QS_CS_shippedorders_que');

dbms_aqadm.drop_queue (
        queue_name              => 'QS_CS_billedorders_que');

end;
/

begin
dbms_aqadm.drop_queue_table(
        queue_table => 'QS_CS_order_status_qt', force => true);
end;
/

CONNECT QS_ADM/&password_QS_ADM@&connect_string

Rem drop objects types 

drop type order_typ;
drop type orderitemlist_vartyp;
drop type orderitem_typ;
drop type customer_typ;


Rem drop queue admin account and individual accounts for each application
Rem
CONNECT system/&password_SYSTEM@&connect_string
set serveroutput on;
set echo on;

drop user QS_ADM cascade;
drop user QS cascade;
drop user QS_WS cascade;
drop user QS_ES cascade;
drop user QS_OS cascade;
drop user QS_CBADM cascade;
drop user QS_CB cascade;
drop user QS_CS cascade;

