# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

procps:
  pkg:
    name:          initscripts
  service:
    name:          initscripts

{% elif salt['config.get']('os_family') == 'Debian' %}

procps:
  pkg:
    name:          procps
  service:
    name:          procps

{% endif %}
