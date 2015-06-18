# vi: set ft=yaml.jinja :

{% set arch    =  salt['config.get']('osarch') -%}
{% set edition = 'enterprise' %}
{% set version = '3.0.3' %}

include:
  -  libssl1_0_0

couchbase-server:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'Debian' %}
      - couchbase-server:    http://packages.couchbase.com/releases/{{ version }}/couchbase-server-{{ edition }}_{{ version }}-ubuntu12.04_{{ arch }}.deb
     {% elif salt['config.get']('os_family') == 'RedHat' %}
      - couchbase-server:    http://packages.couchbase.com/releases/{{ version }}/couchbase-server-{{ edition }}-{{ version }}-centos6.{{ arch }}.rpm
     {% endif %}
  service.running:
    - enable:      True
    - require:
      - pkg:       libssl1_0_0
    - watch:
      - pkg:       couchbase-server

{% if not salt['config.get']('virtual_subtype') == 'Docker' %}

/sys/kernel/mm/transparent_hugepage/enabled:
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0644'
    - contents:    never

vm.swappiness:
  sysctl.present:
    - value:       0
    - require:
      - pkg:       procps

{% endif %}
