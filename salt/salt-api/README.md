# salt-api

## Description:

a modular interface on top of Salt that can provide a variety of entry points into a running Salt system. It can start and manage multiple interfaces allowing a REST API to coexist with XMLRPC or even a Websocket API.

The Salt API system is used to expose the fundamental aspects of Salt control to external sources. salt-api acts as the bridge between Salt itself and REST, Websockets, etc.

Documentation is available on Read the Docs:

http://salt-api.readthedocs.org/

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
│   └── sensu
│       └── conf.d
│           └── checks-salt-api.json
├── init.sls
└── relate-sensu-api.sls
```
