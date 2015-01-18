# trafficserver

## Description:

This package provides the Apache Traffic Server. A fast, scalable reverse proxy server which may operate as forward proxy as well. Apache Traffic Server supports:

 * Caching: Improves response time by caching and reusing frequently-
   requested web content.
 * Proxying: Supports filtering, anonymization, load balancing and more.
 * Scaling: Scales well on modern SMP hardware.
 * Extensions: Use the API to modify anything from the HTTP headers to your
   own cache algorithm.

## Depends:

  -  N/A

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-trafficserver.json
├── init.sls
└── relate-sensu-api.sls
```
