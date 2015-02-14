# salt-master

## Depends:

  -  [epel-release](/salt/epel-release)
  -  [git](/salt/git)
  -  [openssh-client.known\_hosts.github.com](/salt/openssh-client/known_hosts/github/com.sls)
  -  [python-pygit2](/salt/python-pygit2)
  -  [salt-common](/salt/salt-common)
  -  [salt-halite](/salt/salt-halite)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  [salt-api](/salt/salt-api)
  -  [salt-halite](/salt/salt-halite)

## Relates:

  -  [cobbler](/salt/cobbler)
  -  [etcd](/salt/etcd)
  -  [logstash](/salt/logstash)
  -  [salt-syndic](/salt/salt-syndic)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-git.sls
├── depend-supervisor.sls
├── etc
│   ├── salt
│   │   └── master.d
│   │       ├── auto_accept.conf
│   │       ├── cobbler.conf
│   │       ├── etcd.conf
│   │       ├── external_auth.conf
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
│   └── supervisor
│       └── conf.d
│           └── salt-master.conf
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
```
