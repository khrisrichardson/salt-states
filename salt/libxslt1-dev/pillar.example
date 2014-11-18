# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

libxslt1-dev:
  pkg:
    name:          libxslt-devel

{% elif salt['config.get']('os_family') == 'Debian' %}

libxslt1-dev:
  pkg:
    name:          libxslt1-dev

{% endif %}
