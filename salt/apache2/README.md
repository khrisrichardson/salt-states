# apache2

## Description:

The Apache Software Foundation's goal is to build a secure, efficient and extensible HTTP server as standards-compliant open source software. The result has long been the number one web server on the Internet.

This package contains the configuration files, init scripts and support scripts. It does not install the actual apache2 binaries.

## Depends:

  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  [calamari](salt/calamari)
  -  [descartes](salt/descartes)
  -  [graphite-web](salt/graphite-web)
  -  [nagios3](salt/nagios3)
  -  [openstack-dashboard](salt/openstack-dashboard)
  -  [opsview](salt/opsview)
  -  [radosgw](salt/radosgw)
  -  [tasseo](salt/tasseo)

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-apache2.json
│   └── systemd
│       └── system
│           └── apache2.service
├── init.sls
└── relate-sensu-api.sls

6 directories, 6 files
```
