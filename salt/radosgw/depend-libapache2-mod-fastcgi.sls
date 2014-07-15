# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  libapache2-mod-fastcgi
  -  radosgw.depend-apache2

/var/www/s3gw.fcgi:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/var/www/s3gw.fcgi
    - user:        root
    - group:       root
    - mode:       '0555'
    - require:
      - pkg:       apache2
    - require_in:
      - service:   apache2
