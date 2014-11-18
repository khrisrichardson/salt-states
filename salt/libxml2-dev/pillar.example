# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

libxml2-dev:
  pkg:
    name:          libxml2-devel

{% elif salt['config.get']('os_family') == 'Debian' %}

libxml2-dev:
  pkg:
    name:          libxml2-dev

{% endif %}
