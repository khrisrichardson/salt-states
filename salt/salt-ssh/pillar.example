# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

salt-ssh:
  pkg:
    name:          salt-master

{% elif salt['config.get']('os_family') == 'Debian' %}

salt-ssh:
  pkg:
    name:          salt-ssh

{% endif %}
