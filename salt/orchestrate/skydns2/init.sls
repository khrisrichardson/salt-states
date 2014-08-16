# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_skydns2:
  salt.state:
    - tgt:         roles:skydns2
    - tgt_type:    grain
    - sls:         skydns2
    - require:
      - salt:      state_sls_salt-minion

state_sls_skydns2_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:skydns2'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['skydns2']}
    - require:
      - salt:      state_sls_skydns2
