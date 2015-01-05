# heat-api-cloudwatch

## Description:

Heat is a service to orchestrate multiple composite cloud applications using templates, through both an OpenStack-native ReST API and a CloudFormation-compatible Query API.

This package contains the CloudWatch API.

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
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-heat-api-cloudwatch.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-heat-api-cloudwatch.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── heat-api-cloudwatch.conf
│   └── systemd
│       └── system
│           └── heat-api-cloudwatch.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
