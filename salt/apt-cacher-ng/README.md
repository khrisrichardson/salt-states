# apt-cacher-ng

## Description:

Apt-Cacher NG is a caching proxy for downloading packages from Debian-style software repositories (or possibly from other types).

The main principle is that a central machine hosts the proxy for a local network, and clients configure their APT setup to download through it. Apt-Cacher NG keeps a copy of all useful data that passes through it, and when a similar request is made, the cached copy of the data is delivered without being re-downloaded.

Apt-Cacher NG has been designed from scratch as a replacement for apt-cacher, but with a focus on maximizing throughput with low system resource requirements. It can also be used as replacement for apt-proxy and approx with no need to modify clients' sources.list files.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-apt-cacher-ng.json
│   └── systemd
│       └── system
│           └── apt-cacher-ng.service
├── init.sls
└── relate-sensu-api.sls
```
