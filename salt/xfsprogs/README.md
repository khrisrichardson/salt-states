# xfsprogs

## Description:

A set of commands to use the XFS filesystem, including mkfs.xfs.

XFS is a high performance journaling filesystem which originated on the SGI IRIX platform.  It is completely multi-threaded, can support large files and large filesystems, extended attributes, variable block sizes, is extent based, and makes extensive use of Btrees (directories, extents, free space) to aid both performance and scalability.

Refer to the documentation at http://oss.sgi.com/projects/xfs/ for complete details.

## Depends:

  -  N/A

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── init.sls
└── root
    └── bin
        └── xfsprogs.sh

2 directories, 2 files
```
