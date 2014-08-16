# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_pacemaker:
  salt.state:
    - tgt:         roles:pacemaker
    - tgt_type:    grain
    - sls:         pacemaker
    - require:
      - salt:      state_sls_salt-minion

state_sls_pacemaker_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:pacemaker'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['pacemaker']}
    - require:
      - salt:      state_sls_pacemaker
