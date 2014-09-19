# vi: set ft=yaml.jinja :

{% set psls   = sls.split('.')[0] %}
{% set py_lib = salt['cmd.run']('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"') %}

include:
  -  salt-halite
  -  supervisor

{% if not salt['config.get']('virtual_subtype') == 'Docker' %}

extend:
  salt-halite:
    supervisord.running:
      - require:
        - pkg:     python-gevent
        - file:   /etc/salt/master.d/salt-halite.conf
      - watch:
        - service: salt-master
        - service: supervisor

{% endif %}

/etc/supervisor/conf.d/{{ psls }}.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/supervisor/conf.d/{{ psls }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - context:
        py_lib: {{ py_lib }}
    - require:
      - file:     /usr/bin/supervisord
    - require_in:
      - service:   supervisor
