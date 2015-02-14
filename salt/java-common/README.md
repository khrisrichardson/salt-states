# java-common

## Depends:

  -  [python-apt](/salt/python-apt)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [oracle-j2sdk1\_6](/salt/oracle-j2sdk1_6)
  -  [oracle-j2sdk1\_7](/salt/oracle-j2sdk1_7)
  -  [oracle-java6-installer](/salt/oracle-java6-installer)
  -  [oracle-java6-set-default](/salt/oracle-java6-set-default)
  -  [oracle-java7-installer](/salt/oracle-java7-installer)
  -  [oracle-java7-set-default](/salt/oracle-java7-set-default)
  -  [oracle-java8-installer](/salt/oracle-java8-installer)
  -  [oracle-java8-set-default](/salt/oracle-java8-set-default)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── alternatives.sls
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-java-common.json
├── init.sls
└── relate-sensu-api.sls
```
