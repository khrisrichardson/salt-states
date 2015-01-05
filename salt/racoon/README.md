# racoon

## Description:

IPsec (Internet Protocol security) offers end-to-end security for network traffic at the IP layer.

This package is a Linux port of the IKE server from the KAME IPsec implementation on BSD.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [openvswitch-ipsec](/salt/openvswitch-ipsec)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── racoon
│   │   ├── psk.txt
│   │   ├── racoon.conf
│   │   └── racoon-tool.conf
│   └── sensu
│       └── conf.d
│           └── checks-racoon.json
├── init.sls
└── relate-sensu-api.sls
```
