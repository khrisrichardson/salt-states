# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nagios-nrpe-server:
  salt.state:
    - tgt:         roles:nagios-nrpe-server
    - tgt_type:    grain
    - sls:         nagios-nrpe-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_nagios-nrpe-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nagios-nrpe-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nagios-nrpe-server']}
    - require:
      - salt:      state_sls_nagios-nrpe-server
