# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

nfs-kernel-server:
  pkg:
    name:          nfs-utils
  service:
    name:          nfs

{% elif salt['config.get']('os_family') == 'Debian' %}

nfs-kernel-server:
  pkg:
    name:          nfs-kernel-server
  service:
    name:          nfs-kernel-server

{% endif %}
