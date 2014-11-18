# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

php5-pdo:
  pkg:
    name:          php53u-pdo

{% elif salt['config.get']('os_family') == 'Debian' %}

php5-pdo:
  pkg:
    name:          php5-common

{% endif %}
