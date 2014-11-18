# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

dnsutils:
  pkg:
    name:          bind-utils

{% elif salt['config.get']('os_family') == 'Debian' %}

dnsutils:
  pkg:
    name:          dnsutils

{% endif %}
