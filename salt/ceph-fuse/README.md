# ceph-fuse

## Description:

Ceph is a distributed network file system designed to provide excellent performance, reliability, and scalability.  This is a FUSE-based client that allows one to mount a Ceph file system without root privileges.

Because the FUSE-based client has certain inherent performance limitations, it is recommended that the native Linux kernel client be used if possible.  If it is not practical to load a kernel module (insufficient privileges, older kernel, etc.), then the FUSE client will do.

## Depends:

  -  [ceph-common] (salt/ceph-common)

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls

0 directories, 1 file
```
