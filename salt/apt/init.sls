# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'Debian' %}

apt:
  pkg.installed:   []

{% endif %}
