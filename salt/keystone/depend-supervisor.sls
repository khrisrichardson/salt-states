# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  keystone
  -  supervisor

extend:
  keystone:
    supervisord.running:
      - watch:
        - pkg:     keystone
        - service: supervisor
#       - file:   /etc/keystone/default_catalog.templates
#       - file:   /etc/keystone/keystone-paste.ini
        - file:   /etc/keystone/keystone.conf
#       - file:   /etc/keystone/logging.conf
#       - file:   /etc/keystone/policy.json

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

{% endif %}
