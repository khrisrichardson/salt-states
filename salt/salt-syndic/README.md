# salt-syndic

## Description:

salt is a powerful remote execution manager that can be used to administer servers in a fast and efficient way.

It allows commands to be executed across large groups of servers. This means systems can be easily managed, but data can also be easily gathered.  Quick introspection into running systems becomes a reality.

Remote execution is usually used to set up a certain state on a remote system. Salt addresses this problem as well, the salt state system uses salt state files to define the state a server needs to be in.

Between the remote execution system, and state management Salt addresses the backbone of cloud and data center management.

This particular package provides the master of masters for salt - it enables the management of multiple masters at a time.

## Depends:

  -  [epel-release](/salt/epel-release)
  -  [salt-common](/salt/salt-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-salt-syndic.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── salt-syndic.conf
│   └── systemd
│       └── system
│           └── salt-syndic.service
├── init.sls
└── relate-sensu-api.sls

8 directories, 8 files
```
