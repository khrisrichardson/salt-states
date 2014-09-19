# nova-api-os-compute

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

OpenStack Compute, codenamed Nova, is a cloud computing fabric controller. In addition to its "native" API (the OpenStack API), it also supports the Amazon EC2 API.

This package provides the OpenStack Compute API frontend.

## Depends:

  -  [logstash](salt/logstash)
  -  [nova-common](salt/nova-common)
  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](salt/logstash)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-nova-api-os-compute.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-api-os-compute.json
│   └── supervisor
│       └── conf.d
│           └── nova-api-os-compute.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls

7 directories, 7 files
```
