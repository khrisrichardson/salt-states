# vi: set ft=yaml.jinja :

{% set roles = [] %}
{% do  roles.append('graphite-carbon') %}
{% do  roles.append('influxdb') %}
{% set minions = salt['roles.dict'](roles) %}

{% if minions['graphite-carbon']
   or minions['influxdb'] %}

include:
  - .depend-logrotate
{% if salt['config.get']('os_family') == 'RedHat' %}
  -  rpmforge-release
{% endif %}

collectd:
  pkg.installed:
    - order:      -1
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - enablerepo:  rpmforge-testing
    - require:
      - pkgrepo:   rpmforge-testing
   {% endif %}
  service.running:
    - enable:      True
#   - reload:      True
    - watch:
      - pkg:       collectd

/etc/collectd.d:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - pkg:       collectd

{% else %}

collectd:
  pkg.removed:     []
  service.dead:
    - enable:      False
    - require_in:
      - pkg:       collectd

{% endif %}
