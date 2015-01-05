# lxc-docker

## Description:

Docker complements LXC with a high-level API which operates at the process level. It runs unix processes with strong guarantees of isolation and repeatability across servers. Docker is a great building block for automating distributed systems: large-scale web deployments, database clusters, continuous deployment systems, private PaaS, service-oriented architectures, etc.

## Depends:

  -  [epel-release](/salt/epel-release)
  -  [python-apt](/salt/python-apt)
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
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-lxc-docker.json
│   └── systemd
│       └── system
│           └── lxc-docker.service
├── init.sls
└── relate-sensu-api.sls
```
