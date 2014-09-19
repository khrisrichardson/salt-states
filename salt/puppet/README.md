# puppet

## Description:

This package contains the startup script and compatbility scripts for the puppet agent, which is the process responsible for configuring the local node.

Puppet lets you centrally manage every important aspect of your system using a cross-platform specification language that manages all the separate elements normally aggregated in different files, like users, cron jobs, and hosts, along with obviously discrete elements like packages, services, and files.

Puppet's simple declarative specification language provides powerful classing abilities for drawing out the similarities between hosts while allowing them to be as specific as necessary, and it handles dependency and prerequisite relationships between objects clearly and explicitly.

## Depends:

  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-puppet.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
