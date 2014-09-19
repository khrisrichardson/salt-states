# neutron-server

## Description:

Neutron is a virtual network service for Openstack, and a part of Netstack. Just like OpenStack Nova provides an API to dynamically request and configure virtual servers, Neutron provides an API to dynamically request and configure virtual networks. These networks connect "interfaces" from other OpenStack services (e.g., virtual NICs from Nova VMs). The Neutron API supports extensions to provide advanced network capabilities (e.g., QoS, ACLs, network monitoring, etc.)

This package provides the Neutron server

## Depends:

  -  [ifupdown] (salt/ifupdown)
  -  [logstash] (salt/logstash)
  -  [neutron-common] (salt/neutron-common)
  -  [procps] (salt/procps)
  -  [sensu-client] (salt/sensu-client)
  -  [supervisor] (salt/supervisor)

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
│   ├── default
│   │   └── neutron-server
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-neutron-server.conf
│   ├── network
│   │   └── interfaces.d
│   │       └── eth2.cfg
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-neutron-server.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── neutron-server.conf
│   └── systemd
│       └── system
│           └── neutron-server.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls

13 directories, 12 files
```
