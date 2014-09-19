# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set codename = 'precise' %}
{% set version  = 'cdh4' %}
{% set roles    = [] %}
{% do  roles.append('cloudera-cm4-server') %}
{% do  roles.append('cloudera-cm5-server') %}
{% do  roles.append('hadoop-hdfs-namenode') %}
{% set minions = salt['roles.dict'](roles) %}

include:
  -  base-files
  -  netbase
  {% if   minions['cloudera-cm4-server'] %}
  -  cloudera-cm4-agent
  {% elif minions['cloudera-cm5-server'] %}
  -  cloudera-cm5-agent
  {% else %}
  -  hbase
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}
  {% endif %}

{% if minions['cloudera-cm4-server']
   or minions['cloudera-cm5-server'] %}

hbase-master:
  pkg.removed:
    - require:
      - service:   hbase-master
    - require_in:
      - cloudera_parcel:     CDH
  service.dead:
    - enable:      False

{% else %}

hbase-master:
  pkg.installed:
   {% if salt['config.get']('os') == 'Ubuntu' %}
    - fromrepo: {{ codename }}-{{ version }}
   {% endif %}
    - require:
      - pkgrepo:   cloudera-{{ version }}
  service.running:
    - enable:      True
    - require:
      - file:     /var/lib/hbase
    - watch:
      - pkg:       hbase-master
      - file:     /etc/hbase/conf.dist/hbase-site.xml
      - file:     /etc/security/limits.d/hbase.conf
      - file:     /usr/bin/java

{% if not minions['hadoop-hdfs-namenode'] %}

/var/lib/zookeeper:
  file.directory:
    - user:        hbase
    - group:       hbase
    - mode:       '0755'
    - require_in:
      - service:   hbase-master

{% endif %}
{% endif %}
