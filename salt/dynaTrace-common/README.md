# dynaTrace-common

## Description:



## Depends:

  -  [duplicity](salt/duplicity)
  -  [logrotate](salt/logrotate)
  -  [oracle-java7-set-default](salt/oracle-java7-set-default)
  -  [rsyslog](salt/rsyslog)

## Reverse Depends:

  -  [dynaTrace-analysis-server](salt/dynaTrace-analysis-server)
  -  [dynaTrace-collector](salt/dynaTrace-collector)
  -  [dynaTrace-server](salt/dynaTrace-server)

## Relates:

  -  [rsyslog](salt/rsyslog)

## Files:

```bash
.
├── depend-duplicity.sls
├── depend-logrotate.sls
├── etc
│   ├── logrotate.d
│   │   └── dynaTrace-common
│   ├── profile.d
│   │   └── dynatrace.sh
│   └── rsyslog.d
│       └── 60-dynaTrace-common.conf
├── init.sls
├── opt
│   └── dynatrace
│       └── duplicity.txt
└── relate-rsyslog.sls

6 directories, 8 files
```
