# incron

## Description:

incron is an "inotify cron" system. It works like the regular cron but is driven by filesystem events instead of time events. This package provides two programs, a daemon called "incrond" (analogous to crond) and a table manipulator "incrontab" (like "crontab").

incron uses the Linux Kernel inotify syscalls.

like cron, each user can edit its own incron tables.

incron can be used to :
- notifying programs (e.g. server daemons) about changes in configuration
- guarding changes in critical files (with their eventual recovery)
- file usage monitoring, statistics
- automatic on-crash cleanup
- automatic on-change backup or versioning
- new mail notification (for maildir)
- server upload notification
- installation management (outside packaging systems)
- ... and many others

## Depends:

  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  [salt-minion](salt/salt-minion)

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── incron.allow
│   └── sensu
│       └── conf.d
│           └── checks-incron.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 4 files
```
