# salt-halite

## Description:



## Depends:

  -  [git](salt/git)
  -  [python-gevent](salt/python-gevent)
  -  [python-openssl](salt/python-openssl)
  -  [python-pip](salt/python-pip)
  -  [salt-common](salt/salt-common)
  -  [salt-master](salt/salt-master)
  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-git.sls
├── depend-openssl.sls
├── depend-supervisor.sls
├── etc
│   ├── salt
│   │   └── master.d
│   │       ├── external_auth.conf
│   │       └── salt-halite.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-salt-halite.json
│   └── supervisor
│       └── conf.d
│           └── salt-halite.conf
├── init.sls
└── relate-sensu-api.sls

7 directories, 9 files
```
