# nginx

## Description:

Nginx ("engine X") is a high-performance web and reverse proxy server created by Igor Sysoev. It can be used both as a standalone web server and as a proxy to reduce the load on back-end HTTP or mail servers.

This is a dependency package to install either nginx-core (by default), nginx-full, nginx-light, nginx-extras, or nginx-naxsi.

## Depends:

  -  [nginx-common](/salt/nginx-common)

## Reverse Depends:

  -  [cobbler](/salt/cobbler)
  -  [coreos-ipxe-server](/salt/coreos-ipxe-server)
  -  [gitlab](/salt/gitlab)
  -  [grafana](/salt/grafana)
  -  [graphite-web](/salt/graphite-web)
  -  [kibana](/salt/kibana)
  -  [kubernetes-apiserver](/salt/kubernetes-apiserver)
  -  [nagios3](/salt/nagios3)

## Relates:

  -  N/A

## Files:

```bash
.
├── Dockerfile
├── etc
│   └── systemd
│       └── system
│           └── nginx.service
└── init.sls

3 directories, 3 files
```
