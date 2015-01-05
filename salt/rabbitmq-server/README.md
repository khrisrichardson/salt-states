# rabbitmq-server

## Description:

RabbitMQ is an implementation of AMQP, the emerging standard for high performance enterprise messaging. The RabbitMQ server is a robust and scalable implementation of an AMQP broker.

## Depends:

  -  [logstash](/salt/logstash)
  -  [python-apt](/salt/python-apt)
  -  [ruby-bunny](/salt/ruby-bunny)
  -  [ruby-carrot-top](/salt/ruby-carrot-top)
  -  [ruby-rest-client](/salt/ruby-rest-client)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceilometer-api](/salt/ceilometer-api)
  -  [cinder-api](/salt/cinder-api)
  -  [glance-api](/salt/glance-api)
  -  [heat-api](/salt/heat-api)
  -  [ironic-api](/salt/ironic-api)
  -  [keystone](/salt/keystone)
  -  [logstash](/salt/logstash)
  -  [neutron-server](/salt/neutron-server)
  -  [sensu-api](/salt/sensu-api)
  -  [sensu-server](/salt/sensu-server)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-rabbitmq-server.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-rabbitmq-server.json
│   └── systemd
│       └── system
│           └── rabbitmq-server.service
├── init.sls
├── relate-ceilometer-api.sls
├── relate-cinder-api.sls
├── relate-glance-api.sls
├── relate-heat-api.sls
├── relate-ironic-api.sls
├── relate-keystone.sls
├── relate-logstash.sls
├── relate-neutron-server.sls
├── relate-sensu-api.sls
└── relate-sensu-server.sls
```
