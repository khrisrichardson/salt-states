# heat-engine

## Description:

Heat is a service to orchestrate multiple composite cloud applications using templates, through both an OpenStack-native ReST API and a CloudFormation-compatible Query API.

This package contains the heat engine, which is the core service of heat, and which the API servers will use.

## Depends:

  -  [heat-common](/salt/heat-common)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── heat
│   │   └── environment.d
│   │       └── default.yaml
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-heat-engine.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-heat-engine.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── heat-engine.conf
│   └── systemd
│       └── system
│           └── heat-engine.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
