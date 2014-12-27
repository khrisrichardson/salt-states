# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  mesos

mesos-master:
  service.dead:
    - enable:      False
    - watch:
      - pkg:       mesos

mesos-slave:
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - watch:
      - pkg:       mesos
