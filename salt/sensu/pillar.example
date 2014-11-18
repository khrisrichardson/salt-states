# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

sensu:
  pkgrepo:
    name:          sensu
    file:         /etc/yum.repos.d/sensu.repo

{% elif salt['config.get']('os_family') == 'Debian' %}

sensu:
  pkgrepo:
    name:          deb http://repos.sensuapp.org/apt sensu main
    file:         /etc/apt/sources.list.d/sensu.list

{% endif %}
