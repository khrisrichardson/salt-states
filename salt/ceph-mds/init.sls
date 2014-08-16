# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}
{% set host    = salt['config.get']('host') %}
{% set minions = salt['roles.dict']('ceph-deploy') %}

{% if not minions['ceph-deploy'] %}

include:
  -  ceph

ceph-mds:
  pkg.installed:
    - require:
      - pkgrepo:   ceph-common
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - name:        ceph-mds-all
    - watch:
      - pkg:       ceph-mds

/var/lib/ceph/mds/{{ cluster }}-{{ host }}:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       ceph

ceph auth get-or-create mds.{{ host }}:
  cmd.run:
    - name:      |-
                 ( ceph --cluster {{ cluster }}                                \
                        --name       client.bootstrap-mds                      \
                        --keyring   /var/lib/ceph/bootstrap-mds/{{ cluster }}.keyring \
                          auth       get-or-create mds.{{ host }}              \
                          osd       'allow rwx'                                \
                          mds       'allow'                                    \
                          mon       'allow profile mds'                        \
                         -o         /var/lib/ceph/mds/{{ cluster }}-{{ host }}/keyring
    - onlyif:      test -f /var/lib/ceph/bootstrap-mds/{{ cluster }}.keyring
    - unless:      test -f /var/lib/ceph/mds/{{ cluster }}-{{ host }}/keyring
    - require:
      - pkg:       ceph
      - file:     /var/lib/ceph/mds/{{ cluster }}-{{ host }}

{% endif %}
