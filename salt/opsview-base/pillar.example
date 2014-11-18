# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set codename = 'precise' %}

{% if   salt['config.get']('os_family') == 'RedHat' %}

opsview-base:
  pkgrepo:
    name:          opsview-base
    file:         /etc/yum.repos.d/opsview-base.repo

{% elif salt['config.get']('os_family') == 'Debian' %}

opsview-base:
  pkgrepo:
    name:          deb [arch=amd64] http://downloads.opsview.com/opsview-core/latest/apt {{ codename }} main
    file:         /etc/apt/sources.list.d/opsview-base.list

{% endif %}
