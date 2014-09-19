# qemu-kvm

## Description:

QEMU is a fast processor emulator.  This package provides just a wrapper script /usr/bin/kvm which run qemu-system-x86 in kvm mode.

Please note that old qemu-kvm configuration files (in /etc/kvm/) are no longer used.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-qemu-kvm.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
