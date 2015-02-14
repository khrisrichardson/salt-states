# lxc-docker

## Depends:

  -  [epel-release](/salt/epel-release)
  -  [python-apt](/salt/python-apt)
  -  [ruby-docker](/salt/ruby-docker)
  -  [ruby-docker-api](/salt/ruby-docker-api)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [docker-machine](/salt/docker-machine)
  -  [nsenter](/salt/nsenter)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── default
│   │   └── docker
│   └── sensu
│       └── conf.d
│           └── checks-lxc-docker.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
