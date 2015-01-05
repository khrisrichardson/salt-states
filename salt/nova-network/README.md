# nova-network

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

OpenStack Compute, codenamed Nova, is a cloud computing fabric controller. In addition to its "native" API (the OpenStack API), it also supports the Amazon EC2 API.

Nova is intended to be modular and easy to extend and adapt. It supports many different hypervisors (KVM and Xen to name a few), different database backends (SQLite, MySQL, and PostgreSQL, for instance), different types of user databases (LDAP or SQL), etc.

This is the package you will install on the network nodes. This service is responsible for managing floating and fixed IPs, DHCP, bridging and VLANs, and in some cases acts as a gateway. Different networking strategies are available to the service by changing the network\_manager flag to FlatManager, FlatDHCPManager, or VlanManager (default is VLAN).

## Depends:

  -  [bridge-utils](/salt/bridge-utils)
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
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-nova-network.conf
│   ├── nova
│   │   └── rootwrap.d
│   │       └── network.filters
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-network.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── nova-network.conf
│   └── systemd
│       └── system
│           └── nova-network.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
