# trove-taskmanager

## Description:

Trove is Database as a Service for Openstack. It's designed to run entirely on OpenStack, with the goal of allowing users to quickly and easily utilize the features of a relational database without the burden of handling complex administrative tasks. Cloud users and database administrators can provision and manage multiple database instances as needed. Initially, the service will focus on providing resource isolation at high performance while automating complex administrative tasks including deployment, configuration, patching, backups, restores, and monitoring. Trove is designed to support a single-tenant database within a Nova instance. There is no restrictions on how Nova is configured, since Trove interacts with other OpenStack components purely through the API.

This package provides the Trove taskmanager. The trove-taskmanager service does the heavy lifting as far as provisioning instances, managing the lifecycle of instances, and performing operations on the Database instance.

## Depends:

  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)
  -  [trove-common](/salt/trove-common)

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
│   │       └── input-file-trove-taskmanager.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-trove-taskmanager.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── trove-taskmanager.conf
│   └── systemd
│       └── system
│           └── trove-taskmanager.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
