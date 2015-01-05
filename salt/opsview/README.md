# opsview

## Description:



## Depends:

  -  [apache2](/salt/apache2)
  -  [mysql-server](/salt/mysql-server)
  -  [opsview-base](/salt/opsview-base)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [mysql-server](/salt/mysql-server)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-apache2.sls
├── etc
│   ├── apache2
│   │   └── sites-available
│   │       └── opsview
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-opsview.json
│   └── systemd
│       └── system
│           └── opsview.service
├── init.sls
├── relate-mysql-server.sls
├── relate-sensu-api.sls
└── usr
    └── local
        └── nagios
            └── etc
                └── opsview.conf
```
