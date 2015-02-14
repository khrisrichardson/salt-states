# logio-harvester

## Depends:

  -  [logio](/salt/logio)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logio-server](/salt/logio-server)

## Files:

```bash
.
├── depend-supervisor.sls
├── etc
│   ├── log.io
│   │   └── harvester.conf
│   └── supervisor
│       └── conf.d
│           └── logio-harvester.conf
├── init.sls
└── relate-logio-server.sls
```
