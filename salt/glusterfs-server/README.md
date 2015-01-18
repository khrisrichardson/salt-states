# glusterfs-server

## Description:

GlusterFS is a clustered file-system capable of scaling to several peta-bytes. It aggregates various storage bricks over Infiniband RDMA or TCP/IP interconnect into one large parallel network file system. GlusterFS is one of the most sophisticated file system in terms of features and extensibility. It borrows a powerful concept called Translators from GNU Hurd kernel. Much of the code in GlusterFS is in userspace and easily manageable.

This package installs init scripts and configuration files to turn GlusterFS into a fully fledged file server.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-glusterfs-server.json
├── init.sls
└── relate-sensu-api.sls
```
