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
  {% if   minions['cloudera-cm4-server'] %}
  -  cloudera-cm4-agent
  {% elif minions['cloudera-cm5-server'] %}
  -  cloudera-cm5-agent
  {% else %}
  -  hadoop-hdfs
  -  oracle-java7-installer
  -  oracle-java7-set-default
  {% endif %}

{% if minions['cloudera-cm4-server']
   or minions['cloudera-cm5-server'] %}

hadoop-hdfs-secondarynamenode:
  pkg.removed:
    - require:
      - service:   hadoop-hdfs-secondarynamenode
    - require_in:
      - cloudera_parcel:     CDH
  service.dead:
    - enable:      False

{% else %}

hadoop-hdfs-secondarynamenode:
  pkg.installed:
   {% if salt['config.get']('os') == 'Ubuntu' %}
    - fromrepo: {{ codename }}-{{ version }}
   {% endif %}
    - require:
      - pkgrepo:   cloudera-{{ version }}
{% if minions['hadoop-hdfs-namenode'] %}
  service.running:
    - enable:      True
{% else %}
  service.dead:
    - enable:      False
{% endif %}
    - watch:
      - pkg:       hadoop-hdfs-secondarynamenode

{% endif %}

{% set devs = salt['cmd.run']('ls -1d /dev/{s,{u,x,}v}d{b..z} 2>/dev/null').split('\n') %}
{% for dev in devs %}
{% if  dev %}

/data/{{ loop.index }}/dfs/snn:
  file.directory:
    - user:        hdfs
    - group:       hdfs
    - mode:       '0700'
    - require:
      - file:     /data/{{ loop.index }}/dfs
     {% if minions['cloudera-cm4-server']
        or minions['cloudera-cm5-server'] %}
      - cloudera_parcel:     CDH
     {% else %}
      - pkg:       hadoop-hdfs-secondarynamenode
    - require_in:
      - service:   hadoop-hdfs-secondarynamenode
     {% endif %}

{% endif %}
{% endfor %}
