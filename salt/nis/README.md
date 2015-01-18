# nis

## Description:

This package provides tools for setting up and maintaining a NIS domain. NIS, originally known as Yellow Pages (YP), is mostly used to let several machines in a network share the same account information, such as the password file.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nis.json
│   └── yp.conf
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
