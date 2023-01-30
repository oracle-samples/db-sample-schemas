# Business Intelligence Sample Schema (ARCHIVED!)

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

Business Intelligence (`BI`) is a sample user providing access to parts of the `OE` and `SH` schemas.

### SCHEMA VERSION

**ARCHIVED!**

This schema is archived and no longer maintained.

### RELEASE DATE

08-APR-2021

### SUPPORTED with DB VERSIONS

19c and lower

## INSTALL INSTRUCTIONS
1. Run `perl -p -i.bak -e 's#__SUB__CWD__#'$(pwd)'#g' *.sql */*.sql */*.dat` in this folder
2. Connect as privileged user with rights to create another user (`SYSTEM`, `ADMIN`, etc.)
3. Run the `bi_main.sql` script passing on the following parameters:
    1. `BI` schema name password
    2. The tablespace name where to install the schema into
    3. The temporary tablespace name for the `BI` user
    4. The `SYS` password
    5. The `OE` password
    6. The `SH` password
    8. The full path of a directory where to write the install log file to
    9. The version number `3`
    10. The connect string for the database you connected to

**Note:** If the `BI` schema already exists, it is removed/dropped and
        a fresh `BI` schema is installed.

## UNINSTALL INSTRUCTIONS

1. Run as privileged user with rights to drop another user (`SYSTEM`, `ADMIN`, etc.)
2. Run `DROP USER bi CASCADE;`

## NOTES
This schema is archived and no longer maintained.