# trove-api

## Description:

Trove is Database as a Service for Openstack. It's designed to run entirely on OpenStack, with the goal of allowing users to quickly and easily utilize the features of a relational database without the burden of handling complex administrative tasks. Cloud users and database administrators can provision and manage multiple database instances as needed. Initially, the service will focus on providing resource isolation at high performance while automating complex administrative tasks including deployment, configuration, patching, backups, restores, and monitoring. Trove is designed to support a single-tenant database within a Nova instance. There is no restrictions on how Nova is configured, since Trove interacts with other OpenStack components purely through the API.

This package provides the Trove API server. The trove-api service provides a RESTful API that supports JSON and XML to provision and manage Trove instances.

## Depends:

  -  [logstash] (salt/logstash)
  -  [sensu-client] (salt/sensu-client)
  -  [supervisor] (salt/supervisor)
  -  [trove-common] (salt/trove-common)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash] (salt/logstash)
  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-trove-api.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-trove-api.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── trove-api.conf
│   └── systemd
│       └── system
│           └── trove-api.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls

10 directories, 10 files
```
