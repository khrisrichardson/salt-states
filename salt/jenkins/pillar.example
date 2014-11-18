# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

jenkins:
  group:
    name:          jenkins

{% elif salt['config.get']('os_family') == 'Debian' %}

jenkins:
  group:
    name:          nogroup

{% endif %}
