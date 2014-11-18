# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

nginx:
  group:
    name:          nginx
  user:
    name:          nginx

{% elif salt['config.get']('os_family') == 'Debian' %}

nginx:
  group:
    name:          www-data
  user:
    name:          www-data

{% endif %}
