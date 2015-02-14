# cinder-scheduler

## Depends:

  -  [cinder-common](/salt/cinder-common)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-cinder-scheduler.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-cinder-scheduler.json
│   └── supervisor
│       └── conf.d
│           └── cinder-scheduler.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
