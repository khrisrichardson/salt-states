# vi: set ft=yaml.jinja :

{% set license_key = '' %}

{% if   salt['config.get']('os_family') == 'RedHat' %}

newrelic:
  license_key:  {{ license_key }}
  pkgrepo:
    name:          newrelic
    file:         /etc/yum.repos.d/newrelic.repo

{% elif salt['config.get']('os_family') == 'Debian' %}

newrelic:
  license_key:  {{ license_key }}
  pkgrepo:
    name:          deb http://apt.newrelic.com/debian/ newrelic
    file:         /etc/apt/sources.list.d/newrelic.list

{% endif %}
