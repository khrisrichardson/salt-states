# uuid-runtime

## Description:

The libuuid library generates and parses 128-bit universally unique ids (UUIDs).  A UUID is an identifier that is unique across both space and time, with respect to the space of all UUIDs.  A UUID can be used for multiple purposes, from tagging objects with an extremely short lifetime, to reliably identifying very persistent objects across a network.

See RFC 4122 for more information.

This package contains the uuidgen program and the uuidd daemon.

The uuidd daemon is used to generate UUIDs, especially time-based UUID??s, in a secure and guaranteed-unique fashion, even in the face of large numbers of threads trying to grab UUID??s running on different CPU??s. It is used by libuuid as well as the uuidgen program.

## Depends:

  -  N/A

## Reverse Depends:

  -  [ceph](salt/ceph)
  -  [libvirt-bin](salt/libvirt-bin)

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls

0 directories, 1 file
```
