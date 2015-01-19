# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'RedHat' %}

openstack-selinux:
  pkg.installed:   []

{% endif %}
