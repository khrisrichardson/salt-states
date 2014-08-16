# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'Debian' %}

ruby-ffi-rzmq:
  pkg.installed:   []

{% endif %}
