# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('oscodename') %}
{% set os       =  salt['config.get']('os')|lower %}
{% set version  = '0.21.0' %}

include:
  -  python-apt

mesos:
{% if salt['config.get']('os_family') == 'Debian' %}
  pkgrepo.managed:
    - name:        deb http://repos.mesosphere.io/{{ os }} {{ codename }} main
    - file:       /etc/apt/sources.list.d/mesosphere.list
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       E56151BF
    - require:
      - pkg:       python-apt
{% endif %}
  pkg.installed:
    - require:
      - pkgrepo:   mesos
