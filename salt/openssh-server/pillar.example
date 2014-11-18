# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

openssh-server:
  service:
    name:          sshd

{% elif salt['config.get']('os_family') == 'Debian' %}

openssh-server:
  service:
    name:          ssh

{% endif %}
