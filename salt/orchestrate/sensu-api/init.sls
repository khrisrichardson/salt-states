# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.sensu-server

state_sls_sensu-api:
  salt.state:
    - tgt:         roles:sensu-api
    - tgt_type:    grain
    - sls:         sensu-api
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_sensu-server

state_sls_sensu-api_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:sensu-api'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['sensu-api']}
    - require:
      - salt:      state_sls_sensu-api
