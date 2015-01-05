# vi: set ft=yaml.jinja :

include:
  - .depend-apache2
  -  openstack-dashboard-ubuntu-theme
  -  postfix

openstack-dashboard:
  pkg.installed:   []

/etc/openstack-dashboard/local_settings.py:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/openstack-dashboard/local_settings.py
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       openstack-dashboard
