# vi: set ft=yaml.jinja :

{% from  'nagios-nrpe-server/map.jinja'
   import nagios_nrpe_server
   with   context %}

nagios-nrpe-server:
  pkg.installed:
    - name:     {{ nagios_nrpe_server['pkg']['name'] }}
  service.running:
    - name:     {{ nagios_nrpe_server['service']['name'] }}
    - enable:      True
    - watch:
      - pkg:       nagios-nrpe-server

/etc/nagios/nrpe.cfg:
  file.managed:
    - name:     {{ nagios_nrpe_server['/etc/nagios/nrpe.cfg']['file']['name'] }}
    - template:    jinja
    - source:      salt://{{ sls }}/etc/nagios/nrpe.cfg
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       nagios-nrpe-server
    - watch_in:
      - service:   nagios-nrpe-server
