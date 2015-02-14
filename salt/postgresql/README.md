# postgresql

## Depends:

  -  [ruby-pg](/salt/ruby-pg)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [descartes](/salt/descartes)
  -  [gitlab](/salt/gitlab)

## Relates:

  -  [calamari](/salt/calamari)
  -  [salt-minion](/salt/salt-minion)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── postgresql
│   │   └── 9.1
│   │       └── main
│   │           └── postgresql.conf
│   └── sensu
│       └── conf.d
│           └── checks-postgresql.json
├── init.sls
├── map.jinja
├── relate-calamari.sls
├── relate-salt-minion.sls
└── relate-sensu-api.sls
```
