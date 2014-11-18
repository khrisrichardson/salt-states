# vi: set ft=yaml.jinja :

{% from  'golang-go/map.jinja'
   import golang_go
   with   context %}

{% if salt['config.get']('os_family') == 'RedHat' %}

include:
  -  epel-release

{% endif %}

golang-go:
  pkg.installed:
    - name:     {{ golang_go['pkg']['name'] }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   epel
   {% endif %}
