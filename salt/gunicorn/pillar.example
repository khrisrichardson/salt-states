# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

gunicorn:
  pkg:
    name:          python-gunicorn

{% elif salt['config.get']('os_family') == 'Debian' %}

gunicorn:
  pkg:
    name:          gunicorn

{% endif %}
