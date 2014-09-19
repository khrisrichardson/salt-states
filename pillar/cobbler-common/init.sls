# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

cobbler-common:
  pkg:
    name:          cobbler

{% elif salt['config.get']('os_family') == 'Debian' %}

cobbler-common:
  pkg:
    name:          cobbler-common

{% endif %}
