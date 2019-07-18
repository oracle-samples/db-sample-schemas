PROMPT Removing existing data 

truncate table order_items;
delete orders;
delete stores;
delete customers;
delete products;

PROMPT Inserting data

@@customers
@@products
@@stores
@@orders
@@order_items

commit;

PROMPT Resetting identity columns
@@co_set_identity_starts