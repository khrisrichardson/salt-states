# vi: set ft=yaml.jinja :

{% set version = '0.2.6' %}

include:
  -  openjdk-7-jre-headless

riemann:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - riemann:   http://aphyr.com/riemann/riemann-{{ version }}-1.noarch.rpm
     {% elif salt['config.get']('os_family') == 'Debian' %}
      - riemann:   http://aphyr.com/riemann/riemann_{{ version }}_all.deb
     {% endif %}
  service.running:
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       riemann

/etc/riemann/riemann.config:
  file.managed:
    - source:      salt://{{ sls }}/etc/riemann/riemann.config
    - user:        riemann
    - group:       riemann
    - mode:       '0664'
    - watch:
      - pkg:       riemann
    - watch_in:
      - service:   riemann
