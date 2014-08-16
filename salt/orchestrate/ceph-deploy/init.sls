# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceph-deploy:
  salt.state:
    - tgt:         roles:ceph-deploy
    - tgt_type:    grain
    - sls:         ceph-deploy
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceph-deploy_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceph-deploy'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceph-deploy']}
    - require:
      - salt:      state_sls_ceph-deploy
