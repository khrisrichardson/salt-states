# nova-api-metadata

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

OpenStack Compute, codenamed Nova, is a cloud computing fabric controller. In addition to its "native" API (the OpenStack API), it also supports the Amazon EC2 API.

This package provides the metadata API backend for guest VMs.

## Depends:

  -  [haproxy](/salt/haproxy)
  -  [logstash](/salt/logstash)
  -  [nova-common](/salt/nova-common)
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
│   │       └── input-file-nova-api-metadata.conf
│   ├── nova
│   │   └── rootwrap.d
│   │       └── api-metadata.filters
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-api-metadata.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── nova-api-metadata.conf
│   └── systemd
│       └── system
│           └── nova-api-metadata.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
