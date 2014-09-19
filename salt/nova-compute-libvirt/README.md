# nova-compute-libvirt

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

OpenStack Compute, codenamed Nova, is a cloud computing fabric controller. In addition to its "native" API (the OpenStack API), it also supports the Amazon EC2 API.

Nova is intended to be modular and easy to extend and adapt. It supports many different hypervisors (KVM and Xen to name a few), different database backends (SQLite, MySQL, and PostgreSQL, for instance), different types of user databases (LDAP or SQL), etc.

This package provides common dependencies and setup for all libvirt based hypervisor options.

## Depends:

  -  [ebtables](salt/ebtables)
  -  [libvirt-bin](salt/libvirt-bin)
  -  [nova-compute](salt/nova-compute)
  -  [open-iscsi](salt/open-iscsi)

## Reverse Depends:

  -  [nova-compute-docker](salt/nova-compute-docker)
  -  [nova-compute-kvm](salt/nova-compute-kvm)
  -  [nova-compute-lxc](salt/nova-compute-lxc)
  -  [nova-compute-qemu](salt/nova-compute-qemu)
  -  [nova-compute-xen](salt/nova-compute-xen)

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls

0 directories, 1 file
```
