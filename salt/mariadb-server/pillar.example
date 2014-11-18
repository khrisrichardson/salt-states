# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

mariadb-server:
  service:
    name:          mysqld

{% elif salt['config.get']('os_family') == 'Debian' %}

mariadb-server:
  service:
    name:          mysql

{% endif %}
