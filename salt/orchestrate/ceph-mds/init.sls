# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceph-mds:
  salt.state:
    - tgt:         roles:ceph-mds
    - tgt_type:    grain
    - sls:         ceph-mds
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceph-mds_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceph-mds'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceph-mds']}
    - require:
      - salt:      state_sls_ceph-mds
