# trove-common

## Description:

Trove is Database as a Service for Openstack. It's designed to run entirely on OpenStack, with the goal of allowing users to quickly and easily utilize the features of a relational database without the burden of handling complex administrative tasks. Cloud users and database administrators can provision and manage multiple database instances as needed. Initially, the service will focus on providing resource isolation at high performance while automating complex administrative tasks including deployment, configuration, patching, backups, restores, and monitoring. Trove is designed to support a single-tenant database within a Nova instance. There is no restrictions on how Nova is configured, since Trove interacts with other OpenStack components purely through the API.

This package provides the Trove common files.

## Depends:

  -  N/A

## Reverse Depends:

  -  [trove-api] (salt/trove-api)
  -  [trove-guestagent] (salt/trove-guestagent)
  -  [trove-taskmanager] (salt/trove-taskmanager)

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── trove
│       └── trove.conf
└── init.sls

2 directories, 2 files
```
