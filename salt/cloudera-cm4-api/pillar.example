# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

cloudera-cm4-api:
  pip:
    name:          cm-api

{% elif salt['config.get']('os_family') == 'Debian' %}

cloudera-cm4-api:
  pip:
    name:          cm_api

{% endif %}
