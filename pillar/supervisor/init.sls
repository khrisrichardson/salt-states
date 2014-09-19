# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

supervisor:
  service:
    name:          supervisord

/etc/supervisor/supervisord.conf:
  file:
    name:         /etc/supervisord.conf

{% elif salt['config.get']('os_family') == 'Debian' %}

supervisor:
  service:
    name:          supervisor

/etc/supervisor/supervisord.conf:
  file:
    name:         /etc/supervisor/supervisord.conf

{% endif %}
