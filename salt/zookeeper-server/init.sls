# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set codename = 'precise' %}
{% set version  = 'cdh4' %}
{% set roles    = [] %}
{% do  roles.append('cloudera-cm4-server') %}
{% do  roles.append('cloudera-cm5-server') %}
{% set minions = salt['roles.dict'](roles) %}

include:
  {% if   minions['cloudera-cm4-server'] %}
  -  cloudera-cm4-agent
  {% elif minions['cloudera-cm5-server'] %}
  -  cloudera-cm5-agent
  {% else %}
  -  zookeeper
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}
  {% endif %}

{% if minions['cloudera-cm4-server']
   or minions['cloudera-cm5-server'] %}

zookeeper-server:
  pkg.removed:
    - require:
      - service:   zookeeper-server
    - require_in:
      - cloudera_parcel:     CDH
  service.dead:
    - enable:      False

{% else %}

zookeeper-server:
  pkg.installed:
   {% if salt['config.get']('os') == 'Ubuntu' %}
    - fromrepo: {{ codename }}-{{ version }}
   {% endif %}
    - require:
      - pkgrepo:   cloudera-{{ version }}
  service.running:
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       zookeeper-server
      - file:     /usr/bin/java

service zookeeper-server init:
  cmd.run:
    - unless:      test -d /var/lib/zookeeper/version-*
    - require:
      - pkg:       zookeeper-server
    - require_in:
      - service:   zookeeper-server

#-------------------------------------------------------------------------------
# TODO: need to set this cautiously with some concurrency awareness
#-------------------------------------------------------------------------------
{% set id = '' %}
{% if  id %}

/var/lib/zookeeper/myid:
  file.managed:
    - contents: {{ id }}
    - user:        zookeeper
    - group:       zookeeper
    - mode:       '0644'
    - require:
      - pkg:       zookeeper-server
    - require_in:
      - service:   zookeeper-server

{% endif %}
{% endif %}
