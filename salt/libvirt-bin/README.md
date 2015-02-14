# libvirt-bin

## Depends:

  -  [bridge-utils](/salt/bridge-utils)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [uuid-runtime](/salt/uuid-runtime)

## Reverse Depends:

  -  [flynn-host](/salt/flynn-host)
  -  [nova-compute-libvirt](/salt/nova-compute-libvirt)

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
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
│   │   ├── qemu-lockd.conf
│   │   ├── qemu.conf
│   │   ├── virt-login-shell.conf
│   │   └── virtlockd.conf
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
