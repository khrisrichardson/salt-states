# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_docker-registry:
  salt.state:
    - tgt:         roles:docker-registry
    - tgt_type:    grain
    - sls:         docker-registry
    - require:
      - salt:      state_sls_salt-minion

state_sls_docker-registry_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:docker-registry'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['docker-registry']}
    - require:
      - salt:      state_sls_docker-registry
