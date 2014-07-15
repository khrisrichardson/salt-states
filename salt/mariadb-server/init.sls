# vi: set ft=yaml.jinja :

include:
  -  debconf-utils
  -  mysql-common

mariadb-server:
{% if salt['config.get']('os_family') == 'Debian' %}
  debconf.set:
    - data:
        'mariadb-server/root_password':       {'type': 'password', 'value': '*1B02BA785E4FFA89100549AE59BFF7886E898F67'}
        'mariadb-server/root_password_again': {'type': 'password', 'value': '*1B02BA785E4FFA89100549AE59BFF7886E898F67'}
    - require:
      - pkg:       debconf-utils
    - require_in:
      - pkg:       mariadb-server
{% endif %}
  pkg.installed:   []
  service.running:
    - name:     {{ salt['config.get']('mariadb-server:service:name') }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       mariadb-server
      - file:     /etc/mysql/my.cnf

/usr/bin/mysql_install_db:
  cmd.run:
    - unless:      test -f /var/lib/mysql/mysql/help_category.MYD
    - require:
      - pkg:       mariadb-server
