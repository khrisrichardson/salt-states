# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cinder-backup:
  salt.state:
    - tgt:         roles:cinder-backup
    - tgt_type:    grain
    - sls:         cinder-backup
    - require:
      - salt:      state_sls_salt-minion

state_sls_cinder-backup_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cinder-backup'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cinder-backup']}
    - require:
      - salt:      state_sls_cinder-backup
