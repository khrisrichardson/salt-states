# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

base-files:
  pkg:
    name:          filesystem

{% elif salt['config.get']('os_family') == 'Debian' %}

base-files:
  pkg:
    name:          base-files

{% endif %}
