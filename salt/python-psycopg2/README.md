# python-psycopg2

## Description:

psycopg is a PostgreSQL database adapter for the Python programming language (just like pygresql and popy.) This is version 2, a complete rewrite of the original code to provide new-style classes for connection and cursor objects and other sweet candies. Like the original, psycopg 2 was written with the aim of being very small and fast, and stable as a rock.

psycopg is different from the other database adapter because it was designed for heavily multi-threaded applications that create and destroy lots of cursors and make a conspicuous number of concurrent INSERTs or UPDATEs. psycopg 2 also provides full asynchronous operations for the really brave programmer.

The main advantages of psycopg2 are that it supports the full Python DBAPI-2.0 and being thread safe at level 2. It also includes some extensions to the standard DBAPI-2.0 to allow for better thread performance.

## Depends:

  -  N/A

## Reverse Depends:

  -  [salt-minion](/salt/salt-minion)

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls

0 directories, 1 file
```
