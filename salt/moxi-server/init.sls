# vi: set ft=yaml.jinja :

{% set version = '2.5.0' %}

moxi-server:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'Debian' %}
      - moxi-server:    http://packages.couchbase.com/releases/{{ version }}/moxi-server_{{ version }}_x86_64.deb
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - moxi-server:    http://packages.couchbase.com/releases/{{ version }}/moxi-server_{{ version }}_x86_64.rpm
     {% endif %}
  service.running:
    - enable:      True
    - watch:
      - pkg:       moxi-server
