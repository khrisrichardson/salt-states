# elasticsearch-kopf

## Description:

Web admin interface for elasticsearch

## Depends:

  -  [debianutils](/salt/debianutils)
  -  [elasticsearch](/salt/elasticsearch)
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
│           └── checks-elasticsearch-kopf.json
├── init.sls
└── relate-sensu-api.sls
```
