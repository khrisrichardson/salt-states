# mesos-dns

## Depends:

  -  [git](/salt/git)
  -  [golang-go](/salt/golang-go)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [mesos-master](/salt/mesos-master)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-golang-go.sls
├── depend-supervisor.sls
├── etc
│   ├── mesos-dns
│   │   └── config.json
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-mesos-dns.json
│   └── supervisor
│       └── conf.d
│           └── mesos-dns.conf
├── init.sls
├── relate-mesos-master.sls
└── relate-sensu-api.sls
```
