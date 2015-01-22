Rem
Rem $Header: qs_cbadm.sql 29-aug-2002.11:59:43 hyeh Exp $
Rem
Rem qs_cbadm.sql
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
Rem      qs_cbadm.sql - Customer Billing Administration schema
Rem
Rem    DESCRIPTION
Rem      The QS_CBADM schema belongs to the Queued Shipping
Rem      (QS) schema group of the Oracle9i Sample Schemas
Rem
Rem    NOTES
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     02/26/01 - Merged ahunold_qs_filenames
Rem    ahunold     02/26/01 - Created
Rem

REM =======================================================
REM create queue tables and queues
REM =======================================================
BEGIN
  dbms_aqadm.create_queue_table(
        queue_table => 'QS_CBADM_orders_sqtab',
        comment =>
          'Customer Billing Single Consumer Orders queue table',
        queue_payload_type => 'QS_ADM.order_typ',
        compatible => '8.1');
  dbms_aqadm.create_queue_table(
        queue_table => 'QS_CBADM_orders_mqtab',
        comment =>
          'Customer Billing Multi Consumer Service queue table',
        multiple_consumers => TRUE,
        queue_payload_type => 'QS_ADM.order_typ',
        compatible => '8.1');
  dbms_aqadm.create_queue (
        queue_name              => 'QS_CBADM_shippedorders_q',
        queue_table             => 'QS_CBADM_orders_sqtab');

END;
/

REM =======================================================
REM Grant dequeue privilege on the shopoeped orders queue to the Customer Billing
Rem application.  The QS_CB application retrieves shipped orders (not billed yet)
Rem from the shopoeped orders queue.
BEGIN
  dbms_aqadm.grant_queue_privilege(
    'DEQUEUE',
    'QS_CBADM_shippedorders_q',
    'QS_CB',
    FALSE);
END;
/

BEGIN
  dbms_aqadm.create_queue (
        queue_name              => 'QS_CBADM_billedorders_q',
        queue_table             => 'QS_CBADM_orders_mqtab');
END;
/

REM =======================================================
REM Grant enqueue privilege on the billed orders queue to Customer Billing
Rem application.  The QS_CB application is allowed to put billed orders into
Rem this queue.
BEGIN
  dbms_aqadm.grant_queue_privilege(
    'ENQUEUE',
    'QS_CBADM_billedorders_q',
    'QS_CB',
    FALSE);
END;
/

DECLARE
  subscriber     sys.aq$_agent;
BEGIN
  /* Subscribe to the BILLING billed orders queue */
  subscriber := sys.aq$_agent(
    'BILLED_ORDER',
    'QS_CS.QS_CS_billedorders_que',
    null);
  dbms_aqadm.add_subscriber(
    queue_name => 'QS_CBADM.QS_CBADM_billedorders_q',
    subscriber => subscriber);
END;
/

COMMIT;
