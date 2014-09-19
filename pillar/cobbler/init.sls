# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

cobbler:
  service:
    name:          cobblerd

{% elif salt['config.get']('os_family') == 'Debian' %}

cobbler:
  service:
    name:          cobbler

{% endif %}
