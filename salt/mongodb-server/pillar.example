# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

mongodb-server:
  service:
    name:          mongod

{% elif salt['config.get']('os_family') == 'Debian' %}

mongodb-server:
  service:
    name:          mongodb

{% endif %}
