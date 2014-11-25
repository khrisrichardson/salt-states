# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  supervisor
  -  swift-object

extend:
  swift-object:
    supervisord.running:
      - watch:
        - pkg:     swift-object
        - service: supervisor
        - file:   /etc/swift/object-server.conf
        - file:   /etc/swift/swift.conf

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
