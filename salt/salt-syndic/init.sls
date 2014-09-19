# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  salt-common
  {% if salt['config.get']('os_family') == 'RedHat' %}
  -  epel-release
  {% endif %}

salt-syndic:
  pkg.installed:
    - enablerepo:  epel-testing
    - unless:    |-
                 ( salt-syndic --version                                       \
                 | egrep -q '....\..\..+-'
                 )
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   epel-testing
   {% endif %}
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
    - reload:      True
{% endif %}
    - order:      -1
    - sig:        'salt-syndic -d'
    - watch:
      - pkg:       salt-syndic
