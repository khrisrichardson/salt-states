# vi: set ft=yaml.jinja :

{% set arch     =  salt['config.get']('osarch') %}
{% set codename =  salt['config.get']('oscodename') %}
{% set major    =  salt['config.get']('osmajorrelease') %}
{% set os       =  salt['config.get']('os')|lower %}
{% set version  = '0.21.0' %}

include:
  -  python-apt
{% if salt['config.get']('os_family') == 'RedHat' %}
  -  openjdk-7-jre-headless
  -  python-setuptools
{% endif %}

mesos:
{% if salt['config.get']('os_family') == 'Debian' %}
  pkgrepo.managed:
    - name:        deb http://repos.mesosphere.io/{{ os }} {{ codename }} main
    - file:       /etc/apt/sources.list.d/mesosphere.list
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       E56151BF
    - require:
      - pkg:       python-apt
    - require_in:
      - pkg:       mesos
{% endif %}
  pkg:
    - installed
{% if salt['config.get']('os_family') == 'RedHat' %}
    - sources:
      - mesos:     http://downloads.mesosphere.io/master/{{ os }}/{{ major }}/mesos-{{ version }}-1.0.{{ os }}64.{{ arch }}.rpm
    - require:
      - pkg:       openjdk-7-jre-headless
      - pkg:       zookeeper-server
  cmd.wait:
    - name:        easy_install http://downloads.mesosphere.io/master/{{ os }}/{{ major }}/mesos-{{ version }}-py2.6.egg
    - unless:      python -c 'import mesos'
    - require:
      - pkg:       python-setuptools
    - watch:
      - pkg:       mesos
{% endif %}
