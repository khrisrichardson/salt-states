# heat-api-cfn

## Description:

Heat is a service to orchestrate multiple composite cloud applications using templates, through both an OpenStack-native ReST API and a CloudFormation-compatible Query API.

This package contains the CloudFormation (CFN) API.

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
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-heat-api-cfn.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-heat-api-cfn.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── heat-api-cfn.conf
│   └── systemd
│       └── system
│           └── heat-api-cfn.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls

10 directories, 10 files
```
