# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'RedHat' %}

ovirt-engine-setup-plugin-allinone:
  pkg.installed:   []

{% endif %}
