# vi: set ft=yaml.jinja :

{% set osarch  =  salt['config.get']('osarch') %}
{% set version = 'latest' %}

include:
  -  sudo

influxdb:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - influxdb:  http://s3.amazonaws.com/influxdb/influxdb-{{ version }}-1.{{ osarch }}.rpm
     {% elif salt['config.get']('os_family') == 'Debian' %}
      - influxdb:  http://s3.amazonaws.com/influxdb/influxdb_{{ version }}_{{ osarch }}.deb
     {% endif %}
  service.running:
    - enable:      True
    - require:
      - pkg:       sudo
    - watch:
      - pkg:       influxdb

/opt/influxdb/shared/config.toml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/opt/influxdb/shared/config.toml
    - user:        influxdb
    - group:       influxdb
    - mode:       '0644'
    - watch:
      - pkg:       influxdb
    - watch_in:
      - service:   influxdb

{% if not salt['environ.get']('bootstrap') == 'true' %}

graphite:
  influxdb_database.present:
    - user:        root
    - password:    root
    - host:        localhost
    - port:        8086
    - require:
      - service:   influxdb

{% endif %}
