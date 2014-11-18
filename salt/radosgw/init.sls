# vi: set ft=yaml.jinja :

{% from  'radosgw/map.jinja'
   import radosgw
   with   context %}

include:
  - .depend-apache2
# - .depend-haproxy
  -  ceph

radosgw:
  pkg.installed:
    - name:     {{ radosgw['pkg']['name'] }}
    - require:
      - pkgrepo:   ceph-common
  service.running:
    - enable:      True
    - watch:
      - pkg:       radosgw
