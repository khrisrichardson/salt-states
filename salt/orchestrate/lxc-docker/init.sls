# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_lxc-docker:
  salt.state:
    - tgt:         roles:lxc-docker
    - tgt_type:    grain
    - sls:         lxc-docker
    - require:
      - salt:      state_sls_salt-minion

state_sls_lxc-docker_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:lxc-docker'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['lxc-docker']}
    - require:
      - salt:      state_sls_lxc-docker
