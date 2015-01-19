# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'RedHat' %}

openstack-utils:
  pkg.installed:   []

{% endif %}
