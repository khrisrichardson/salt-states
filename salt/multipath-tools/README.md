# multipath-tools

## Description:

These tools are in charge of maintaining the disk multipath device maps and react to path and map events.

If you install this package you may have to change the way you address block devices. See README.Debian for details.

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
│           └── checks-multipath-tools.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
