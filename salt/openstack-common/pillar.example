# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set version  = 'icehouse' %}

{% if   salt['config.get']('os_family') == 'Debian' %}

openstack-common:
  pkgrepo:
    name:          deb http://ubuntu-cloud.archive.canonical.com/ubuntu {{ codename }}-updates/{{ version }} main
    file:         /etc/apt/sources.list.d/openstack-common.list

{% endif %}
