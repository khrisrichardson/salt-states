# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

netcat:
  pkg:
    name:          nc

{% elif salt['config.get']('os_family') == 'Debian' %}

netcat:
  pkg:
    name:          netcat

{% endif %}
