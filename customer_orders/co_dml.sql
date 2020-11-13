PROMPT Removing existing data 

truncate table order_items;
truncate table inventory;
delete shipments;
delete orders;
delete stores;
delete customers;
delete products;

PROMPT Inserting data

@@customers
@@products
@@stores
@@orders
@@shipments
@@order_items
@@inventory

commit;

PROMPT Resetting identity columns
@@co_set_identity_starts