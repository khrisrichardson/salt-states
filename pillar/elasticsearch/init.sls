# vi: set ft=yaml.jinja :

{% set version = '1.3' %}

{% if   salt['config.get']('os_family') == 'RedHat' %}

elasticsearch:
  pkgrepo:
    name:          elasticsearch
    file:         /etc/yum.repos.d/elasticsearch.repo

/etc/default/elasticsearch:
  file:
    name:         /etc/sysconfig/elasticsearch

{% elif salt['config.get']('os_family') == 'Debian' %}

elasticsearch:
  pkgrepo:
    name:          deb http://packages.elasticsearch.org/elasticsearch/{{ version }}/debian stable main
    file:         /etc/apt/sources.list.d/elasticsearch.list

/etc/default/elasticsearch:
  file:
    name:         /etc/default/elasticsearch

{% endif %}
