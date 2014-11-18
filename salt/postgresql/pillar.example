# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

postgresql:
  pkg:
    name:          postgresql-server

{% elif salt['config.get']('os_family') == 'Debian' %}

postgresql:
  pkg:
    name:          postgresql

{% endif %}
