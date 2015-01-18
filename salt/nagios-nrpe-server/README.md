# nagios-nrpe-server

## Description:

Nagios is a host/service/network monitoring and management system.

The purpose of this addon is to allow you to execute Nagios plugins on a remote host in as transparent a manner as possible.

This program runs as a background process on the remote host and processes command execution requests from the check\_nrpe plugin on the Nagios host.

## Depends:

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
│   ├── nagios
│   │   └── nrpe.cfg
│   └── sensu
│       └── conf.d
│           └── checks-nagios-nrpe-server.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
