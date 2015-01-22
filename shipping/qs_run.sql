Rem
Rem $Header: qs_run.sql 29-aug-2002.11:59:51 hyeh Exp $
Rem
Rem qs_run.sql
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
Rem      qs_run.sql - Create the application
Rem
Rem    DESCRIPTION
Rem      QS is the Queued Shipping schema of the Oracle 9i Sample
Rem        Schemas
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     02/05/01 - Created
Rem

CREATE OR REPLACE TYPE simpleorder_typ AS OBJECT (
        orderno        	NUMBER,
	status		VARCHAR2(30),
	ordertype	VARCHAR2(30),
	orderregion	VARCHAR2(30),
	paymentmethod	VARCHAR2(30),
	total		NUMBER);
/


CREATE OR REPLACE PACKAGE QS_Applications AS 
    -- this procedure is called from the java front end to enqueue
    -- new orders 
    PROCEDURE new_order_enq(simpleOrder IN simpleorder_typ,
			    customer    IN customer_typ,
			    items       IN orderitemlist_vartyp);

    PROCEDURE get_ship_notification(
                     orderid IN number,
                     status  OUT number,
                     tracking_id OUT varchar2);			

    -- move new orders from qs_neworders_que to qs_bookedorders_que.
    -- sets the shipping region
    PROCEDURE qs_move_orders;

    -- Each shipping region calls this shipping_app by providing the 
    -- name of the consumer as an IN Parameter. This application movQS_ES 
    -- the messages from bookedorder queuQS_ES to either shippedorder queue
    -- or backedorder queue based on the inventory information
    PROCEDURE shipping_app( consumer IN VARCHAR2);


    -- Move shipped orders from the shipped order queue to the billed
    -- order queue in the billing area
    PROCEDURE billing_app;

    PROCEDURE new_order_driver(QS_OStart IN NUMBER, QS_OStop IN NUMBER);

END QS_Applications;
/
show errors


CREATE OR REPLACE PACKAGE BODY QS_Applications AS

PROCEDURE new_order_enq(simpleOrder IN simpleorder_typ,
				    customer IN customer_typ,
				    items IN orderitemlist_vartyp) IS 

    qs_enq_order_data        qs_adm.order_typ;
    enqopt                   dbms_aq.enqueue_options_t;
    msgprop                  dbms_aq.message_properties_t;
    enq_msgid                raw(16);
    itemlist		     orderitemlist_vartyp;
    item		     orderitem_typ;

BEGIN

    -- form the book items object from items

    msgprop.correlation := simpleOrder.ordertype;

    qs_enq_order_data := qs_adm.order_typ(
				simpleOrder.orderno,
				simpleOrder.status,
				simpleOrder.ordertype,
				simpleOrder.orderregion,
				customer,
				simpleOrder.paymentmethod,
				itemlist, simpleOrder.total);

    -- put the shipping priority into the message property 
    -- before enqueuing the message.
    if (simpleOrder.ordertype = 'RUSH') then
	msgprop.priority := 1;
    else
	msgprop.priority := 2;
    end if;


    dbms_aq.enqueue('qs.qs_neworders_que', enqopt, msgprop,
		    qs_enq_order_data, enq_msgid);

--    dbms_output.put_line('One order enqueued successfully');
    commit;


END new_order_enq;

PROCEDURE get_ship_notification(
                     orderid IN number,
                     status  OUT number,
                     tracking_id OUT varchar2) IS
   deqopt           dbms_aq.dequeue_options_t;
   mprop            dbms_aq.message_properties_t;
   deq_msgid        RAW(16);
   msg_data         RAW(80);
   no_messages      exception;
   pragma exception_init (no_messages, -25228);

BEGIN
   status := 0;
   
   deqopt.navigation := dbms_aq.FIRST_messAGE;
   deqopt.wait := 10;
   deqopt.correlation := to_char(orderid);
   deqopt.consumer_name := 'ORDER_ENTRY';

   
   BEGIN
     dbms_aq.dequeue(
                queue_name => 'qs.qs_notification_que',
                dequeue_options => deqopt,
                message_properties => mprop,
                payload => msg_data,
                msgid => deq_msgid);
     status := 1; 
     tracking_id := rawtohex(deq_msgid);
     commit;
   EXCEPTION
     WHEN no_messages THEN
        status := 0;
     WHEN OTHERS THEN
        RAISE;
   END;   

END get_ship_notification;


PROCEDURE qs_move_orders IS 

    new_orders	 	     BOOLEAN := TRUE;
    dopt                     dbms_aq.dequeue_options_t;
    enqopt                   dbms_aq.enqueue_options_t;
    mprop                    dbms_aq.message_properties_t;
    qs_deq_order_data        qs_adm.order_typ;
    deq_msgid                RAW(16);
    no_messages              exception;
    pragma exception_init    (no_messages, -25228);

