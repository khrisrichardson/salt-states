# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceph-mon:
  salt.state:
    - tgt:         roles:ceph-mon
    - tgt_type:    grain
    - sls:         ceph-mon
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceph-mon_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceph-mon'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceph-mon']}
    - require:
      - salt:      state_sls_ceph-mon
