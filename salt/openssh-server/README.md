# openssh-server

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [ceph](/salt/ceph)
  -  [nagios-plugins-basic](/salt/nagios-plugins-basic)

## Relates:

  -  [cacti](/salt/cacti)
  -  [nagios3](/salt/nagios3)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-openssh-server.json
├── init.sls
├── map.jinja
├── relate-cacti.sls
├── relate-nagios3.sls
├── relate-sensu-api.sls
└── root
    └── .ssh
        └── id_rsa.pub.krichardson
```
