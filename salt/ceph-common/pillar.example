# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set version  = 'firefly' %}

{% if   salt['config.get']('os_family') == 'RedHat' %}

ceph-common:
  pkgrepo:
    name:          ceph-common
    file:         /etc/yum.repos.d/ceph-common.repo

{% elif salt['config.get']('os_family') == 'Debian' %}

ceph-common:
  pkgrepo:
    name:          deb http://ceph.com/debian-{{ version }}/ {{ codename }} main
    file:         /etc/apt/sources.list.d/ceph-common.list

{% endif %}
