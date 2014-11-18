# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

cron:
  pkg:
    name:          cronie
  service:
    name:          crond

{% elif salt['config.get']('os_family') == 'Debian' %}

cron:
  pkg:
    name:          cron
  service:
    name:          cron

{% endif %}
