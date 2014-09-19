# redis-server

## Description:

Redis is a key-value database in a similar vein to memcache but the dataset is non-volatile. Redis additionally provides native support for atomically manipulating and querying data structures such as lists and sets.

The dataset is stored entirely in memory and periodically flushed to disk.

## Depends:

  -  [procps](salt/procps)
  -  [ruby-redis](salt/ruby-redis)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  [descartes](salt/descartes)
  -  [gitlab](salt/gitlab)

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
│   │       └── checks-redis-server.json
│   └── systemd
│       └── system
│           └── redis-server.service
├── init.sls
├── relate-redis-server.sls
└── relate-sensu-api.sls

6 directories, 7 files
```
