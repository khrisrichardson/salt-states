# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

php5-cli:
  pkg:
    name:          php53u-cli

{% elif salt['config.get']('os_family') == 'Debian' %}

php5-cli:
  pkg:
    name:          php5-cli

{% endif %}
