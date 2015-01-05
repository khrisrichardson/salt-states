# nova-compute-qemu

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

OpenStack Compute, codenamed Nova, is a cloud computing fabric controller. In addition to its "native" API (the OpenStack API), it also supports the Amazon EC2 API.

Nova is intended to be modular and easy to extend and adapt. It supports many different hypervisors (KVM and Xen to name a few), different database backends (SQLite, MySQL, and PostgreSQL, for instance), different types of user databases (LDAP or SQL), etc.

Install this package on your compute nodes if you're using QEmu.

## Depends:

  -  [nova-compute-libvirt](/salt/nova-compute-libvirt)

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── nova
│       └── nova-compute.conf
└── init.sls
```
