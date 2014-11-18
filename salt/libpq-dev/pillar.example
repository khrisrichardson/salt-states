# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

libpq-dev:
  pkg:
    name:          postgresql-devel

{% elif salt['config.get']('os_family') == 'Debian' %}

libpq-dev:
  pkg:
    name:          libpq-dev

{% endif %}
