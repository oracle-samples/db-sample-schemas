PROMPT Add constraints to tables

alter table customers add constraint customers_pk primary key (customer_id);

alter table customers add constraint customers_email_u unique (email_address);

alter table stores add constraint stores_pk primary key (store_id);

alter table stores add constraint store_name_u unique (store_name);

alter table stores add constraint store_at_least_one_address_c 
  check ( 
    web_address is not null or physical_address is not null
  );

alter table products add constraint products_pk primary key (product_id);

alter table products add constraint products_json_c
                     check ( product_details is json );

alter table orders add constraint orders_pk primary key (order_id);

alter table orders add constraint orders_customer_id_fk 
   foreign key (customer_id) references customers (customer_id);
                  
alter table orders add constraint  orders_status_c
                  check ( order_status in 
                    ( 'CANCELLED','COMPLETE','OPEN','PAID','REFUNDED','SHIPPED'));
                    
alter table orders add constraint orders_store_id_fk foreign key (store_id) 
   references stores (store_id);

alter table shipments add constraint shipments_pk primary key (shipment_id);

alter table shipments add constraint shipments_store_id_fk 
   foreign key (store_id) references stores (store_id);

alter table shipments add constraint shipments_customer_id_fk 
   foreign key (customer_id) references customers (customer_id);
                  
alter table shipments add constraint shipment_status_c
                  check ( shipment_status in 
                    ( 'CREATED', 'SHIPPED', 'IN-TRANSIT', 'DELIVERED'));

alter table order_items add constraint order_items_pk primary key ( order_id, line_item_id );

alter table order_items add constraint order_items_order_id_fk
   foreign key (order_id) references orders (order_id);

alter table order_items add constraint order_items_shipment_id_fk
   foreign key (shipment_id) references shipments (shipment_id);

alter table order_items add constraint order_items_product_id_fk
   foreign key (product_id) references products (product_id);
                             
alter table order_items add constraint order_items_product_u unique ( product_id, order_id );

alter table inventory add constraint inventory_pk primary key (inventory_id);

alter table inventory add constraint inventory_store_product_u unique (store_id, product_id);

alter table inventory add constraint inventory_store_id_fk 
   foreign key (store_id) references stores (store_id);

alter table inventory add constraint inventory_product_id_fk 
   foreign key (product_id) references products (product_id);