# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mysql-server') %}

{% if minions['mysql-server'] %}

include:
  -  mysql-server
  -  opsview

/usr/local/nagios/bin/db_mysql -u root:
  cmd.run:
    - unless:      test -d /var/lib/mysql/opsview
    - require:
      - pkg:       opsview
      - service:   mysql-server

/usr/local/nagios/bin/db_opsview db_install:
  cmd.run:
    - unless:     /usr/local/nagios/bin/db_opsview db_exists
    - require:
      - cmd:      /usr/local/nagios/bin/db_mysql -u root

/usr/local/nagios/bin/db_runtime db_install:
  cmd.run:
    - unless:     /usr/local/nagios/bin/db_runtime db_exists
    - require:
      - cmd:      /usr/local/nagios/bin/db_mysql -u root

{% endif %}
