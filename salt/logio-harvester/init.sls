# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  logio

/etc/log.io/harvester.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/log.io/harvester.conf
    - user:        logio
    - group:       logio
    - mode:       '0644'

logio-harvester:
  cmd.run:
    - name:        log.io-harvester &>/dev/null
    - require:
      - file:     /etc/log.io/harvester.conf
