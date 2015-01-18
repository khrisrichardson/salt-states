# cinder-api

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

Cinder is the OpenStack Block storage service.

This package contains the Cinder API server.

## Depends:

  -  [cinder-common](/salt/cinder-common)
  -  [haproxy](/salt/haproxy)
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
├── depend-haproxy.sls
├── depend-supervisor.sls
├── etc
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-cinder-api.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-cinder-api.json
│   └── supervisor
│       └── conf.d
│           └── cinder-api.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
