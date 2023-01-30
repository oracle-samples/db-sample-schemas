# Sales History Sample Schema

```
Copyright (c) 2022 Oracle

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

## DESCRIPTON

Sales History `(SH)` schema models a company's sales transactions and reports. 

### SCHEMA VERSION

21

### RELEASE DATE

06-DEC-2022

### SUPPORTED with DB VERSIONS

19c and higher

### MAJOR CHANGES IN THIS RELEASE

1. all date data is updated

### SCHEMA DEPENDENCIES AND REQUIREMENTS
 Required access to `sh_install.sql`, `sh_create.sql`, `sh_populate.sql`, `sh_code.sql`

## INSTALL INSTRUCTIONS
1. Connect as privileged user with rights to create another user (`SYSTEM`, `ADMIN`, etc.)
2. Run the `sh_install.sql` script to create the `SH` (Sales History) schema
3. You are prompted for:
    1. `password` - enter an Oracle Database compliant password
    2. `tablespace` - if you do not enter a tablespace, the default database tablespace is used

**Note:** If the `SH` schema already exists, it is removed/dropped and 
        a fresh `SH` schema is installed

## UNINSTALL INSTRUCTIONS

1. Connect as privileged user with rights to create another user (`SYSTEM`, `ADMIN`, etc.)
2. Run the `SH_uninstall.sql ` script to remove the `SH` (Sales History) schema

## NOTES
Scripts need to be run as a privileged user with rights to create and drop another user (`SYSTEM`, `ADMIN`, etc.).

