# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

nis:
  pkg:
    name:          ypbind

{% elif salt['config.get']('os_family') == 'Debian' %}

nis:
  pkg:
    name:          nis

{% endif %}
