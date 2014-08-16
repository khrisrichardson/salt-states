# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_java-common:
  salt.state:
    - tgt:         roles:java-common
    - tgt_type:    grain
    - sls:         java-common
    - require:
      - salt:      state_sls_salt-minion

state_sls_java-common_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:java-common'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['java-common']}
    - require:
      - salt:      state_sls_java-common
