# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

php5-mbstring:
  pkg:
    name:          php53u-mbstring

{% elif salt['config.get']('os_family') == 'Debian' %}

php5-mbstring:
  pkg:
    name:          php5

{% endif %}
