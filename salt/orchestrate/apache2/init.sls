# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_apache2:
  salt.state:
    - tgt:         roles:apache2
    - tgt_type:    grain
    - sls:         apache2
    - require:
      - salt:      state_sls_salt-minion

state_sls_apache2_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:apache2'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['apache2']}
    - require:
      - salt:      state_sls_apache2
