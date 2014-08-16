# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-compute-docker:
  salt.state:
    - tgt:         roles:nova-compute-docker
    - tgt_type:    grain
    - sls:         nova-compute-docker
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-compute-docker_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-compute-docker'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-compute-docker']}
    - require:
      - salt:      state_sls_nova-compute-docker
