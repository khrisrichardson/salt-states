# parted

## Description:

GNU Parted is a program that allows you to create, destroy, resize, move, and copy disk partitions. This is useful for creating space for new operating systems, reorganizing disk usage, and copying data to new hard disks.

This package contains the binary and manual page. Further documentation is available in parted-doc.

Parted currently supports DOS, Mac, Sun, BSD, GPT, MIPS, and PC98 partitioning formats, as well as a "loop" (raw disk) type which allows use on RAID/LVM. It can detect and remove ASFS/AFFS/APFS, Btrfs, ext2/3/4, FAT16/32, HFS, JFS, linux-swap, UFS, XFS, and ZFS file systems. Parted also has the ability to create and modify file systems of some of these types, but using it to perform file system operations is now deprecated.

The nature of this software means that any bugs could cause massive data loss. While there are no such bugs known at the moment, they could exist, so please back up all important files before running it, and do so at your own risk.

## Depends:

  -  N/A

## Reverse Depends:

  -  [ceph-osd](/salt/ceph-osd)
  -  [cloudera-cm5-agent](/salt/cloudera-cm5-agent)
  -  [hadoop-hdfs](/salt/hadoop-hdfs)

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls
```
