# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

debianutils:
  pkg:
    name:          which

{% elif salt['config.get']('os_family') == 'Debian' %}

debianutils:
  pkg:
    name:          debianutils

{% endif %}