begin

    --dopt.wait := DBMS_AQ.NO_WAIT;
    dopt.navigation := dbms_aq.FIRST_messAGE;

    --while (new_orders) LOOP
    LOOP
	BEGIN
	    dbms_aq.dequeue(
		queue_name => 'qs.qs_neworders_que',
		dequeue_options => dopt,
		message_properties => mprop,
		payload => qs_deq_order_data,
		msgid => deq_msgid);

	    -- assign the shipping region
	    if (qs_deq_order_data.customer.country NOT IN ('USA', 'US')) then
--dbms_output.put_line('International shipment ... ');
		qs_deq_order_data.orderregion := 'INTERNATIONAL';
	    else
		if (qs_deq_order_data.customer.state IN ('TX', 'Texas',
						    'CA', 'California',
						    'NV', 'Nevada')) then

		    qs_deq_order_data.orderregion := 'WESTERN';
--dbms_output.put_line('western shipment');
		else
		    qs_deq_order_data.orderregion := 'EASTERN';
--dbms_output.put_line('eastern shipment');
		end if;
--		dbms_output.put_line('Dequeuing a message ...');
--		dbms_output.put_line('Region is ' || qs_deq_order_data.orderregion);
	    end if;


            -- change the order status to booked
            qs_deq_order_data.status := 'BOOKED';

	    -- enqueue into booked orders queue
	    dbms_aq.enqueue(
		queue_name => 'qs.qs_bookedorders_que',
		enqueue_options => enqopt,
		message_properties => mprop,
		payload => qs_deq_order_data,
		msgid => deq_msgid);

	    commit;

    --        dopt.navigation := dbms_aq.NEXT_messAGE;
	EXCEPTION
            WHEN no_messages THEN
                 new_orders := FALSE;
	END;
    END LOOP;


END qs_move_orders;

PROCEDURE billing_app IS
    new_orders               BOOLEAN := TRUE;
    dopt                     dbms_aq.dequeue_options_t;
    enqopt                   dbms_aq.enqueue_options_t;
    mprop                    dbms_aq.message_properties_t;
    deq_order_data        qs_adm.order_typ;
    deq_msgid                RAW(16);
    no_messages              exception;
    pragma exception_init    (no_messages, -25228);

begin

    --dopt.wait := DBMS_AQ.NO_WAIT;
    dopt.navigation := dbms_aq.FIRST_messAGE;
    dopt.consumer_name := 'CUSTOMER_BILLING';

    --while (new_orders) LOOP
    LOOP
        BEGIN
            dbms_aq.dequeue(
                queue_name => 'QS_CBADM.QS_CBADM_shippedorders_que',
                dequeue_options => dopt,
                message_properties => mprop,
                payload => deq_order_data,
                msgid => deq_msgid);


            -- change the order status to billed
            deq_order_data.status := 'BILLED';


            -- enqueue into booked orders queue
            dbms_aq.enqueue(
                queue_name => 'QS_CBADM.QS_CBADM_billedorders_que',
                enqueue_options => enqopt,
                message_properties => mprop,
                payload => deq_order_data,
                msgid => deq_msgid);

            commit;

    --        dopt.navigation := dbms_aq.NEXT_messAGE;
        EXCEPTION
            WHEN no_messages THEN
                 new_orders := FALSE;
        END;
    END LOOP;

END billing_app;



PROCEDURE shipping_app( consumer IN VARCHAR2) IS

    deq_msgid                RAW(16);
    dopt                     dbms_aq.dequeue_options_t;
    enqopt                   dbms_aq.enqueue_options_t;
    mprop                    dbms_aq.message_properties_t;
    deq_order_data           qs_adm.order_typ;
    qname                    varchar2(30);
    shipqname                varchar2(30);
    bookqname                varchar2(30);
    backqname                varchar2(30);
    notqname                 varchar2(30);
    no_messages              exception;
    pragma exception_init    (no_messages, -25228);
    new_orders 		     BOOLEAN := TRUE;
    is_backed 		     BOOLEAN := FALSE;
    is_avail		     int;
    region                   varchar2(30);
    notify                   BOOLEAN := FALSE;
    not_enqopt               dbms_aq.enqueue_options_t;
    not_mprop                dbms_aq.message_properties_t;
    not_msg_data             RAW(80);
    not_msgid                RAW(16);
    ship_orderno             number;

