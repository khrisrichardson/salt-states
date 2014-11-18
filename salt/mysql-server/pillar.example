# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

mysql-server:
  service:
    name:          mysqld

{% elif salt['config.get']('os_family') == 'Debian' %}

mysql-server:
  service:
    name:          mysql

{% endif %}
