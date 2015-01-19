# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'RedHat' %}

ovirt-engine:
  pkg.installed:   []
  service.running:
    - enable:      True
    - watch:
      - pkg:       ovirt-engine

{% endif %}
