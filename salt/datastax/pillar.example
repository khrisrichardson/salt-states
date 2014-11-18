# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

datastax:
  pkgrepo:
    name:          datastax
    file:         /etc/yum.repos.d/datastax.repo

{% elif salt['config.get']('os_family') == 'Debian' %}

datastax:
  pkgrepo:
    name:          deb http://debian.datastax.com/community stable main
    file:         /etc/apt/sources.list.d/datastax.list

{% endif %}
