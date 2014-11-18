# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

libzmq3-dev:
  pkg:
    name:          zeromq3-devel

{% elif salt['config.get']('os_family') == 'Debian' %}

libzmq3-dev:
  pkg:
    name:          libzmq3-dev

{% endif %}
