# vi: set ft=yaml.jinja :

include:
  -  ceph

radosgw-agent:
  pkg.installed:
    - require:
      - pkgrepo:   ceph-common
  service.running:
    - enable:      True
    - watch:
      - pkg:       radosgw-agent

/etc/ceph/radosgw-agent:
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /etc/ceph

/etc/ceph/radosgw-agent/default.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/ceph/radosgw-agent/default.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/ceph/radosgw-agent
