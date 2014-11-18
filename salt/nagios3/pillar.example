# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

nagios3:
  pkg:
    name:          nagios
  service:
    name:          nagios

{% elif salt['config.get']('os_family') == 'Debian' %}

nagios3:
  pkg:
    name:          nagios3
  service:
    name:          nagios3

{% endif %}
