# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_glance-registry:
  salt.state:
    - tgt:         roles:glance-registry
    - tgt_type:    grain
    - sls:         glance-registry
    - require:
      - salt:      state_sls_salt-minion

state_sls_glance-registry_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:glance-registry'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['glance-registry']}
    - require:
      - salt:      state_sls_glance-registry
