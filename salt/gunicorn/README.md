# gunicorn

## Description:

Green Unicorn (gunicorn) is an HTTP/WSGI server designed to serve fast clients or sleepy applications. That is to say; behind a buffering front-end server such as nginx or lighttpd.

* Optional support for Eventlet, Tornado and Gevent to provide asynchronous
  long-polling ("Comet") connections.
* Process management: Gunicorn reaps and restarts workers that die.
* Easy integration with Django and Paster compatible applications (Pylons,
  TurboGears 2, etc.
* Load balancing via pre-fork and a shared socket
* Graceful worker process restarts
* Upgrading without losing connections
* Decode chunked transfers on-the-fly, allowing upload progress notifications
  or stream-based protocols over HTTP

## Depends:

  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  [graphite-web](salt/graphite-web)

## Relates:

  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-gunicorn.json
├── init.sls
└── relate-sensu-api.sls

3 directories, 3 files
```
