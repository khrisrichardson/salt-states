# vi: set ft=yaml.jinja :

{% set cluster =   salt['grains.get']('environment', 'ceph') %}
{% set host    =   salt['config.get']('host') %}
{% set minions =   salt['roles.dict']('ceph-deploy') %}
{% set import  = '/etc/ceph/' + cluster + '.client.admin.keyring' %}
{% set keyring = '/var/lib/ceph/tmp/' + cluster + '.mon.keyring' %}

{% if not minions['ceph-deploy'] %}

include:
  - .depend-supervisor
  -  ceph

ceph-mon:
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - name:        ceph-mon-all
    - watch:
      - pkg:       ceph
      - file:     /etc/ceph/{{ cluster }}.conf

/var/lib/ceph/mon/{{ cluster }}-{{ host }}:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       ceph

ceph-authtool --create-keyring {{ keyring }}:
  cmd.run:
    - name:      |-
                 ( ceph-authtool --cap               mon 'allow *'             \
                                 --create-keyring {{ keyring }}                \
                                 --gen-key                                     \
                                 --name              mon.
                 )
    - unless:    |-
                 (  test -f /var/lib/ceph/mon/{{ cluster }}-{{ host }}/keyring \
                 || test -f {{ keyring }}
                 )
    - require:
      - pkg:       ceph

ceph-authtool --create-keyring {{ import }}:
  cmd.run:
    - name:      |-
                 ( ceph-authtool --cap               mds 'allow'               \
                                 --cap               mon 'allow *'             \
                                 --cap               osd 'allow *'             \
                                 --create-keyring {{ import }}                 \
                                 --gen-key                                     \
                                 --name              client.admin              \
                                 --set-uid=0
                 )
    - unless:    |-
                 (  test -f /var/lib/ceph/mon/{{ cluster }}-{{ host }}/keyring \
                 || test -f {{ import }}
                 )
    - require:
      - pkg:       ceph

ceph-authtool {{ keyring }} --import-keyring {{ import }}:
  cmd.wait:
    - unless:    |-
                 (  test -f /var/lib/ceph/mon/{{ cluster }}-{{ host }}/keyring \
                 || ceph-authtool {{ keyring }} --list                         \
                 |  grep '^\[client.admin\]'
                 )
    - require:
      - pkg:       ceph
    - watch:
      - cmd:       ceph-authtool --create-keyring {{ keyring }}
      - cmd:       ceph-authtool --create-keyring {{ import }}

cp.push /etc/ceph/{{ cluster }}.client.admin.keyring:
  module.wait:
    - name:        cp.push
    - path:       /etc/ceph/{{ cluster }}.client.admin.keyring
    - unless:    |-
                 ( echo    "${bootstrap}"                                      \
                 | grep -q "true"
                 )
    - watch:
      - cmd:       ceph-authtool --create-keyring {{ keyring }}

cp.push /var/lib/ceph/bootstrap-mds/{{ cluster }}.keyring:
  module.wait:
    - name:        cp.push
    - path:       /var/lib/ceph/bootstrap-mds/{{ cluster }}.keyring
    - unless:    |-
                 ( echo    "${bootstrap}"                                      \
                 | grep -q "true"
                 )
    - watch:
      - cmd:       ceph-authtool --create-keyring {{ keyring }}

cp.push /var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring:
  module.wait:
    - name:        cp.push
    - path:       /var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring
    - unless:    |-
                 ( echo    "${bootstrap}"                                      \
                 | grep -q "true"
                 )
    - watch:
      - cmd:       ceph-authtool --create-keyring {{ keyring }}

{% endif %}
