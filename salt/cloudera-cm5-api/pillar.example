# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

cloudera-cm5-api:
  pip:
    name:          cm-api

{% elif salt['config.get']('os_family') == 'Debian' %}

cloudera-cm5-api:
  pip:
    name:          cm_api

{% endif %}