begin


    dopt.consumer_name := consumer;
    --dopt.wait := DBMS_AQ.NO_WAIT;
    dopt.navigation := dbms_aq.FIRST_messAGE;

    IF (consumer = 'West_Shipping') THEN
	    qname     := 'QS_WS.QS_WS_bookedorders_que';
	    shipqname := 'QS_WS.QS_WS_shippedorders_que';
	    backqname := 'QS_WS.QS_WS_backorders_que';
            notqname  := 'QS_WS.QS_WS_notification_que';
            region := 'WESTERN';
            notify := TRUE;
    ELSIF (consumer = 'East_Shipping') THEN
	    qname     := 'QS_ES.QS_ES_bookedorders_que';
	    shipqname := 'QS_ES.QS_ES_shippedorders_que';
	    backqname := 'QS_ES.QS_ES_backorders_que';
            notqname  := 'QS_ES.QS_ES_notification_que';
            region := 'EASTERN';
            notify := TRUE;
    ELSE
	    qname     := 'QS_OS.QS_OS_bookedorders_que';
	    shipqname := 'QS_OS.QS_OS_shippedorders_que';
	    backqname := 'QS_OS.QS_OS_backorders_que';
            region := 'INTERNATIONAL';
    END IF;

    --WHILE (new_orders) LOOP
    LOOP
	BEGIN 
            is_backed := FALSE;
	    dbms_aq.dequeue(
		queue_name => qname,
		dequeue_options => dopt,
		message_properties => mprop,
		payload => deq_order_data,
		msgid => deq_msgid);

            ship_orderno := deq_order_data.orderno;
            IF (notify = TRUE) THEN

              not_mprop.correlation := TO_CHAR(ship_orderno);
              not_msg_data := hextoraw(to_char(ship_orderno));
  	      dbms_aq.enqueue(
  		 queue_name => notqname,
  		 enqueue_options => not_enqopt,
  		 message_properties => not_mprop,
  		 payload => not_msg_data,
  		 msgid => not_msgid);

            END IF;

            deq_order_data.orderregion := region;

	    -- check if all books in an order are availabe 

	    if (is_backed = FALSE) then
		-- change the status of the order to SHIPPED order
		deq_order_data.status := 'SHIPPED';
		dbms_aq.enqueue(
		    queue_name => shipqname,
		    enqueue_options => enqopt,
		    message_properties => mprop,
		    payload => deq_order_data,
		    msgid => deq_msgid);
	    end if;

	    commit;
	EXCEPTION
	    WHEN no_messages THEN
		new_orders := FALSE; 
	END;
    END LOOP;
END shipping_app;

PROCEDURE new_order_driver(QS_OStart IN NUMBER, QS_OStop IN NUMBER) IS 
    neworder                 simpleorder_typ;
    customer                 customer_typ;
    item                     orderitem_typ;
    items		     orderitemlist_vartyp;
    itc                      number;
    iid                      number;
    iprice                   number;
    iquantity                number;
    ordertype                varchar2(30);
    order_date               date;
    custno                   number;
    custid                   number;
    custname                 varchar2(100);
    cstreet                   varchar2(100);
    ccity                     varchar2(30);
    cstate                    varchar2(2);
    czip                      number;
    ccountry                  varchar2(100); 
    
BEGIN

    for i in QS_OStart .. QS_OStop loop

        if ((i MOD 20) = 0) THEN
          ordertype := 'RUSH';
        ELSE
          ordertype := 'NORMAL';
        end if;

--        neworder.paymentmethod := 'MASTERCARD';
        
        select to_char(sysdate) into order_date from sys.dual;

        custid := i MOD 10;

        select cust_first_name, c.cust_address.street_address, c.cust_address.city, c.cust_address.state_province, c.cust_address.postal_code, c.cust_address.country_id into
               custname, cstreet, ccity, cstate,
               czip, ccountry
        from oe.customers c where customer_id = custid;

	select product_id, list_price into iid, iprice from oe.product_information where product_id = i;

	item := orderitem_typ (1, 1, iprice, iid, iprice);
	items(1) := item;
	customer := Customer_typ(custid, custname, cstreet, ccity, cstate,
                    czip, ccountry);
	neworder := simpleorder_typ(i, NULL, ordertype, NULL, 'MASTERCARD', iprice);
        new_order_enq(neworder, customer, items);
        dbms_output.put_line('order processed' || neworder.orderno);

	dbms_lock.sleep(10 - (i MOD 10));
    end loop;
END new_order_driver;


END QS_Applications;
/
show errors

grant execute on QS_Applications to qs;
grant execute on QS_Applications to QS_WS;
grant execute on QS_Applications to QS_ES;
grant execute on QS_Applications to QS_OS;
grant execute on QS_Applications to QS_CB;
grant execute on QS_Applications to QS_CBADM;
