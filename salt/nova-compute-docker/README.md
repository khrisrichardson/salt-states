# nova-compute-docker

## Description:



## Depends:

  -  [nova-compute-libvirt](salt/nova-compute-libvirt)

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── nova
│   │   ├── nova-compute.conf
│   │   └── rootwrap.d
│   │       └── docker.filters
│   ├── salt
│   │   └── grains
│   └── systemd
│       └── system
│           └── nova-compute-docker.service
└── init.sls

6 directories, 6 files
```
