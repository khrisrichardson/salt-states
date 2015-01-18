# snmpd

## Description:

The Simple Network Management Protocol (SNMP) provides a framework for the exchange of management information between agents (servers) and clients.

The Net-SNMP agent is a daemon which listens for incoming SNMP requests from clients and provides responses.

## Depends:

  -  [ruby-snmp](/salt/ruby-snmp)
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
│           └── checks-snmpd.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
