# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  calamari
  -  supervisor

calamari:
  supervisord.running:
    - watch:
      - git:       https://github.com/ceph/calamari.git
      - service:   supervisor
      - file:     /etc/calamari/alembic.ini
      - file:     /etc/calamari/calamari.conf

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
