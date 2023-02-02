# Oracle Database Sample Schemas

```
Copyright (c) 2023 Oracle

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
```

## 1. Introduction

The [Oracle Database Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/index.html) and other resources use these sample schemas to demonstrate the capabilities of the [Oracle Database](https://www.oracle.com/database/) and the SQL and PL/SQL languages. Users can download and install these schemas in their Oracle database environments to learn about Oracle Database functionality and/or try the examples in the documentation. **These schemas are provided for free!**

The following schemas are included:

- `HR`: Human Resources
- `CO`: Customer Orders
- `SH`: Sales History
- `OE`: Order Entry (**archived**)
- `PM`: Product Media (**archived**)
- `BI`: Business Intelligence (**archived**)

### Archived schemas

Archived schemas are provided for reference for examples in the documentation but are no longer actively maintained.

## 2. Installing the Sample Schemas

1. Go to the [latest (or appropriate) release of the sample schemas](https://github.com/oracle-samples/db-sample-schemas/releases) and download the `Source code (zip)` file.
2. Extract the downloaded zip file.
3. Inside the sample schemas main directory, which into the sample schema directory that you want to install and invoke the `<schema_name>_install.sql` file (**see the `README.md` file for further install instructions!**)
4. Review the instalation verification at the end of the installation or in the generated installation log file.

#### Example

To install the `HR` schema, execute the following steps:

1. `cd` into the `human_resources` folder.
2. Connect to the target database with a privileged user via SQLcl or SQL*Plus.
3. Invoke the `hr_install.sql` script and provide inputs for the prompt.

```shell
cd human_resources
sql <system>@<connect_string>
@hr_install.sql
```

## 3. Uninstalling the Sample Schemas

1. Switch into the sample schema folder that you want to uninstall and invoke the `<schema_name>_uninstall.sql` file (**see the `README.md` file for further uninstall instructions!**)
2. Check the output for any errors during the uninstall process.