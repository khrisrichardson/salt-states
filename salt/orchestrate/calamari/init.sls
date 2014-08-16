# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_calamari:
  salt.state:
    - tgt:         roles:calamari
    - tgt_type:    grain
    - sls:         calamari
    - require:
      - salt:      state_sls_salt-minion

state_sls_calamari_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:calamari'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['calamari']}
    - require:
      - salt:      state_sls_calamari
