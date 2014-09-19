# oozie

## Description:



## Depends:

  -  [cloudera-cdh4](salt/cloudera-cdh4)
  -  [cloudera-cdh5](salt/cloudera-cdh5)
  -  [cloudera-cm4-agent](salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent](salt/cloudera-cm5-agent)
  -  [oracle-j2sdk1\_7](salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](salt/oracle-java7-installer)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-oozie.json
│   └── systemd
│       └── system
│           └── oozie.service
├── init.sls
└── relate-sensu-api.sls

6 directories, 6 files
```
