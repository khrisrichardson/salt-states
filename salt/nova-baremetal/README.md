# nova-baremetal

## Depends:

  -  [logstash](/salt/logstash)
  -  [nova-common](/salt/nova-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](/salt/logstash)
  -  [mariadb-server](/salt/mariadb-server)
  -  [mysql-server](/salt/mysql-server)
  -  [postgresql](/salt/postgresql)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-nova-baremetal.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-baremetal.json
│   └── supervisor
│       └── conf.d
│           └── nova-baremetal.conf
├── init.sls
├── relate-logstash.sls
├── relate-mariadb-server.sls
├── relate-mysql-server.sls
├── relate-postgresql.sls
└── relate-sensu-api.sls
```
