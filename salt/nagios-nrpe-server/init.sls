# vi: set ft=yaml.jinja :

{% from 'nagios-nrpe-server/map.jinja' import map with context %}

nagios-nrpe-server:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - watch:
      - pkg:       nagios-nrpe-server

/etc/nagios/nrpe.cfg:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/nagios/nrpe.cfg
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       nagios-nrpe-server
    - watch_in:
      - service:   nagios-nrpe-server
