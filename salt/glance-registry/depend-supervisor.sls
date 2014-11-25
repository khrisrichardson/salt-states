# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  glance-registry
  -  supervisor

extend:
  glance-registry:
    supervisord.running:
      - watch:
        - pkg:     glance-registry
        - service: supervisor
        - file:   /etc/glance/glance-registry-paste.ini
        - file:   /etc/glance/glance-registry.conf

/etc/supervisor/conf.d/{{ psls }}.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/supervisor/conf.d/{{ psls }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /usr/bin/supervisord
    - require_in:
      - service:   supervisor
    - watch_in:
      - cmd:       supervisorctl update &

{% endif %}
