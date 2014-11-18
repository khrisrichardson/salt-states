# vi: set ft=yaml.jinja :

{% from  'mysql-server/map.jinja'
   import mysql_server
   with   context %}

include:
  -  debconf-utils
  -  mysql-common

mysql-server:
{% if salt['config.get']('os_family') == 'Debian' %}
  debconf.set:
    - data:
        'mysql-server/root_password':       {'type': 'password', 'value': '*1B02BA785E4FFA89100549AE59BFF7886E898F67'}
        'mysql-server/root_password_again': {'type': 'password', 'value': '*1B02BA785E4FFA89100549AE59BFF7886E898F67'}
    - require:
      - pkg:       debconf-utils
    - require_in:
      - pkg:       mysql-server
{% endif %}
  pkg.installed:   []
  service.running:
    - name:     {{ mysql_server['service']['name'] }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       mysql-server
      - file:     /etc/mysql/my.cnf

/usr/bin/mysql_install_db:
  cmd.run:
    - unless:      test -f /var/lib/mysql/mysql/help_category.MYD
    - require:
      - pkg:       mysql-server
