# vi: set ft=yaml.jinja :

include:
  - .depend-golang-go.sls
  - .depend-supervisor.sls

/etc/prometheus:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/etc/prometheus/prometheus.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/prometheus/prometheus.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file;     /etc/prometheus

/var/lib/prometheus:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
