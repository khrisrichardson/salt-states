# riemann

## Description:



## Depends:

  -  [openjdk-7-jre-headless](/salt/openjdk-7-jre-headless)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── riemann
│   │   └── riemann.config
│   └── sensu
│       └── conf.d
│           └── checks-riemann.json
├── init.sls
└── relate-sensu-api.sls
```
