PROMPT Dropping views
drop view customer_order_products;
drop view product_orders;
drop view product_reviews;
drop view store_orders;

PROMPT Dropping tables
drop table order_items
  cascade constraints;
drop table orders
  cascade constraints;
drop table products
  cascade constraints;
drop table stores
  cascade constraints;
drop table customers
  cascade constraints;
drop table inventory
  cascade constraints;
drop table shipments
  cascade constraints;