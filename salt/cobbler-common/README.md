# cobbler-common

## Description:

Cobbler is a network install server. Cobbler supports PXE, virtualized installs, and reinstalling existing Linux machines. The last two modes use a helper tool, 'koan', that integrates with cobbler. Cobbler's advanced features include importing distributions from DVDs and rsync mirrors, kickstart templating, integrated yum mirroring, and built-in DHCP/DNS Management. Cobbler has a Python and XMLRPC API for integration with other applications. There is also a web interface.

This package includes the common files.

## Depends:

  -  N/A

## Reverse Depends:

  -  [cobbler] (salt/cobbler)

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── cobbler
│       └── dhcp.template
├── init.sls
└── var
    └── lib
        └── cobbler
            ├── config
            │   └── profiles.d
            │       └── salt.json
            ├── kickstarts
            │   └── salt.ks
            └── snippets
                ├── salt
                ├── security_config
                ├── storage_config
                └── virtual_detect

9 directories, 8 files
```
