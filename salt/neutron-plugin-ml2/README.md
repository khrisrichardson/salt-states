# neutron-plugin-ml2

## Description:

Neutron is a virtual network service for Openstack, and a part of Netstack. Just like OpenStack Nova provides an API to dynamically request and configure virtual servers, Neutron provides an API to dynamically request and configure virtual networks. These networks connect "interfaces" from other OpenStack services (e.g., virtual NICs from Nova VMs). The Neutron API supports extensions to provide advanced network capabilities (e.g., QoS, ACLs, network monitoring, etc.)

This package provides the Modular Layer 2 plugin.

## Depends:

  -  [neutron-common](salt/neutron-common)

## Reverse Depends:

  -  [neutron-plugin-openflow-agent](salt/neutron-plugin-openflow-agent)
  -  [neutron-plugin-openvswitch-agent](salt/neutron-plugin-openvswitch-agent)

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── neutron
│       └── plugins
│           └── ml2
│               ├── ml2_conf_arista.ini
│               ├── ml2_conf_brocade.ini
│               ├── ml2_conf_cisco.ini
│               ├── ml2_conf.ini
│               ├── ml2_conf_mlnx.ini
│               ├── ml2_conf_ncs.ini
│               ├── ml2_conf_odl.ini
│               └── ml2_conf_ofa.ini
└── init.sls

4 directories, 9 files
```
