# libapache2-mod-fastcgi

## Description:

This is a FastCGI module for the Apache 2.x web server.  FastCGI is an open standard for communicating between a web server and a long-running web application.  CGI scripts supporting FastCGI can be started as a daemon and process multiple requests without restarting.  This is particularly useful for scripts written in languages like Perl, as it saves the cost of recompiling the scripts and its loaded modules with each invocation.

## Depends:

  -  N/A

## Reverse Depends:

  -  [radosgw](salt/radosgw)

## Relates:

  -  N/A

## Files:

```bash
.
└── init.sls

0 directories, 1 file
```
