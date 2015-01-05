# cinder-backup

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

Cinder is the OpenStack Block storage service.

This package contains the Cinder backup service.

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
│   │       └── input-file-cinder-backup.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-cinder-backup.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── cinder-backup.conf
│   └── systemd
│       └── system
│           └── cinder-backup.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
