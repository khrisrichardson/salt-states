# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ganglia-monitor:
  salt.state:
    - tgt:         roles:ganglia-monitor
    - tgt_type:    grain
    - sls:         ganglia-monitor
    - require:
      - salt:      state_sls_salt-minion

state_sls_ganglia-monitor_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ganglia-monitor'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ganglia-monitor']}
    - require:
      - salt:      state_sls_ganglia-monitor
