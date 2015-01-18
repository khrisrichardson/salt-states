# vi: set ft=yaml.jinja :

{% set arch    =  salt['config.get']('cpuarch') %}
{% set version = '2.5.0' %}

moxi-server:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'Debian' %}
      - moxi-server:    http://packages.couchbase.com/releases/{{ version }}/moxi-server_{{ version }}_{{ arch }}.deb
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - moxi-server:    http://packages.couchbase.com/releases/{{ version }}/moxi-server_{{ version }}_{{ arch }}.rpm
     {% endif %}
  service.running:
    - enable:      True
    - watch:
      - pkg:       moxi-server
