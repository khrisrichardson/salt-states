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

/etc/mesos-slave/containerizers:
  file.managed:
    - source:      salt://{{ sls }}/etc/mesos-slave/containerizers
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/mesos-slave
    - watch_in:
      - service:   mesos-slave

/etc/mesos-slave/executor_registration_timeout:
  file.managed:
    - source:      salt://{{ sls }}/etc/mesos-slave/executor_registration_timeout
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/mesos-slave
    - watch_in:
      - service:   mesos-slave
