# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

salt-common:
  pkg:
    name:          salt

{% elif salt['config.get']('os_family') == 'Debian' %}

salt-common:
  pkg:
    name:          salt-common

{% endif %}
