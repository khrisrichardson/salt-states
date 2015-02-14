# snmpd

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
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-snmpd.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
