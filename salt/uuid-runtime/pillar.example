# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

uuid-runtime:
  pkg:
    name:          util-linux-ng

{% elif salt['config.get']('os_family') == 'Debian' %}

uuid-runtime:
  pkg:
    name:          uuid-runtime

{% endif %}
