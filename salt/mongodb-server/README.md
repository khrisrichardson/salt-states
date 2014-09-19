# mongodb-server

## Description:

MongoDB is a high-performance, open source, schema-free document-oriented data store that's easy to deploy, manage and use. It's network accessible, written in C++ and offers the following features:

  * Collection oriented storage - easy storage of object-style data
  * Full index support, including on inner objects
  * Query profiling
  * Replication and fail-over support
  * Efficient storage of binary data including large objects (e.g. videos)
  * Auto-sharding for cloud-level scalability
High performance, scalability, and reasonable depth of functionality are the goals for the project.

This package contains the server itself  (mongod) and the sharding server/load-balancer (mongos).

## Depends:

  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [salt-minion](salt/salt-minion)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── mongodb.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-mongodb-server.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── mongodb-server.conf
│   └── systemd
│       └── system
│           └── mongodb-server.service
├── init.sls
├── relate-salt-minion.sls
└── relate-sensu-api.sls

8 directories, 10 files
```
