# cron

## Description:

The cron daemon is a background process that runs particular programs at particular times (for example, every minute, day, week, or month), as specified in a crontab. By default, users may also create crontabs of their own so that processes are run on their behalf.

Output from the commands is usually mailed to the system administrator (or to the user in question); you should probably install a mail system as well so that you can receive these messages.

This cron package does not provide any system maintenance tasks. Basic periodic maintenance tasks are provided by other packages, such as checksecurity.

## Depends:

  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  [hbase] (salt/hbase)

## Relates:

  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-cron.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
