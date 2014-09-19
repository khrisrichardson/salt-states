# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set codename = 'precise' %}
{% set version  = 'cdh4' %}

include:
  - .depend-cron
  -  cloudera-{{ version }}

hbase:
  pkg.installed:
   {% if salt['config.get']('os') == 'Ubuntu' %}
    - fromrepo: {{ codename }}-{{ version }}
   {% endif %}
    - require:
      - pkgrepo:   cloudera-{{ version }}

/etc/hbase/conf.dist/hbase-env.sh:
  file.append:
    - text:        []
    - watch:
      - pkg:       hbase

/etc/hbase/conf.dist/hbase-site.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/hbase/conf.dist/hbase-site.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       hbase

/etc/hbase/conf.dist/regionservers:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/hbase/conf.dist/regionservers
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       hbase

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

/etc/security/limits.d/hbase.conf:
  file.replace:
    - pattern:  '^hbase - memlock unlimited'
    - repl:     '#hbase - memlock unlimited'
    - watch:
      - pkg:       hbase

{% else %}

/etc/security/limits.d/hbase.conf:
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       hbase

{% endif %}

/usr/lib/hbase/bin/snapshot.rb:
  file.managed:
    - source:      salt://{{ sls }}/usr/lib/hbase/bin/snapshot.rb
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       hbase

/var/lib/hbase:
  file.directory:
    - user:        hbase
    - group:       hbase
    - mode:       '0755'
    - require:
      - pkg:       hbase
