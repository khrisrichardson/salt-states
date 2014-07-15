# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'Debian' %}

libapache2-mod-fastcgi:
  pkg.installed:   []

{% endif %}
