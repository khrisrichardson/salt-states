# isc-dhcp-client

## Description:

This is the client from the Internet Software Consortium's implementation of DHCP. For more information visit http://www.isc.org.

Dynamic Host Configuration Protocol (DHCP) is a protocol like BOOTP (actually dhcpd includes much of the functionality of bootpd). It gives client machines "leases" for IP addresses and can automatically set their network configuration. If your machine depends on DHCP (especially likely if it's a workstation on a large network, or a laptop, or attached to a cable modem), keep this or another DHCP client installed.

Extra documentation can be found in the package isc-dhcp-common.

## Depends:

  -  N/A

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── dhcp
│       └── dhclient.conf
└── init.sls
```
