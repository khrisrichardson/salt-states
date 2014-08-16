# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_descartes:
  salt.state:
    - tgt:         roles:descartes
    - tgt_type:    grain
    - sls:         descartes
    - require:
      - salt:      state_sls_salt-minion

state_sls_descartes_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:descartes'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['descartes']}
    - require:
      - salt:      state_sls_descartes
