# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceph:
  salt.state:
    - tgt:         roles:ceph
    - tgt_type:    grain
    - sls:         ceph
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceph_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceph'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceph']}
    - require:
      - salt:      state_sls_ceph
