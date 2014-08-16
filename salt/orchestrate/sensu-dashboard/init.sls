# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.sensu-server

state_sls_sensu-dashboard:
  salt.state:
    - tgt:         roles:sensu-dashboard
    - tgt_type:    grain
    - sls:         sensu-dashboard
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_sensu-server

state_sls_sensu-dashboard_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:sensu-dashboard'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['sensu-dashboard']}
    - require:
      - salt:      state_sls_sensu-dashboard
