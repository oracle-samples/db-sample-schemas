rem
rem Copyright (c) 2023 Oracle
rem
rem Permission is hereby granted, free of charge, to any person obtaining a
rem copy of this software and associated documentation files (the "Software"),
rem to deal in the Software without restriction, including without limitation
rem the rights to use, copy, modify, merge, publish, distribute, sublicense,
rem and/or sell copies of the Software, and to permit persons to whom the
rem Software is furnished to do so, subject to the following conditions:
rem
rem The above copyright notice and this permission notice shall be included in
rem all copies or substantial portions rem of the Software.
rem
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
rem THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
rem OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
rem SOFTWARE.
rem
rem NAME
rem   sh_populate.sql - populates the SH (Sales History) tables with data
rem
rem DESCRIPTON
rem   This script populates the SH tables with rows of data
rem
rem SCHEMA VERSION
rem   21
rem
rem RELEASE DATE
rem   06-DEC-2022
rem
rem SUPPORTED with DB VERSIONS
rem   19c and higher
rem
rem MAJOR CHANGES IN THIS RELEASE
rem   new scripts for SH installation
rem
rem SCHEMA DEPENDENCIES AND REQUIREMENTS
rem   This script is called from the sh_install.sql script
rem
rem INSTALL INSTRUCTIONS
rem    Run the sh_install.sql script to call this script
rem
rem NOTES
rem 
rem
rem --------------------------------------------------------------------------

SET VERIFY OFF
SET DEFINE OFF
ALTER SESSION SET NLS_LANGUAGE=American;

rem *************************** Disabling table constraints

Prompt ******  Disabling table constraints for the load

ALTER TABLE sales
   MODIFY CONSTRAINT sales_promo_fk DISABLE NOVALIDATE;
ALTER TABLE sales
   MODIFY CONSTRAINT sales_customer_fk DISABLE NOVALIDATE;
ALTER TABLE sales
   MODIFY CONSTRAINT sales_product_fk DISABLE NOVALIDATE;
ALTER TABLE sales
   MODIFY CONSTRAINT sales_time_fk DISABLE NOVALIDATE;
ALTER TABLE sales
   MODIFY CONSTRAINT sales_channel_fk DISABLE NOVALIDATE;

ALTER TABLE customers
   MODIFY CONSTRAINT customers_country_fk DISABLE NOVALIDATE;

ALTER TABLE costs
   MODIFY CONSTRAINT costs_product_fk DISABLE NOVALIDATE;
ALTER TABLE costs
   MODIFY CONSTRAINT costs_time_fk DISABLE NOVALIDATE;
ALTER TABLE costs
   MODIFY CONSTRAINT costs_channel_fk DISABLE NOVALIDATE;
ALTER TABLE costs
   MODIFY CONSTRAINT costs_promo_fk DISABLE NOVALIDATE;

ALTER TABLE times
   MODIFY CONSTRAINT times_pk DISABLE NOVALIDATE;

ALTER TABLE channels
   MODIFY CONSTRAINT channels_pk DISABLE NOVALIDATE;

ALTER TABLE countries
   MODIFY CONSTRAINT countries_pk DISABLE NOVALIDATE;
   
ALTER TABLE promotions
   MODIFY CONSTRAINT promo_pk DISABLE NOVALIDATE;

ALTER TABLE products
   MODIFY CONSTRAINT products_pk DISABLE NOVALIDATE;

ALTER TABLE customers
   MODIFY CONSTRAINT customers_pk DISABLE NOVALIDATE;

rem *************************** insert data into the CHANNELS table

Prompt ******  Populating CHANNELS table ....

