# qpidd

## Description:

Apache Qpid is a cross-platform enterprise messaging system which implements the Advanced Message Queuing Protocol (AMQP), providing message brokers written in C++ and Java, along with clients for C++, Java JMS, .Net, Python, and Ruby.

This package provides the AMQP broker.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── qpidd.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-qpidd.json
│   └── systemd
│       └── system
│           └── qpidd.service
├── init.sls
└── relate-sensu-api.sls

6 directories, 7 files
```
