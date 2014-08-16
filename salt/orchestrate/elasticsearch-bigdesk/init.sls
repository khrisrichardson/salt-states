# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_elasticsearch-bigdesk:
  salt.state:
    - tgt:         roles:elasticsearch-bigdesk
    - tgt_type:    grain
    - sls:         elasticsearch-bigdesk
    - require:
      - salt:      state_sls_salt-minion

state_sls_elasticsearch-bigdesk_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:elasticsearch-bigdesk'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['elasticsearch-bigdesk']}
    - require:
      - salt:      state_sls_elasticsearch-bigdesk
