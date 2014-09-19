# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}
{% set minions = salt['roles.dict']('ceph-deploy') %}

{% if not minions['ceph-deploy'] %}

/var/lib/ceph/bootstrap-radosgw:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       ceph

ceph auth get-or-create client.radosgw.gateway:
  cmd.run:
    - name:      |-
                 ( ceph --cluster {{ cluster }}                                \
                          auth       get-or-create client.radosgw.gateway      \
                          osd       'allow rwx'                                \
                          mon       'allow rw'                                 \
                         -o         /var/lib/ceph/bootstrap-radosgw/{{ cluster }}.keyring
                 )
    - unless:      test -f /var/lib/ceph/bootstrap-radosgw/{{ cluster }}.keyring
    - require:
      - pkg:       ceph
      - service:   ceph-mon
      - file:     /var/lib/ceph/bootstrap-radosgw

cp.push /var/lib/ceph/bootstrap-radosgw/{{ cluster }}.keyring:
  module.wait:
    - name:        cp.push
    - path:       /var/lib/ceph/bootstrap-radosgw/{{ cluster }}.keyring
    - unless:    |-
                 ( echo    "${bootstrap}"                                      \
                 | grep -q "true"
                 )
    - watch:
      - cmd:       ceph auth get-or-create client.radosgw.gateway

{% endif %}
