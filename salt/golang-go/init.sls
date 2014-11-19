# vi: set ft=yaml.jinja :

{% from 'golang-go/map.jinja' import map with context %}

{% if salt['config.get']('os_family') == 'RedHat' %}

include:
  -  epel-release

{% endif %}

golang-go:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   epel
   {% endif %}
