# coreos-ipxe-server

## Description:



## Depends:

  -  [curl](/salt/curl)
  -  [nginx-common](/salt/nginx-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [coreos](/salt/coreos)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-coreos-ipxe-server.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── coreos-ipxe-server.conf
│   └── systemd
│       └── system
│           └── coreos-ipxe-server.service
├── init.sls
├── opt
│   └── coreos-ipxe-server
│       └── configs
│           └── base.yml
├── relate-coreos.sls
└── relate-sensu-api.sls
```
