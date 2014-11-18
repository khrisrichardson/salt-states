# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

qpidd:
  pkg:
    name:          qpid-cpp-server

{% elif salt['config.get']('os_family') == 'Debian' %}

qpidd:
  pkg:
    name:          qpidd

{% endif %}
