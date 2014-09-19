# keepalived

## Description:

keepalived is used for monitoring real servers within a Linux Virtual Server (LVS) cluster.  keepalived can be configured to remove real servers from the cluster pool if it stops responding, as well as send a notification email to make the admin aware of the service failure.

In addition, keepalived implements an independent Virtual Router Redundancy Protocol (VRRPv2; see rfc2338 for additional info) framework for director failover.

You need a kernel >= 2.4.28 or >= 2.6.11 for keepalived. See README.Debian for more information.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── keepalived
│   │   └── keepalived.conf
│   └── sensu
│       └── conf.d
│           └── checks-keepalived.json
├── init.sls
└── relate-sensu-api.sls

4 directories, 4 files
```
