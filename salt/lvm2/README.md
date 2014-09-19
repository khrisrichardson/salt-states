# lvm2

## Description:

This is LVM2, the rewrite of The Linux Logical Volume Manager.  LVM supports enterprise level volume management of disk and disk subsystems by grouping arbitrary disks into volume groups. The total capacity of volume groups can be allocated to logical volumes, which are accessed as regular block devices.

## Depends:

  -  N/A

## Reverse Depends:

  -  [cinder-volume](/salt/cinder-volume)

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── lvm
│       └── lvm.conf
├── init.sls
└── root
    └── bin
        └── lvm2.sh

4 directories, 3 files
```
