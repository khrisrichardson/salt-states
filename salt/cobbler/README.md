# cobbler

## Description:

Cobbler is a network install server. Cobbler supports PXE, virtualized installs, and reinstalling existing Linux machines. The last two modes use a helper tool, 'koan', that integrates with cobbler. Cobbler's advanced features include importing distributions from DVDs and rsync mirrors, kickstart templating, integrated yum mirroring, and built-in DHCP/DNS Management. Cobbler has a Python and XMLRPC API for integration with other applications. There is also a web interface.

## Depends:

  -  [cobbler-common](/salt/cobbler-common)
  -  [nginx-common](/salt/nginx-common)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [coreos](/salt/coreos)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-cobbler.json
├── init.sls
├── map.jinja
├── relate-coreos.sls
├── relate-sensu-api.sls
└── usr
    └── share
        └── nginx
            └── html
                └── pxe-cloud-config.yml
```
