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
├── defaults.yaml
├── etc
│   ├── qpidd.conf
│   └── sensu
│       └── conf.d
│           └── checks-qpidd.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
