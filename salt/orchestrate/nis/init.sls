# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nis:
  salt.state:
    - tgt:         roles:nis
    - tgt_type:    grain
    - sls:         nis
    - require:
      - salt:      state_sls_salt-minion

state_sls_nis_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nis'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nis']}
    - require:
      - salt:      state_sls_nis
