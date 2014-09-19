# salt-master

## Description:

salt is a powerful remote execution manager that can be used to administer servers in a fast and efficient way.

It allows commands to be executed across large groups of servers. This means systems can be easily managed, but data can also be easily gathered.  Quick introspection into running systems becomes a reality.

Remote execution is usually used to set up a certain state on a remote system. Salt addresses this problem as well, the salt state system uses salt state files to define the state a server needs to be in.

Between the remote execution system, and state management Salt addresses the backbone of cloud and data center management.

This particular package provides the salt controller.

## Depends:

  -  [epel-release] (salt/epel-release)
  -  [git] (salt/git)
  -  [openssh-client.known\_hosts.github.com] (salt/openssh-client/known_hosts/github/com)
  -  [python-pygit2] (salt/python-pygit2)
  -  [salt-common] (salt/salt-common)
  -  [sensu-client] (salt/sensu-client)
  -  [supervisor] (salt/supervisor)

## Reverse Depends:

  -  [salt-halite] (salt/salt-halite)

## Relates:

  -  [cobbler] (salt/cobbler)
  -  [etcd] (salt/etcd)
  -  [logstash] (salt/logstash)
  -  [salt-syndic] (salt/salt-syndic)
  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── depend-git.sls
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── salt
│   │   ├── grains
│   │   └── master.d
│   │       ├── auto_accept.conf
│   │       ├── cobbler.conf
│   │       ├── etcd.conf
│   │       ├── file_recv.conf
│   │       ├── fileserver_backend.conf
│   │       ├── log.conf
│   │       ├── peer.conf
│   │       ├── presence.conf
│   │       ├── reactor.conf
│   │       └── salt-syndic.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-salt-master.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── salt-master.conf
│   └── systemd
│       └── system
│           └── salt-master.service
├── init.sls
├── relate-cobbler.sls
├── relate-etcd.sls
├── relate-logstash.sls
├── relate-salt-syndic.sls
├── relate-sensu-api.sls
└── srv
    └── reactor
        ├── job
        │   └── ret.sls
        └── minion
            └── start.sls

13 directories, 25 files
```
