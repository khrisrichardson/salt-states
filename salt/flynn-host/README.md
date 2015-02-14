# flynn-host

## Depends:

  -  [flynn](/salt/flynn)
  -  [libvirt-bin](/salt/libvirt-bin)
  -  [sudo](/salt/sudo)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  N/A

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   └── supervisor
│       └── conf.d
│           └── flynn-host.conf
└── init.sls
```
