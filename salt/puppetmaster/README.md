# puppetmaster

## Description:

This package contains the startup and compatibility scripts for the puppet master, which is the server hosting manifests and files for the puppet nodes.

Puppet lets you centrally manage every important aspect of your system using a cross-platform specification language that manages all the separate elements normally aggregated in different files, like users, cron jobs, and hosts, along with obviously discrete elements like packages, services, and files.

Puppet's simple declarative specification language provides powerful classing abilities for drawing out the similarities between hosts while allowing them to be as specific as necessary, and it handles dependency and prerequisite relationships between objects clearly and explicitly.

## Depends:

  -  [openssh-client] (salt/openssh-client)
  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-puppetmaster.json
│   └── systemd
│       └── system
│           └── puppetmaster.service
├── init.sls
└── relate-sensu-api.sls

6 directories, 6 files
```