BEGIN
   INSERT INTO channels VALUES
      ( 3, 'Direct Sales', 'Direct',   12, 'Channel total', 1 );
   INSERT INTO channels VALUES
      ( 9, 'Tele Sales',   'Direct',   12, 'Channel total', 1 );
   INSERT INTO channels VALUES
      ( 5, 'Catalog',      'Indirect', 13, 'Channel total', 1 );
   INSERT INTO channels VALUES
      ( 4, 'Internet',     'Indirect', 13, 'Channel total', 1 );
   INSERT INTO channels VALUES
      ( 2, 'Partners',     'Others',   14, 'Channel total', 1 );
END;
/


rem *************************** insert data into the COUNTRIES table

Prompt ******  Populating COUNTIRES table ....

BEGIN
   INSERT INTO countries VALUES
      (52790, 'US', 'United States of America', 'Northern America', 52797, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52776, 'DE', 'Germany',        'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52789, 'GB', 'United Kingdom', 'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52784, 'NL', 'Netherlands',    'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52780, 'IE', 'Ireland',        'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52777, 'DK', 'Denmark',        'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52779, 'FR', 'France',         'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52778, 'ES', 'Spain',          'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52788, 'TR', 'Turkey',         'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52786, 'PL', 'Poland',         'Eastern Europe', 52795, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52775, 'BR', 'Brazil',         'Southern America', 52798, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52773, 'AR', 'Argentina',      'Southern America', 52798, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52783, 'MY', 'Malaysia',       'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52782, 'JP', 'Japan',          'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52781, 'IN', 'India',          'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52774, 'AU', 'Australia',      'Australia', 52794, 'Oceania', 52805, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52785, 'NZ', 'New Zealand',    'Australia', 52794, 'Oceania', 52805, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52791, 'ZA', 'South Africa',   'Africa', 52792, 'Africa', 52800, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52787, 'SA', 'Saudi Arabia',   'Middle East', 52796, 'Middle East', 52804, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52772, 'CA', 'Canada',         'Northern America', 52797, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52771, 'CN', 'China',          'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52769, 'SG', 'Singapore',      'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52770, 'IT', 'Italy',          'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52792, 'MX', 'Mexico',         'Northern America', 52797, 'Americas', 52801, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52793, 'SE', 'Sweden',         'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52794, 'CH', 'Switzerland',    'Western Europe', 52799, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52795, 'CL', 'Chile',          'Southern America', 52798, 'Americas', 52798, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52796, 'TH', 'Thailand',       'Asia', 52793, 'Asia', 52802, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52797, 'NG', 'Nigeria',        'Africa', 52792, 'Africa', 52800, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52798, 'EG', 'Egypt',          'Middle East', 52796, 'Middle East', 52804, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52799, 'ZW', 'Zimbabwe',       'Africa', 52792, 'Africa', 52800, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52800, 'KW', 'Kuwait',         'Middle East', 52796, 'Middle East', 52804, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52801, 'IL', 'Israel',         'Middle East', 52796, 'Middle East', 52804, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52802, 'RO', 'Romania',        'Eastern Europe', 52795, 'Europe', 52803, 'World total', 52806 );
   INSERT INTO countries VALUES
      (52803, 'HU', 'Hungary',        'Eastern Europe', 52795, 'Europe', 52803, 'World total', 52806 );
END;
/

rem *************************** insert data into the PRODUCTS table

Prompt ******  Populating PRODUCTS table ....

BEGIN
   INSERT INTO products VALUES 
      (14,      'Pitching Machine and Batting Cage Combo', 'Pitching Machine and Batting Cage Combo', 'Training Aids and Equipment', 
       2035,    'Training Aids and Equipment', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 999.99, 999.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (21,      'Speed Trainer Bats and Training Program', 'Speed Trainer Bats and Training Program', 'Training Aids and Equipment', 
       2035,    'Training Aids and Equipment', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 899.99, 899.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (22,      'MLB Official Game Baseball w/ Display Case', 'MLB Official Game Baseball w/ Display Case', 'Baseballs', 
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 24.99, 24.99,
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (46,      '2 Competition Grade NFHS Baseballs', '2 Competition Grade NFHS Baseballs', 'Baseballs', 
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 22.99, 22.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (47,      '6 Gallon Empty Ball Bucket', '6 Gallon Empty Ball Bucket', 'Baseballs', 
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 28.99, 28.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (127,     'Genuine Series MIX Wood Bat', 'Genuine Series MIX Wood Bat', 'Bats', 
       2036,    'Bats', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 36.99, 36.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (128,     'Slugger Youth Series Maple Bat', 'Slugger Youth Series Maple Bat', 'Bats', 
       2036,    'Bats', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 27.99, 27.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (129,     'Pro Maple Bat', 'Pro Maple Bat', 'Bats', 
       2036,    'Bats', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 192.99, 192.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (130,     'Pro Maple Youth Bat', 'Pro Maple Youth Bat', 'Bats', 
       2036,    'Bats', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 89.99, 89.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (19,      'Cricket Bat Bag', 'Cricket bat bag', 'Cricket Bat', 
       2051,    'Cricket Bat', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 55.99, 55.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (23,      'Plastic Cricket Bat', 'Plastic - Beach Cricket Bat', 'Cricket Bat', 
       2051,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 21.99, 21.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (28,      'English Willow Cricket Bat', 'English Willow Cricket Bat', 'Cricket Bat', 
       2051,    'Cricket Bat', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 199.99, 199.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (30,      'Linseed Oil', 'Cricket Bat - Linseed Oil', 'Cricket Bat', 
       2051,    'Cricket Bat', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 9.99, 9.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (31,      'Fiber Tape', 'Cricket Bat - Fiber Tape', 'Cricket Bat', 
       2051,    'Cricket Bat', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 8.99, 8.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (40,      'Team shirt', 'West Indies Team', 'Cricket Fan Gear', 
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (41,      'Team shirt', 'South African Team', 'Cricket Fan Gear', 
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (42,      'Team shirt', 'New Zealand Cricket Team', 'Cricket Fan Gear', 
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (43,      'Team shirt', 'Australian Cricket Team', 'Cricket Fan Gear', 
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (44,      'Team shirt', 'Indian Cricket Team', 'Cricket Fan Gear', 
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (45,      'Team shirt', 'English Cricket Team', 'Cricket Fan Gear', 
       2054,    'Cricket Fan Gear', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (48,      'Indoor Cricket Ball', 'Indoor Cricket Ball', 'Cricket', 
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 11.99, 11.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (113,     'Cricket Ballz', 'Cricket Ball - Leather', 'Cricket', 
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 22.99, 22.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (114,     'Cricket Ball - Training Ball', 'Cricket Ball - Training', 'Cricket', 
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 18.99, 18.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (115,     'Plastic - Beach Cricket Ball', 'Plastic - Beach Cricket Ball', 'Cricket', 
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 8.99, 8.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (116,     'Cricket Wickets', 'Cricket Wickets', 'Cricket', 
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 11.99, 11.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (117,     'Plastic - Beach Cricket Wickets', 'Plastic - Beach Cricket Wickets', 'Cricket', 
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 8.99, 8.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (118,     'Cricket Bails', 'Cricket Bails', 'Cricket', 
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 7.99, 7.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (119,     'Cricket Bails - Junior', 'Cricket Bails - Junior', 'Cricket', 
       2055,    'Cricket', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 6.99, 6.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (120,     'Cricket Peak Cap', 'Cricket Peak Cap', 'Cricket Clothing', 
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 6.99, 6.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (121,     'Cricket - Athletic Guard Cup', 'Cricket - Athletic Guard Cup', 'Cricket Clothing', 
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 10.99, 10.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (122,     'Wide Brim Hat', 'Cricket Wide Brim Hat', 'Cricket Clothing', 
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 18.99, 18.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (123,     'Helmet', 'Cricket Helmet', 'Cricket Clothing', 
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 49.99, 49.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (124,     'Wicket Keeper Gloves', 'Wicket Keeper Gloves', 'Cricket Clothing', 
       2056,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 18.99, 18.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (125,     'Bucket Hat', 'Cricket Bucket Hat', 'Cricket Clothing', 
       2053,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 15.99, 15.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (126,     'Spiked Shoes', 'Spiked Cricket Shoes', 'Cricket Clothing', 
       2053,    'Cricket Clothing', 'Cricket', 205, 'Cricket', 1, 'U', 'P', 1, 'STATUS', 28.99, 28.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (15,      'Right-Handed Graphite Shaft Iron Set', 'Right-Handed Graphite Shaft Iron Set', 'Irons and Iron Sets', 
       2021,    'Irons and Iron Sets', 'Golf', 202, 'Golf', 1, 'U', 'P', 1, 'STATUS', 999.99, 999.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (18,      'Lithium Electric Golf Caddy', 'Lithium Electric Golf Caddy', 'Golf Bags and Carts', 
       2022,    'Golf Bags and Carts', 'Golf', 202, 'Golf', 1, 'U', 'P', 1, 'STATUS', 1299.99, 1299.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (13,      'Soccer Goal - Portable', 'Soccer Goal - Portable', 'Soccer / Football', 
       2044,    'Soccer / Football', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 899.99, 899.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (17,      'Soccer Goal - Official', 'Soccer Goal - Official', 'Soccer / Football', 
       2041,    'Soccer / Football', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 1099.99, 1099.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (131,     'Soccer Ball - Size 4', 'Soccer Ball - Size 4 Youth', 'Soccer Equipment', 
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 18.99, 18.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (132,     'Soccer Ball - Size 5', 'Soccer Ball - Size 5', 'Soccer Equipment', 
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 24.99, 24.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (133,     'Goal Keeper Gloves', 'Goal Keeper Gloves', 'Soccer Equipment', 
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 30.99, 30.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (134,     'Shin Guards', 'Shin Guards', 'Soccer Equipment', 
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 20.99, 20.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (135,     'Gear Bag', 'Gear Bag', 'Soccer Equipment', 
       2042,    'Soccer Equipment', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 49.99, 49.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (136,     'Soccer Jersey', 'Soccer Jersey', 'Soccer Clothing', 
       2043,    'Soccer Clothing', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 32.99, 32.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (137,     'Soccer Cleats - Junior', 'Soccer Cleats - Junior', 'Soccer Clothing', 
       2043,    'Soccer Clothing', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 52.99, 52.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (138,     'Soccer Cleats - Adult', 'Soccer Cleats - Adult', 'Soccer Clothing', 
       2043,    'Soccer Clothing', 'Soccer / Football', 204, 'Soccer / Football', 1, 'U', 'P', 1, 'STATUS', 69.99, 69.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (16,      'Sonic Core Graphite Racquet', 'Sonic Core Graphite Racquet', 'Tennis Racquet', 
       2011,    'Tennis Racquet', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 299.99, 299.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (20,      'Match Used Autograph Racquet', 'Match Used Autograph Racquet', 'Tennis Racquet', 
       2012,    'Tennis Racquet', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 599.99, 599.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (29,      'Limited Edition Racquet', 'Limited Edition Racquet', 'Tennis Racquet', 
       2012,    'Tennis Racquet', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 499.99, 499.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (139,     'Tennis Balls Heavy Duty Felt 3', 'Tennis Balls Heavy Duty Felt 3 can', 'Tennis Balls', 
       2014,    'Tennis Balls', 'Tennis', 201, 'Tennis', 4, 'U', 'P', 1, 'STATUS', 19.99, 19.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (140,     'Tennis Strings Natural Gut', 'Tennis Strings Natural Gut', 'Tennis Strings', 
       2014,    'Tennis Strings', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 29.99, 29.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (141,     'Tennis Strings Synthetic Gut', 'Tennis Strings Synthetic Gut', 'Tennis Strings', 
       2014,    'Tennis Strings', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 29.99, 29.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (142,     'Tennis Strings Hybrids', 'Tennis Strings Hybrids', 'Tennis Strings', 
       2014,    'Tennis Strings', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 19.99, 19.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (143,     'Tennis Strings Polyester', 'Tennis Strings Polyester', 'Tennis Strings', 
       2014,    'Tennis Strings', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 19.99, 19.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (144,     'Tennis Grip Overgrip Tacky', 'Tennis Grip Overgrip Tacky', 'Tennis Racquet Grip', 
       2014,    'Tennis Racquet Grip', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 7.99, 7.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (145,     'Practice Tennis Balls', 'Practice Tennis Balls', 'Tennis Balls', 
       2014,    'Tennis Balls', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 12.99, 12.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (146,     'Regular Duty Tennis Balls', 'Regular Duty Tennis Balls', 'Tennis Balls', 
       2014,    'Tennis Balls', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 11.99, 11.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (147,     'Tennis Racquet Cushioned OverGrip', 'Tennis Racquet Cushioned OverGrip', 'Tennis Racquet Grip', 
       2013,    'Tennis Racquet Grip', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 7.99, 7.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (148,     'Tennis Balls 12 Pack', 'Tennis Balls 12 Pack', 'Tennis Balls', 
       2013,    'Tennis Balls', 'Tennis', 201, 'Tennis', 1, 'U', 'P', 1, 'STATUS', 20.99, 20.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (24,      'Endurance Coolcore 1/2 Zip Pullover', 'Endurance Coolcore 1/2 Zip Pullover', 'Baseball Clothing', 
       2034,    'Baseball Clothing', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 45.99, 45.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (25,      '5 Point Batting Tee', '5 Point Batting Tee', 'Batting Tees', 
       2033,    'Batting Tees', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 112.99, 112.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (26,      'Pro Style Batting Tee', 'Pro Style Batting Tee', 'Batting Tees', 
       2033,    'Batting Tees', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 149.99, 149.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (27,      'Bucket of 24 Synthetic Baseballs', 'Bucket of 24 Synthetic Baseballs', 'Baseballs', 
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (32,      'Bucket of 24 Leather Baseballs', 'Bucket of 24 Leather Baseballs', 'Baseballs', 
       2031,    'Baseballs', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 67.99, 67.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (33,      'Baseball Is Life Cap', 'Baseball Is Life Cap', 'Baseball Clothing', 
       2034,    'Baseball Clothing', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (34,      '11.5" Youth Triple Stripe Series Glove', '11.5" Youth Triple Stripe Series Glove', 'Gloves and Mitts', 
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 39.99, 39.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (35,      'Catchers Mitt', 'Catchers Mitt', 'Gloves and Mitts', 
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 49.99, 49.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (36,      '12" Premium Series Glove', '12" Premium Series Glove', 'Gloves and Mitts', 
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 44.99, 44.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (37,      '12.75" Premium Series Glove', '12.75" Premium Series Glove', 'Gloves and Mitts', 
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 54.99, 54.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (38,      '11" Youth Field Master Glove', '11" Youth Field Master Glove', 'Gloves and Mitts', 
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 29.99, 29.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
   INSERT INTO products VALUES 
      (39,      '13" Field Master Series Glove', '13" Field Master Series Glove', 'Gloves and Mitts', 
       2032,    'Gloves and Mitts', 'Baseball', 203, 'Baseball', 1, 'U', 'P', 1, 'STATUS', 34.99, 34.99, 
       'TOTAL', 1, '', to_date('2019-01-01-00-00-00', 'YYYY-MM-DD-HH24-MI-SS'), '', 'A');
END;
/

COMMIT;

rem *************************** set loading parameters
SET LOAD BATCH_ROWS 10000 BATCHES_PER_COMMIT 1 DATE_FORMAT YYYY-MM-DD

rem *************************** insert data into the COSTS table

Prompt ******  Populating COSTS table ....
LOAD costs costs.csv

rem *************************** insert data into the CUSTOMERS table

Prompt ******  Populating CUSTOMERS table ....
LOAD customers customers.csv

rem *************************** insert data into the PROMOTIONS table

Prompt ******  Populating PROMOTIONS table ....
LOAD promotions promotions.csv

rem *************************** insert data into the SALES table

Prompt ******  Populating SALES table ....
LOAD sales sales.csv

rem *************************** insert data into the TIMES table

Prompt ******  Populating TIMES table ....
LOAD times times.csv

rem *************************** insert data into the SUPPLEMENTARY_DEMOGRAPHICS table

Prompt ******  Populating SUPPLEMENTARY_DEMOGRAPHICS table ....
LOAD supplementary_demographics supplementary_demographics.csv

rem *************************** Enabling table constraints

Prompt ******  Enabling table constraints

ALTER TABLE times
   MODIFY CONSTRAINT times_pk ENABLE NOVALIDATE;

ALTER TABLE channels
   MODIFY CONSTRAINT channels_pk ENABLE NOVALIDATE;

ALTER TABLE countries
   MODIFY CONSTRAINT countries_pk ENABLE NOVALIDATE;
   
ALTER TABLE promotions
   MODIFY CONSTRAINT promo_pk ENABLE NOVALIDATE;

ALTER TABLE products
   MODIFY CONSTRAINT products_pk ENABLE NOVALIDATE;

ALTER TABLE customers
   MODIFY CONSTRAINT customers_pk ENABLE NOVALIDATE;

ALTER TABLE sales
   MODIFY CONSTRAINT sales_promo_fk ENABLE NOVALIDATE;
ALTER TABLE sales
   MODIFY CONSTRAINT sales_customer_fk ENABLE NOVALIDATE;
ALTER TABLE sales
   MODIFY CONSTRAINT sales_product_fk ENABLE NOVALIDATE;
ALTER TABLE sales
   MODIFY CONSTRAINT sales_time_fk ENABLE NOVALIDATE;
ALTER TABLE sales
   MODIFY CONSTRAINT sales_channel_fk ENABLE NOVALIDATE;

ALTER TABLE customers
   MODIFY CONSTRAINT customers_country_fk ENABLE NOVALIDATE;

ALTER TABLE costs
   MODIFY CONSTRAINT costs_product_fk ENABLE NOVALIDATE;
ALTER TABLE costs
   MODIFY CONSTRAINT costs_time_fk ENABLE NOVALIDATE;
ALTER TABLE costs
   MODIFY CONSTRAINT costs_channel_fk ENABLE NOVALIDATE;
ALTER TABLE costs
   MODIFY CONSTRAINT costs_promo_fk ENABLE NOVALIDATE;

rem *************************** Creating indexes for SALES table

Prompt ******  Creating indexes for SALES table ....

CREATE BITMAP INDEX sales_prod_bix
   ON sales (prod_id) LOCAL NOLOGGING;

CREATE BITMAP INDEX sales_cust_bix
   ON sales (cust_id) LOCAL NOLOGGING;

CREATE BITMAP INDEX sales_time_bix
   ON sales (time_id) LOCAL NOLOGGING;

CREATE BITMAP INDEX sales_channel_bix
   ON sales (channel_id) LOCAL NOLOGGING;

CREATE BITMAP INDEX sales_promo_bix
   ON sales (promo_id) LOCAL NOLOGGING;

CREATE INDEX sup_text_idx ON supplementary_demographics(comments)
   INDEXTYPE IS ctxsys.context PARAMETERS('nopopulate');

rem *************************** Creating indexes for COSTS table

Prompt ******  Creating indexes for COSTS table ....

CREATE BITMAP INDEX costs_prod_bix
   ON costs (prod_id) LOCAL NOLOGGING;

CREATE BITMAP INDEX costs_time_bix
   ON costs (time_id) LOCAL NOLOGGING;

rem *************************** Creating indexes for PRODUCTS table

Prompt ******  Creating indexes for PRODUCTS table ....

CREATE BITMAP INDEX products_prod_status_bix
   ON products(prod_status) NOLOGGING;

CREATE INDEX products_prod_subcat_ix
   ON products(prod_subcategory) NOLOGGING;

CREATE INDEX products_prod_cat_ix
   ON products(prod_category) NOLOGGING;

CREATE BITMAP INDEX customers_gender_bix
   ON customers(cust_gender) NOLOGGING;

CREATE BITMAP INDEX customers_marital_bix
   ON customers(cust_marital_status) NOLOGGING;

CREATE BITMAP INDEX customers_yob_bix
   ON customers(cust_year_of_birth) NOLOGGING;
   
CREATE BITMAP INDEX FW_PSC_S_MV_SUBCAT_BIX   
   ON fweek_pscat_sales_mv(prod_subcategory);

CREATE BITMAP INDEX FW_PSC_S_MV_CHAN_BIX
   ON fweek_pscat_sales_mv(channel_id);

CREATE BITMAP INDEX FW_PSC_S_MV_PROMO_BIX   
   ON fweek_pscat_sales_mv(promo_id);

CREATE BITMAP INDEX FW_PSC_S_MV_WD_BIX
   ON fweek_pscat_sales_mv(week_ending_day);

rem *************************** Creating dimensions

Prompt ******  Creating dimensions ....

CREATE DIMENSION customers_dim 
   LEVEL customer    IS (customers.cust_id)
   LEVEL city     IS (customers.cust_city_id) 
   LEVEL state     IS (customers.cust_state_province_id) 
   LEVEL country     IS (countries.country_id) 
   LEVEL subregion    IS (countries.country_subregion_id) 
   LEVEL region     IS (countries.country_region_id) 
   LEVEL geog_total   IS (countries.country_total_id) 
   LEVEL cust_total   IS (customers.cust_total_id) 
   HIERARCHY cust_rollup (customer  CHILD OF
                city     CHILD OF 
                state    CHILD OF 
                cust_total)
   HIERARCHY geog_rollup (customer  CHILD OF
                city        CHILD OF 
                state       CHILD OF 
                country     CHILD OF 
                subregion   CHILD OF
                region      CHILD OF
                geog_total
   JOIN KEY (customers.country_id) REFERENCES country)
   ATTRIBUTE customer DETERMINES
   (cust_first_name, cust_last_name, cust_gender, 
    cust_marital_status, cust_year_of_birth, 
    cust_income_level, cust_credit_limit,
    cust_street_address, cust_postal_code,
    cust_main_phone_number, cust_email)
   ATTRIBUTE city DETERMINES (cust_city) 
   ATTRIBUTE state DETERMINES (cust_state_province) 
   ATTRIBUTE country DETERMINES (countries.country_name,countries.country_iso_code)
   ATTRIBUTE subregion DETERMINES (countries.country_subregion)
   ATTRIBUTE region DETERMINES (countries.country_region) 
   ATTRIBUTE geog_total DETERMINES (countries.country_total) 
   ATTRIBUTE cust_total DETERMINES (customers.cust_total);

CREATE DIMENSION products_dim 
   LEVEL product     IS (products.prod_id)
   LEVEL subcategory   IS (products.prod_subcategory_id) 
   LEVEL category    IS (products.prod_category_id) 
   LEVEL prod_total  IS (products.prod_total_id) 
   HIERARCHY prod_rollup (product  CHILD OF 
                subcategory   CHILD OF 
                category      CHILD OF
                prod_total) 
   ATTRIBUTE product DETERMINES 
         (products.prod_name, products.prod_desc,
          prod_weight_class, prod_unit_of_measure,
          prod_pack_size,prod_status, prod_list_price, prod_min_price)
   ATTRIBUTE subcategory DETERMINES 
         (prod_subcategory, prod_subcategory_desc)
   ATTRIBUTE category DETERMINES 
         (prod_category, prod_category_desc)
   ATTRIBUTE prod_total DETERMINES 
         (prod_total);

CREATE DIMENSION times_dim
   LEVEL day         IS TIMES.TIME_ID
   LEVEL month       IS TIMES.CALENDAR_MONTH_ID
   LEVEL quarter     IS TIMES.CALENDAR_QUARTER_ID
   LEVEL year        IS TIMES.CALENDAR_YEAR_ID
   LEVEL fis_week    IS TIMES.WEEK_ENDING_DAY_ID
   LEVEL fis_month   IS TIMES.FISCAL_MONTH_ID
   LEVEL fis_quarter IS TIMES.FISCAL_QUARTER_ID
   LEVEL fis_year    IS TIMES.FISCAL_YEAR_ID
   HIERARCHY cal_rollup  (day       CHILD OF
                month     CHILD OF
                quarter   CHILD OF
                year)
   HIERARCHY fis_rollup (day CHILD OF
                fis_week     CHILD OF
                fis_month    CHILD OF
                fis_quarter  CHILD OF
                fis_year)
   ATTRIBUTE day DETERMINES 
         (day_number_in_week, day_name, day_number_in_month,
         calendar_week_number)
   ATTRIBUTE month DETERMINES
        (calendar_month_desc,
         calendar_month_number, calendar_month_name,
         days_in_cal_month, end_of_cal_month)
   ATTRIBUTE quarter DETERMINES
         (calendar_quarter_desc,
         calendar_quarter_number,days_in_cal_quarter,
         end_of_cal_quarter)
   ATTRIBUTE year DETERMINES
         (calendar_year,
         days_in_cal_year, end_of_cal_year)
   ATTRIBUTE fis_week DETERMINES
         (week_ending_day,
         fiscal_week_number)
   ATTRIBUTE fis_month DETERMINES
         (fiscal_month_desc, fiscal_month_number, fiscal_month_name,
         days_in_fis_month, end_of_fis_month)
   ATTRIBUTE fis_quarter DETERMINES
         (fiscal_quarter_desc,
         fiscal_quarter_number, days_in_fis_quarter,
         end_of_fis_quarter)
   ATTRIBUTE fis_year DETERMINES
         (fiscal_year, 
         days_in_fis_year, end_of_fis_year);

CREATE DIMENSION channels_dim
   LEVEL channel       IS (channels.channel_id) 
   LEVEL channel_class IS (channels.channel_class_id) 
   LEVEL channel_total IS (channels.channel_total_id) 
   HIERARCHY channel_rollup (channel  CHILD OF 
                channel_class  CHILD OF 
                channel_total)
   ATTRIBUTE channel DETERMINES (channel_desc)
   ATTRIBUTE channel_class DETERMINES (channel_class)
   ATTRIBUTE channel_total DETERMINES (channel_total);

CREATE DIMENSION promotions_dim 
   LEVEL promo       IS (promotions.promo_id) 
   LEVEL subcategory   IS (promotions.promo_subcategory_id) 
   LEVEL category       IS (promotions.promo_category_id) 
   LEVEL promo_total   IS (promotions.promo_total_id) 
   HIERARCHY promo_rollup (promo     CHILD OF 
                subcategory   CHILD OF 
                category  CHILD OF
                promo_total) 
   ATTRIBUTE promo DETERMINES 
         (promo_name, promo_cost,
          promo_begin_date, promo_end_date)
   ATTRIBUTE subcategory DETERMINES (promo_subcategory)
   ATTRIBUTE category DETERMINES (promo_category)
   ATTRIBUTE promo_total DETERMINES (promo_total);

rem *************************** Gathering statistics

Prompt ******  Gathering statistics for schema ...

BEGIN
   dbms_stats.gather_schema_stats(
   'SH',
   granularity => 'ALL',
   cascade => TRUE,
   block_sample => TRUE,
   estimate_percent => NULL
);
END;
/
