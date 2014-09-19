# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'RedHat' %}

include:
  -  epel-release

{% endif %}

golang-go:
  pkg.installed:
    - name:     {{ salt['config.get']('golang-go:pkg:name') }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   epel
   {% endif %}
