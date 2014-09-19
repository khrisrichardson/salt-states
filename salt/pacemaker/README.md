# pacemaker

## Description:

High-Availability cluster resource manager for Heartbeat as well as Corosync.

Pacemaker supports a very sophisticated dependency model for n-node clusters and can respond to node and resource-level failures.

It supports both the Heartbeat and Corosync cluster stacks.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── default
│   │   └── pacemaker
│   └── sensu
│       └── conf.d
│           └── checks-pacemaker.json
├── init.sls
└── relate-sensu-api.sls

4 directories, 4 files
```
