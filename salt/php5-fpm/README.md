# php5-fpm

## Description:

This package provides the Fast Process Manager interpreter that runs as a daemon and receives Fast/CGI requests.  Note that MOST Apache users probably want the libapache2-mod-php5 package.

The following extensions are built in: bcmath bz2 calendar Core ctype date dba dom ereg exif fileinfo filter ftp gettext hash iconv libxml mbstring mhash openssl pcre Phar posix Reflection session shmop SimpleXML soap sockets SPL standard sysvmsg sysvsem sysvshm tokenizer wddx xml xmlreader xmlwriter zip zlib.

PHP (recursive acronym for PHP: Hypertext Preprocessor) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML.

## Depends:

  -  [php5] (salt/php5)
  -  [rsyslog] (salt/rsyslog)
  -  [ruby-crack] (salt/ruby-crack)
  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [rsyslog] (salt/rsyslog)
  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── rsyslog.d
│   │   └── 60-php5-fpm.conf
│   └── sensu
│       └── conf.d
│           └── checks-php5-fpm.json
├── init.sls
├── relate-rsyslog.sls
└── relate-sensu-api.sls

4 directories, 5 files
```
