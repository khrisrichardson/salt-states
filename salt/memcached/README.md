# memcached

## Description:

Danga Interactive developed memcached to enhance the speed of LiveJournal.com, a site which was already doing 20 million+ dynamic page views per day for 1 million users with a bunch of webservers and a bunch of database servers. memcached dropped the database load to almost nothing, yielding faster page load times for users, better resource utilization, and faster access to the databases on a memcache miss.

memcached optimizes specific high-load serving applications that are designed to take advantage of its versatile no-locking memory access system. Clients are available in several different programming languages, to suit the needs of the specific application. Traditionally this has been used in mod_perl apps to avoid storing large chunks of data in Apache memory, and to share this burden across several machines.

## Depends:

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
│   ├── default
│   │   └── memcached
│   ├── memcached.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-memcached.json
│   └── systemd
│       └── system
│           └── memcached.service
├── init.sls
└── relate-sensu-api.sls

7 directories, 8 files
```
