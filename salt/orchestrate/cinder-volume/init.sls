# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cinder-volume:
  salt.state:
    - tgt:         roles:cinder-volume
    - tgt_type:    grain
    - sls:         cinder-volume
    - require:
      - salt:      state_sls_salt-minion

state_sls_cinder-volume_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cinder-volume'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cinder-volume']}
    - require:
      - salt:      state_sls_cinder-volume
