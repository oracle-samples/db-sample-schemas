# Customer Orders Sample Schema 

Copyright (c) 2019 Oracle

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## 1. Introduction

The following contains instructions to install the customer orders sample schema. 

This requires Oracle Database 12.1.0.2 or higher.

## 2. Installing the Schema

The installation scripts are designed to run on a database host with
Oracle Database 12.1.0.2 or higher. Privileged database access is required
during installation.

### 2.1. Clone the sample schemas repository

Login as the Oracle Database software owner and clone the repository, for example

```shell
cd $HOME
git clone https://github.com/oracle/db-sample-schemas.git
```

or download and extract the ZIP file:

```shell
unzip db-sample-schemas.zip
```

### 2.2. Change directory

```shell
cd $HOME/db-sample-schemas/customer_orders
```

### 2.4. Set the Oracle environment

```shell
source /usr/local/bin/oraenv
```

### 2.5.  Run the installation script

Review the [README.txt](#README.txt) for information on passwords and
pre-requirements. In particular, verify your default and temporary
tablespace names, and choose a password for the schema.

Start SQL*Plus and run the top level installation script as
discussed in [README.txt](#README.txt):

```shell
sqlplus system@connect_string
@co_main copw connect_string users temp 
```

Use your actual default and temporary tablespace names.  The passwords 
for the new CO user will be set to the value you specify.

Using a connect string permits connections to non-container databases and 
pluggable database using the same syntax.

An example of connect strings for databases with services noncdb and pdb:
```
  localhost:1521/noncdb
  localhost:1521/pdb
```

### 2.6. Review the installation logs

Review co_install.log for errors.

## 3. Removing the Sample

*CAUTION*: This will drop user account named CO.

### 3.1. Set the Oracle environment

```shell
source /usr/local/bin/oraenv
```

### 3.2. Run the schema removal script

```shell
sqlplus system@connect_string
@co_drop_user.sql
```
