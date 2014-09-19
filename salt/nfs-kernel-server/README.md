# nfs-kernel-server

## Description:

The NFS kernel server is currently the recommended NFS server for use with Linux, featuring features such as NFSv3 and NFSv4, Kerberos support via GSS, and much more. It is also significantly faster and usually more reliable than the user-space NFS servers (from the unfs3 and nfs-user-server packages). However, it is more difficult to debug than the user-space servers, and has a slightly different feature set.

This package contains the user-space support needed to use the NFS kernel server. Most administrators wishing to set up an NFS server would want to install this package.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nfs-kernel-server.json
│   └── systemd
│       └── system
│           └── nfs-kernel-server.service
├── init.sls
└── relate-sensu-api.sls

6 directories, 6 files
```
