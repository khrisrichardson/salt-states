# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  mesos

mesos-master:
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - watch:
      - pkg:       mesos

mesos-slave:
  service.dead:
    - enable:      False
    - watch:
      - pkg:       mesos

/etc/mesos-master/quorum:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/mesos-master/quorum
    - user:        root
    - group:       root
    - mode:       '0644'
