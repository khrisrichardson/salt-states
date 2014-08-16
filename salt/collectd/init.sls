# vi: set ft=yaml.jinja :

include:
  - .depend-logrotate
{% if salt['config.get']('os_family') == 'RedHat' %}
  -  rpmforge-release
{% endif %}

collectd:
  pkg:
    - installed
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
