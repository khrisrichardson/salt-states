# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}
{% set devs    = salt['cmd.run']('ls -1d /dev/{s,{u,x,}v}d{b..z} 2>/dev/null').split('\n') %}
{% set fsid    = salt['config.get']('ceph:cluster:uuid') %}
{% set minions = salt['roles.dict']('ceph-deploy') %}

{% if not minions['ceph-deploy'] %}

include:
  - .depend-btrfs-tools
  - .depend-mount
  - .depend-parted
  -  ceph

{% for dev in devs %}
{% if  dev %}

ceph-disk prepare {{ dev }}:
  cmd.run:
    - name:      |-
                 ( ceph-disk prepare --cluster       {{ cluster }}             \
                                     --cluster-uuid  {{ fsid }}                \
                                     --fs-type btrfs {{ dev }}
                 )
    - unless:    |-
                 ( parted --script {{ dev }} print                             \
                 | egrep  -sq '^ 1.*ceph'
                 )
    - require:
      - pkg:       ceph

ceph-disk activate {{ dev }}:
  cmd.wait:
    - onlyif:      test -f /var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring
    - watch:
      - cmd:       ceph-disk prepare {{ dev }}

{% endif %}
{% endfor %}
{% endif %}
