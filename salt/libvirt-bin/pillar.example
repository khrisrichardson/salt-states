# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

libvirt-bin:
  pkg:
    name:          libvirt

{% elif salt['config.get']('os_family') == 'Debian' %}

libvirt-bin:
  pkg:
    name:          libvirt-bin

{% endif %}
