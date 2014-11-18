# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

php5-mcrypt:
  pkg:
    name:          php53u-mcrypt

{% elif salt['config.get']('os_family') == 'Debian' %}

php5-mcrypt:
  pkg:
    name:          php5-mcrypt

{% endif %}
