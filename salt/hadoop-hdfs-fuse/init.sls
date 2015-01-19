# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set codename = 'precise' %}
{% set version  = 'cdh4' %}

include:
  -  cloudera-{{ version }}

hadoop-hdfs-fuse:
  pkg.installed:
   {% if salt['config.get']('os') == 'Ubuntu' %}
    - fromrepo: {{ codename }}-{{ version }}
   {% endif %}
    - require:
      - pkgrepo:   cloudera-{{ version }}

/etc/default/hadoop-fuse:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/default/hadoop-fuse
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       hadoop-hdfs-fuse
