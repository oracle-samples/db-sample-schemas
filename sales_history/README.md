# Sales History Sample Schema

## Schema Description

Sales History `(SH)` schema models a company's sales transactions and reports.
The sample company does a high volume of business, so it runs business
statistics reports to aid in decision making. Many of these reports are
time-based and nonvolatile. That is, they analyze past data trends. The company
loads data into its data warehouse regularly to gather statistics for
these reports. These reports include annual, quarterly, monthly, and weekly
sales figures by product. These reports are stored by using the schema
Sales History (`SH`).

The company also runs reports on distribution channels through which its
sales are delivered. When the company runs special promotions on its products,
it analyzes the impact of the promotions on sales. It also analyzes sales
by geographical area.

## Install Instruction

1. Connect as privileged user with rights to create another user (`SYSTEM`, `ADMIN`, etc.)
2. Run the `sh_install.sql` script to create the `SH` (Sales History) schema
3. You are prompted for:
   1. `password` - enter an Oracle Database compliant password
   2. `tablespace` - if you do not enter a tablespace, the default database tablespace is used

**Note:** If the `SH` schema already exists, it is removed/dropped and
a fresh `SH` schema is installed

### Dependencies and Requirements

- Oracle Database 19c and higher
- **Requires [SQLcl](https://oracle.com/sqlcl) command prompt!**
- Access to `sh_install.sql`, `sh_create.sql`, `sh_populate.sql`
- Scripts need to be run as a privileged user with rights to create and drop another user (`SYSTEM`, `ADMIN`, etc.).

## Uninstall Instructions

1. Connect as privileged user with rights to create another user (`SYSTEM`, `ADMIN`, etc.)
2. Run the `sh_uninstall.sql ` script to remove the `SH` (Sales History) schema

## Schema Details

### Schema Objects

| Object Type       | Objects |
| ----------------- | ------- |
| Dimension         | `channels_dim`, `customers_dim`, `products_dim`, `promotions_dim`, `times_dim` |
| Index             | `channels_pk`, `countries_pk`, `customers_gender_bix`, `customers_marital_bix`, `customers_pk`, `customers_yob_bix`, `dr$sup_text_idx$x`, `fw_psc_s_mv_chan_bix`, `fw_psc_s_mv_promo_bix`, `fw_psc_s_mv_subcat_bix`, `fw_psc_s_mv_wd_bix`, `products_pk`, `products_prod_cat_ix`, `products_prod_status_bix`, `products_prod_subcat_ix`, `promo_pk`, `sup_text_idx`, `times_pk` |
| Partitioned Index | `costs_prod_bix`, `costs_time_bix`, `sales_channel_bix`, `sales_cust_bix`, `sales_prod_bix`, `sales_promo_bix`, `sales_time_bix` |
| Materialized View | `cal_month_sales_mv`, `fweek_pscat_sales_mv` |
| Table             | `channels`, `countries`, `customers`, `products`, `promotions`, `times` |
| Partitioned Table | `costs`, `sales` |
| View              | `profits` |

### Table Descriptions

#### `CHANNELS`

| Name               | Null       | Type           | Relationships |
| ------------------ | ---------- | -------------- | ------------- |
| `CHANNEL_ID`       | `NOT NULL` | `NUMBER`       | relates rows of the table `channels` to one or more rows of the table `sales` with the corresponding value of `channel_id`. |
| `CHANNEL_DESC`     | `NOT NULL` | `VARCHAR2(20)` | |
| `CHANNEL_CLASS`    | `NOT NULL` | `VARCHAR2(20)` | |
| `CHANNEL_CLASS_ID` | `NOT NULL` | `NUMBER`       | |
| `CHANNEL_TOTAL`    | `NOT NULL` | `VARCHAR2(13)` | |
| `CHANNEL_TOTAL_ID` | `NOT NULL` | `NUMBER`       | |

#### `COSTS`

| Name         | Null       | Type           | Relationships |
| ------------ | ---------- | -------------- | ------------- |
| `PROD_ID`    | `NOT NULL` | `NUMBER`       | relates one or more rows of the table `costs` to one row of the table `products` with the corresponding value of `prod_id`. |
| `TIME_ID`    | `NOT NULL` | `DATE`         | relates one or more rows of the table `costs` to one row of the table `times` with the corresponding value of `time_id`. |
| `PROMO_ID`   | `NOT NULL` | `NUMBER`       | |
| `CHANNEL_ID` | `NOT NULL` | `NUMBER`       | |
| `UNIT_COST`  | `NOT NULL` | `NUMBER(10,2)` | |
| `UNIT_PRICE` | `NOT NULL` | `NUMBER(10,2)` | |

#### `COUNTRIES`

| Name                   | Null       | Type           | Relationships |
| ---------------------- | ---------- | -------------- | ------------- |
| `COUNTRY_ID`           | `NOT NULL` | `NUMBER`       | relates rows of the table `countries` to one or more rows of the table `customers` with the corresponding value of `country_id`. |
| `COUNTRY_ISO_CODE`     | `NOT NULL` | `CHAR(2)`      | |
| `COUNTRY_NAME`         | `NOT NULL` | `VARCHAR2(40)` | |
| `COUNTRY_SUBREGION`    | `NOT NULL` | `VARCHAR2(30)` | |
| `COUNTRY_SUBREGION_ID` | `NOT NULL` | `NUMBER`       | |
| `COUNTRY_REGION`       | `NOT NULL` | `VARCHAR2(20)` | |
| `COUNTRY_REGION_ID`    | `NOT NULL` | `NUMBER`       | |
| `COUNTRY_TOTAL`        | `NOT NULL` | `VARCHAR2(11)` | |
| `COUNTRY_TOTAL_ID`     | `NOT NULL` | `NUMBER`       | |

#### `CUSTOMERS`

| Name                     | Null       | Type           | Relationships |
| ------------------------ | ---------- | -------------- | ------------- |
| `CUST_ID`                | `NOT NULL` | `NUMBER`       | relates rows of the table `customers` to one or more rows of the table `sales` with the corresponding value of `customer_id`. |
| `CUST_FIRST_NAME`        | `NOT NULL` | `VARCHAR2(20)` | |
| `CUST_LAST_NAME`         | `NOT NULL` | `VARCHAR2(40)` | |
| `CUST_GENDER`            | `NOT NULL` | `CHAR(1)`      | |
| `CUST_YEAR_OF_BIRTH`     | `NOT NULL` | `NUMBER(4)`    | |
| `CUST_MARITAL_STATUS`    |            | `VARCHAR2(20)` | |
| `CUST_STREET_ADDRESS`    | `NOT NULL` | `VARCHAR2(40)` | |
| `CUST_POSTAL_CODE`       | `NOT NULL` | `VARCHAR2(10)` | |
| `CUST_CITY`              | `NOT NULL` | `VARCHAR2(30)` | |
| `CUST_CITY_ID`           | `NOT NULL` | `NUMBER`       | |
| `CUST_STATE_PROVINCE`    | `NOT NULL` | `VARCHAR2(40)` | |
| `CUST_STATE_PROVINCE_ID` | `NOT NULL` | `NUMBER`       | |
| `COUNTRY_ID`             | `NOT NULL` | `NUMBER`       | relates one or more rows of the table `customers` to one row of the table `countries` with the corresponding value of `country_id`. |
| `CUST_MAIN_PHONE_NUMBER` | `NOT NULL` | `VARCHAR2(25)` | |
| `CUST_INCOME_LEVEL`      |            | `VARCHAR2(30)` | |
| `CUST_CREDIT_LIMIT`      |            | `NUMBER`       | |
| `CUST_EMAIL`             |            | `VARCHAR2(50)` | |
| `CUST_TOTAL`             | `NOT NULL` | `VARCHAR2(14)` | |
| `CUST_TOTAL_ID`          | `NOT NULL` | `NUMBER`       | |
| `CUST_SRC_ID`            |            | `NUMBER`       | |
| `CUST_EFF_FROM`          |            | `DATE`         | |
| `CUST_EFF_TO`            |            | `DATE`         | |
| `CUST_VALID`             |            | `VARCHAR2(1)`  | |

#### `PRODUCTS`

| Name                    | Null       | Type             | Relationships |
| ----------------------- | ---------- | ---------------- | ------------- |
| `PROD_ID`               | `NOT NULL` | `NUMBER(6)`      | relates rows of the table `products` to one or more rows of the table `sales` with the corresponding value of `prod_id`; relates rows of the table `products` to one or more rows of the table `costs` with the corresponding value of `prod_id`. |
| `PROD_NAME`             | `NOT NULL` | `VARCHAR2(50)`   | |
| `PROD_DESC`             | `NOT NULL` | `VARCHAR2(4000)` | |
| `PROD_SUBCATEGORY`      | `NOT NULL` | `VARCHAR2(50)`   | |
| `PROD_SUBCATEGORY_ID`   | `NOT NULL` | `NUMBER`         | |
| `PROD_SUBCATEGORY_DESC` | `NOT NULL` | `VARCHAR2(2000)` | |
| `PROD_CATEGORY`         | `NOT NULL` | `VARCHAR2(50)`   | |
| `PROD_CATEGORY_ID`      | `NOT NULL` | `NUMBER`         | |
| `PROD_CATEGORY_DESC`    | `NOT NULL` | `VARCHAR2(2000)` | |
| `PROD_WEIGHT_CLASS`     | `NOT NULL` | `NUMBER(3)`      | |
| `PROD_UNIT_OF_MEASURE`  |            | `VARCHAR2(20)`   | |
| `PROD_PACK_SIZE`        | `NOT NULL` | `VARCHAR2(30)`   | |
| `SUPPLIER_ID`           | `NOT NULL` | `NUMBER(6)`      | |
| `PROD_STATUS`           | `NOT NULL` | `VARCHAR2(20)`   | |
| `PROD_LIST_PRICE`       | `NOT NULL` | `NUMBER(8,2)`    | |
| `PROD_MIN_PRICE`        | `NOT NULL` | `NUMBER(8,2)`    | |
| `PROD_TOTAL`            | `NOT NULL` | `VARCHAR2(13)`   | |
| `PROD_TOTAL_ID`         | `NOT NULL` | `NUMBER`         | |
| `PROD_SRC_ID`           |            | `NUMBER`         | |
| `PROD_EFF_FROM`         |            | `DATE`           | |
| `PROD_EFF_TO`           |            | `DATE`           | |
| `PROD_VALID`            |            | `VARCHAR2(1)`    | |

#### `PROMOTIONS`

| Name                   | Null       | Type           | Relationships |
| ---------------------- | ---------- | -------------- | ------------- |
| `PROMO_ID`             | `NOT NULL` | `NUMBER(6)`    | relates rows of the table `promotions` to one or more rows of the table `sales` with the corresponding value of `promo_id`. |
| `PROMO_NAME`           | `NOT NULL` | `VARCHAR2(30)` | |
| `PROMO_SUBCATEGORY`    | `NOT NULL` | `VARCHAR2(30)` | |
| `PROMO_SUBCATEGORY_ID` | `NOT NULL` | `NUMBER`       | |
| `PROMO_CATEGORY`       | `NOT NULL` | `VARCHAR2(30)` | |
| `PROMO_CATEGORY_ID`    | `NOT NULL` | `NUMBER`       | |
| `PROMO_COST`           | `NOT NULL` | `NUMBER(10,2)` | |
| `PROMO_BEGIN_DATE`     | `NOT NULL` | `DATE`         | |
| `PROMO_END_DATE`       | `NOT NULL` | `DATE`         | |
| `PROMO_TOTAL`          | `NOT NULL` | `VARCHAR2(15)` | |
| `PROMO_TOTAL_ID`       | `NOT NULL` | `NUMBER`       | |

#### `SALES`

| Name            | Null       | Type           | Relationships |
| --------------- | ---------- | -------------- | ------------- |
| `PROD_ID`       | `NOT NULL` | `NUMBER(6)`    | relates one or more rows of the table `sales` to a row of the table `products` with the corresponding value of `prod_id`. |
| `CUST_ID`       | `NOT NULL` | `NUMBER`       | relates one or more rows of the table `sales` to a row of the table `customers` with the corresponding value of `cust_id`. |
| `TIME_ID`       | `NOT NULL` | `DATE`         | relates one or more rows of the table `sales` to a row of the table `times` with the corresponding value of `times_id`. |
| `CHANNEL_ID`    | `NOT NULL` | `NUMBER(1)`    | relates one or more rows of the table `sales` to a row of the table `channels` with the corresponding value of `channel_id`. |
| `PROMO_ID`      | `NOT NULL` | `NUMBER(6)`    | relates one or more rows of the table `sales` to a row of the table `promotions` with the corresponding value of `promo_id`. |
| `QUANTITY_SOLD` | `NOT NULL` | `NUMBER(3)`    | |
| `AMOUNT_SOLD`   | `NOT NULL` | `NUMBER(10,2)` | |

#### `TIMES`

| Name                      | Null       | Type          | Relationships |
| ------------------------- | ---------- | ------------- | ------------- |
| `TIME_ID`                 | `NOT NULL` | `DATE`        | relates rows of the table `times` to one or more rows of the table `sales` with the corresponding value of `time_id`. |
| `DAY_NAME`                | `NOT NULL` | `VARCHAR2(9)` | |
| `DAY_NUMBER_IN_WEEK`      | `NOT NULL` | `NUMBER(1)`   | |
| `DAY_NUMBER_IN_MONTH`     | `NOT NULL` | `NUMBER(2)`   | |
| `CALENDAR_WEEK_NUMBER`    | `NOT NULL` | `NUMBER(2)`   | |
| `FISCAL_WEEK_NUMBER`      | `NOT NULL` | `NUMBER(2)`   | |
| `WEEK_ENDING_DAY`         | `NOT NULL` | `DATE`        | |
| `WEEK_ENDING_DAY_ID`      | `NOT NULL` | `NUMBER`      | |
| `CALENDAR_MONTH_NUMBER`   | `NOT NULL` | `NUMBER(2)`   | |
| `FISCAL_MONTH_NUMBER`     | `NOT NULL` | `NUMBER(2)`   | |
| `CALENDAR_MONTH_DESC`     | `NOT NULL` | `VARCHAR2(8)` | |
| `CALENDAR_MONTH_ID`       | `NOT NULL` | `NUMBER`      | |
| `FISCAL_MONTH_DESC`       | `NOT NULL` | `VARCHAR2(8)` | |
| `FISCAL_MONTH_ID`         | `NOT NULL` | `NUMBER`      | |
| `DAYS_IN_CAL_MONTH`       | `NOT NULL` | `NUMBER`      | |
| `DAYS_IN_FIS_MONTH`       | `NOT NULL` | `NUMBER`      | |
| `END_OF_CAL_MONTH`        | `NOT NULL` | `DATE`        | |
| `END_OF_FIS_MONTH`        | `NOT NULL` | `DATE`        | |
| `CALENDAR_MONTH_NAME`     | `NOT NULL` | `VARCHAR2(9)` | |
| `FISCAL_MONTH_NAME`       | `NOT NULL` | `VARCHAR2(9)` | |
| `CALENDAR_QUARTER_DESC`   | `NOT NULL` | `CHAR(7)`     | |
| `CALENDAR_QUARTER_ID`     | `NOT NULL` | `NUMBER`      | |
| `FISCAL_QUARTER_DESC`     | `NOT NULL` | `CHAR(7)`     | |
| `FISCAL_QUARTER_ID`       | `NOT NULL` | `NUMBER`      | |
| `DAYS_IN_CAL_QUARTER`     | `NOT NULL` | `NUMBER`      | |
| `DAYS_IN_FIS_QUARTER`     | `NOT NULL` | `NUMBER`      | |
| `END_OF_CAL_QUARTER`      | `NOT NULL` | `DATE`        | |
| `END_OF_FIS_QUARTER`      | `NOT NULL` | `DATE`        | |
| `CALENDAR_QUARTER_NUMBER` | `NOT NULL` | `NUMBER(1)`   | |
| `FISCAL_QUARTER_NUMBER`   | `NOT NULL` | `NUMBER(1)`   | |
| `CALENDAR_YEAR`           | `NOT NULL` | `NUMBER(4)`   | |
| `CALENDAR_YEAR_ID`        | `NOT NULL` | `NUMBER`      | |
| `FISCAL_YEAR`             | `NOT NULL` | `NUMBER(4)`   | |
| `FISCAL_YEAR_ID`          | `NOT NULL` | `NUMBER`      | |
| `DAYS_IN_CAL_YEAR`        | `NOT NULL` | `NUMBER`      | |
| `DAYS_IN_FIS_YEAR`        | `NOT NULL` | `NUMBER`      | |
| `END_OF_CAL_YEAR`         | `NOT NULL` | `DATE`        | |
| `END_OF_FIS_YEAR`         | `NOT NULL` | `DATE`        | |

### Schema Diagram

```mermaid
---
title: SH schema
config:
  layout: elk
---
erDiagram

  CHANNELS   ||--o{ COSTS     : carry
  CHANNELS   ||--o{ SALES     : have
  COUNTRIES  ||--o{ CUSTOMERS : have
  CUSTOMERS  ||--o{ SALES     : have
  PRODUCTS   ||--o{ COSTS     : carry
  PRODUCTS   ||--o{ SALES     : have
  PROMOTIONS ||--o{ COSTS     : carry
  PROMOTIONS ||..o{ SALES     : contain
  TIMES      ||--o{ COSTS     : "point to"
  TIMES      ||--o{ SALES     : "point to"

  CHANNELS {
    number        channel_id        PK "NN"
    varchar2(20)  channel_desc         "NN"
    varchar2(20)  channel_class        "NN"
    number        channel_class_id     "NN"
    varchar2(13)  channel_total        "NN"
    number        channel_total_id     "NN"
  }

  COSTS {
   number       prod_id     FK "NN"
    date        time_id     FK "NN"
    number      promo_id    FK "NN"
    number      channel_id  FK "NN"
    number(10)  unit_cost      "NN"
    number(10)  unit_price     "NN"
  }

  COUNTRIES {
    number        country_id           PK "NN"
    char(2)       country_iso_code        "NN"
    varchar2(40)  country_name            "NN"
    varchar2(30)  country_subregion       "NN"
    number        country_subregion_id    "NN"
    varchar2(20)  country_region          "NN"
    number        country_region_id       "NN"
    varchar2(11)  country_total           "NN"
    number        country_total_id        "NN"
  }

  CUSTOMERS {
    number        cust_id                  PK "NN"
    varchar2(20)  cust_first_name             "NN"
    varchar2(40)  cust_last_name              "NN"
    char(1)       cust_gender                 "NN"
    number(4)     cust_year_of_birth          "NN"
    varchar2(20)  cust_marital_status
    varchar2(40)  cust_street_address         "NN"
    varchar2(10)  cust_postal_code            "NN"
    varchar2(30)  cust_city                   "NN"
    number        cust_city_id                "NN"
    varchar2(40)  cust_state_province         "NN"
    number        cust_state_province_id  FK  "NN"
    number        country_id                  "NN"
    varchar2(25)  cust_main_phone_number      "NN"
    varchar2(30)  cust_income_level
    number        cust_credit_limit
    varchar2(50)  cust_email
    varchar2(14)  cust_total                  "NN"
    number        cust_total_id               "NN"
    number        cust_src_id
    date          cust_eff_from
    date          cust_eff_to
    varchar2(1)   cust_valid
  }

  PRODUCTS {
    number(6)       prod_id                PK "NN"
    varchar2(50)    prod_name                 "NN"
    varchar2(4000)  prod_desc                 "NN"
    varchar2(50)    prod_subcategory          "NN"
    number          prod_subcategory_id       "NN"
    varchar2(2000)  prod_subcategory_desc     "NN"
    varchar2(50)    prod_category             "NN"
    number          prod_category_id          "NN"
    varchar2(2000)  prod_category_desc        "NN"
    number(3)       prod_weight_class         "NN"
    varchar2(20)    prod_unit_of_measure
    varchar2(30)    prod_pack_size            "NN"
    number(6)       supplier_id               "NN"
    varchar2(20)    prod_status               "NN"
    number(8)       prod_list_price           "NN"
    number(8)       prod_min_price            "NN"
    varchar2(13)    prod_total                "NN"
    number          prod_total_id             "NN"
    number          prod_src_id
    date            prod_eff_from
    date            prod_eff_to
    varchar2(1)     prod_valid
  }

  PROMOTIONS {
    number(6)     promo_id              PK "NN"
    varchar2(30)  promo_name               "NN"
    varchar2(30)  promo_subcategory        "NN"
    number        promo_subcategory_id     "NN"
    varchar2(30)  promo_category           "NN"
    number        promo_category_id        "NN"
    number(10)    promo_cost               "NN"
    date          promo_begin_date         "NN"
    date          promo_end_date           "NN"
    varchar2(15)  promo_total              "NN"
    number        promo_total_id           "NN"
  }

  SALES {
    number(6)   prod_id        FK "NN"
    number      cust_id        FK "NN"
    date        time_id        FK "NN"
    number(1)   channel_id     FK "NN"
    number(6)   promo_id       FK "NN"
    number(3)   quantity_sold     "NN"
    number(10)  amount_sold       "NN"
  }

  SUPPLEMENTARY_DEMOGRAPHICS {
    number          cust_id         PK "NN"
    varchar2(21)    education
    varchar2(21)    occupation
    varchar2(21)    household_size
    number          yrs_residence
    number(10)      affinity_card
    number(10)      cricket
    number(10)      baseball
    number(10)      tennis
    number(10)      soccer
    number(10)      golf
    number(10)      unknown
    number(10)      misc
    varchar2(4000)  comments
  }

  TIMES {
    date         time_id                PK "NN"
    varchar2(9)  day_name                  "NN"
    number(1)    day_number_in_week        "NN"
    number(2)    day_number_in_month       "NN"
    number(2)    calendar_week_number      "NN"
    number(2)    fiscal_week_number        "NN"
    date         week_ending_day           "NN"
    number       week_ending_day_id        "NN"
    number(2)    calendar_month_number     "NN"
    number(2)    fiscal_month_number       "NN"
    varchar2(8)  calendar_month_desc       "NN"
    number       calendar_month_id         "NN"
    varchar2(8)  fiscal_month_desc         "NN"
    number       fiscal_month_id           "NN"
    number       days_in_cal_month         "NN"
    number       days_in_fis_month         "NN"
    date         end_of_cal_month          "NN"
    date         end_of_fis_month          "NN"
    varchar2(9)  calendar_month_name       "NN"
    varchar2(9)  fiscal_month_name         "NN"
    char(7)      calendar_quarter_desc     "NN"
    number       calendar_quarter_id       "NN"
    char(7)      fiscal_quarter_desc       "NN"
    number       fiscal_quarter_id         "NN"
    number       days_in_cal_quarter       "NN"
    number       days_in_fis_quarter       "NN"
    date         end_of_cal_quarter        "NN"
    date         end_of_fis_quarter        "NN"
    number(1)    calendar_quarter_number   "NN"
    number(1)    fiscal_quarter_number     "NN"
    number(4)    calendar_year             "NN"
    number       calendar_year_id          "NN"
    number(4)    fiscal_year               "NN"
    number       fiscal_year_id            "NN"
    number       days_in_cal_year          "NN"
    number       days_in_fis_year          "NN"
    date         end_of_cal_year           "NN"
    date         end_of_fis_year           "NN"
  }
```

## License

```
Copyright (c) 2023 Oracle and/or its affiliates. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions rem of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
```
