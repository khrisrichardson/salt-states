# salt-api

## Depends:

  -  [python-cherrypy](/salt/python-cherrypy)
  -  [python-openssl](/salt/python-openssl)
  -  [salt-master](/salt/salt-master)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-openssl.sls
├── etc
│   ├── salt
│   │   └── master.d
│   │       └── salt-api.conf
│   └── sensu
│       └── conf.d
│           └── checks-salt-api.json
├── init.sls
└── relate-sensu-api.sls
```
