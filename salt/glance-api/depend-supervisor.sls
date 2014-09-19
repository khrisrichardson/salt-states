# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  glance-api
  -  supervisor

extend:
  glance-api:
    supervisord.running:
      - watch:
        - pkg:     glance-api
        - service: supervisor
#       - file:   /etc/glance/glance-api-paste.ini
        - file:   /etc/glance/glance-api.conf
        - file:   /etc/glance/glance-cache.conf
        - file:   /etc/glance/glance-scrubber.conf
#       - file:   /etc/glance/policy.json
#       - file:   /etc/glance/schema-image.json

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
