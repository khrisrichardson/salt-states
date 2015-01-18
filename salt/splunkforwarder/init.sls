# vi: set ft=yaml.jinja :

{% set arch    =  salt['config.get']('osarch') %}
{% set version = '6.0-182037' %}

splunkforwarder:
  pkg.installed:
    - order:      -1
   {% if   salt['config.get']('os_family') == 'Debian' %}
    - sources:
      - splunkforwarder: salt://{{ sls }}/splunkforwarder-{{ version }}-linux-2.6-{{ arch }}.deb
   {% elif salt['config.get']('os_family') == 'RedHat' %}
    - sources:
      - splunkforwarder: salt://{{ sls }}/splunkforwarder-{{ version }}-linux-2.6-{{ arch }}.rpm
   {% endif %}
