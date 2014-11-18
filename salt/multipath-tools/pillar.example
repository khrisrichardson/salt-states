# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

multipath-tools:
  pkg:
    name:          device-mapper-multipath
  service:
    name:          multipathd

{% elif salt['config.get']('os_family') == 'Debian' %}

multipath-tools:
  pkg:
    name:          multipath-tools
  service:
    name:          multipath-tools

{% endif %}
