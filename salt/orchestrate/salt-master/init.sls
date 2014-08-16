# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

state_sls_salt-master:
  salt.state:
    - tgt:         roles:salt-master
    - tgt_type:    grain
    - sls:         salt-master

state_sls_salt-master_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:salt-master'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['salt-master']}
    - require:
      - salt:      state_sls_salt-master
