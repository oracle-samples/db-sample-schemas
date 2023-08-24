# Oracle Database Sample Schemas

## 1. Introduction

The [Oracle Database Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/index.html) and other resources use these sample schemas to demonstrate the capabilities of [Oracle Database](https://www.oracle.com/database/) and the SQL and PL/SQL languages. You can download and install these schemas in your database environments to learn about Oracle Database functionality or try the examples in the documentation. **These schemas are provided for free.**

The following schemas are included:

- `HR`: Human Resources
- `CO`: Customer Orders
- `SH`: Sales History
- `OE`: Order Entry (**archived**)
- `PM`: Product Media (**archived**)

### Archived schemas

Archived schemas are provided for reference for examples in the documentation but are no longer actively maintained.

## 2. Installation

1. Go to the [latest (or appropriate) release of the sample schemas](https://github.com/oracle-samples/db-sample-schemas/releases) and download the `Source code (zip)` file.
2. Extract the downloaded .zip file.
3. Inside the sample schemas main directory, navigate to the sample schema directory that you want to install and run the `<schema_name>_install.sql` script. (**For more information about installing a schema, see the `README.md` file in the schema directory.**)
4. Review the installation verification at the end of the installation or in the generated installation log file.

#### Example

To install the `HR` schema, complete the following steps:

1. `cd` into the `human_resources` folder.
2. Connect to the target database with a privileged user.
3. Run the `hr_install.sql` script and provide inputs for the prompts.

```shell
cd human_resources
sql <system>@<connect_string>
@hr_install.sql
```

## 3. Uninstalling the Sample Schemas

1. Navigate to the sample schema folder that you want to uninstall and run the `<schema_name>_uninstall.sql` script. (**For more information about uninstalling a schema, see the `README.md` file in the schema directory.**)
2. Check the output for any errors during the uninstallation process.

## Contributing

This project is not accepting external contributions at this time. For bugs or enhancement requests, please file a GitHub issue unless it’s security related. When filing a bug remember that the better written the bug is, the more likely it is to be fixed. If you think you’ve found a security vulnerability, do not raise a GitHub issue and follow the instructions in our [security policy](./SECURITY.md).

## Security

Please consult the [security guide](./SECURITY.md) for our responsible security vulnerability disclosure process.

## License

```
Copyright (c) 2023 Oracle and/or its affiliates. All rights reserved.

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
