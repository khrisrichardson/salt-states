# vi: set ft=yaml.jinja :

include:
  - .depend-apache2
  -  opsview-base

opsview:
  pkg.installed:
    - require:
      - pkgrepo:   opsview-base

/usr/local/nagios/etc/opsview.conf:
  file.managed:
    - source:      salt://{{ sls }}/usr/local/nagios/etc/opsview.conf
    - user:        nagios
    - group:       nagios
    - mode:       '0640'
    - watch:
      - pkg:       opsview

usermod -G nagcmd nagios:
  cmd.run:
    - unless:    |-
                 ( id    -Gn nagios                                            \
                 | egrep -q  nagcmd
                 )

/var/log/opsview/opsviewd.log:
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0777'
    - watch:
      - pkg:       opsview

/usr/local/nagios/bin/rc.opsview gen_config:
  cmd.run:
    - unless:      test -d /usr/local/nagios/configs/Master\ Monitoring\ Server
    - require:
      - file:     /var/log/opsview/opsviewd.log
      - cmd:       usermod -G nagcmd nagios

opsview-web:
  service.running:
    - enable:      True
    - require:
      - cmd:      /usr/local/nagios/bin/rc.opsview gen_config
