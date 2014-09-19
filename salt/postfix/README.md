# postfix

## Description:

Postfix is Wietse Venema's mail transport agent that started life as an alternative to the widely-used Sendmail program.  Postfix attempts to be fast, easy to administer, and secure, while at the same time being sendmail compatible enough to not upset existing users. Thus, the outside has a sendmail-ish flavor, but the inside is completely different.

## Depends:

  -  [debconf-utils] (salt/debconf-utils)
  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  [gitlab] (salt/gitlab)
  -  [graphite-web] (salt/graphite-web)
  -  [nagios3] (salt/nagios3)
  -  [openstack-dashboard] (salt/openstack-dashboard)

## Relates:

  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── postfix
│   │   └── main.cf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-postfix.json
│   └── systemd
│       └── system
│           └── postfix.service
├── init.sls
├── pkg.selections
└── relate-sensu-api.sls

7 directories, 8 files
```
