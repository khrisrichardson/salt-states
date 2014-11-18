# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

netbase:
  pkg:
    name:          setup

{% elif salt['config.get']('os_family') == 'Debian' %}

netbase:
  pkg:
    name:          netbase

{% endif %}
