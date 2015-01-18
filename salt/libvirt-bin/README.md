# libvirt-bin

## Description:

Libvirt is a C toolkit to interact with the virtualization capabilities of recent versions of Linux (and other OSes). The library aims at providing a long term stable C API for different virtualization mechanisms. It currently supports QEMU, KVM, XEN, OpenVZ, LXC, and VirtualBox.

This package contains the supporting binaries to use with libvirt

## Depends:

  -  [bridge-utils](/salt/bridge-utils)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [uuid-runtime](/salt/uuid-runtime)

## Reverse Depends:

  -  [nova-compute-libvirt](/salt/nova-compute-libvirt)

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── default
│   │   └── libvirt-bin
│   ├── libvirt
│   │   ├── libvirt.conf
│   │   ├── libvirtd.conf
│   │   ├── lxc.conf
│   │   ├── nwfilter
│   │   │   ├── allow-arp.xml
│   │   │   ├── allow-dhcp-server.xml
│   │   │   ├── allow-dhcp.xml
│   │   │   ├── allow-incoming-ipv4.xml
│   │   │   ├── allow-ipv4.xml
│   │   │   ├── clean-traffic.xml
│   │   │   ├── no-arp-ip-spoofing.xml
│   │   │   ├── no-arp-mac-spoofing.xml
│   │   │   ├── no-arp-spoofing.xml
│   │   │   ├── no-ip-multicast.xml
│   │   │   ├── no-ip-spoofing.xml
│   │   │   ├── no-mac-broadcast.xml
│   │   │   ├── no-mac-spoofing.xml
│   │   │   ├── no-other-l2-traffic.xml
│   │   │   ├── no-other-rarp-traffic.xml
│   │   │   ├── qemu-announce-self-rarp.xml
│   │   │   └── qemu-announce-self.xml
│   │   ├── qemu
│   │   │   └── networks
│   │   │       └── default.xml
│   │   ├── qemu.conf
│   │   ├── qemu-lockd.conf
│   │   ├── virtlockd.conf
│   │   └── virt-login-shell.conf
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-libvirt-bin.conf
│   ├── sasl2
│   │   └── libvirt.conf
│   └── sensu
│       └── conf.d
│           └── checks-libvirt-bin.json
├── init.sls
├── map.jinja
├── relate-logstash.sls
└── relate-sensu-api.sls
```
