# vi: set ft=yaml.jinja :

include:
  -  sensu

uchiwa:
  pkg.installed:
    - require:
      - pkgrepo:   sensu
  service.running:
    - enable:      True
    - watch:
      - pkg:       uchiwa

/etc/sensu/uchiwa.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/sensu/uchiwa.json
    - user:        uchiwa
    - group:       uchiwa
    - mode:       '0644'
    - require:
      - pkg:       uchiwa
      - file:     /etc/sensu
    - watch_in:
      - service:   uchiwa
