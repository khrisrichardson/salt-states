# vi: set ft=yaml.jinja :

{% from 'radosgw/map.jinja' import map with context %}

include:
  - .depend-apache2
# - .depend-haproxy
  -  ceph

radosgw:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
    - require:
      - pkgrepo:   ceph-common
  service.running:
    - enable:      True
    - watch:
      - pkg:       radosgw
