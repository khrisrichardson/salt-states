# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

gmetad:
  pkg:
    name:          ganglia-gmetad

{% elif salt['config.get']('os_family') == 'Debian' %}

gmetad:
  pkg:
    name:          gmetad

{% endif %}
