# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

openssh-client:
  pkg:
    name:          openssh-clients

{% elif salt['config.get']('os_family') == 'Debian' %}

openssh-client:
  pkg:
    name:          openssh-client

{% endif %}
