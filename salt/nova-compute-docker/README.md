# nova-compute-docker

## Description:



## Depends:

  -  [nova-compute-libvirt](/salt/nova-compute-libvirt)

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── nova
│   │   ├── nova-compute.conf
│   │   └── rootwrap.d
│   │       └── docker.filters
│   └── systemd
│       └── system
│           └── nova-compute-docker.service
└── init.sls
```
