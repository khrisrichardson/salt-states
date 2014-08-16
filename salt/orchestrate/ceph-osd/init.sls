# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceph-osd:
  salt.state:
    - tgt:         roles:ceph-osd
    - tgt_type:    grain
    - sls:         ceph-osd
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceph-osd_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceph-osd'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceph-osd']}
    - require:
      - salt:      state_sls_ceph-osd
