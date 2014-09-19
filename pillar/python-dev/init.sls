# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

python-dev:
  pkg:
    name:          python-devel

{% elif salt['config.get']('os_family') == 'Debian' %}

python-dev:
  pkg:
    name:          python-dev

{% endif %}
