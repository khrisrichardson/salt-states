# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'RedHat' %}

yum-plugin-priorities:
  pkg.installed:   []


{% endif %}
