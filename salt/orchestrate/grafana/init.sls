# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.elasticsearch
  -  orchestrate.graphite-web

state_sls_grafana:
  salt.state:
    - tgt:         roles:grafana
    - tgt_type:    grain
    - sls:         grafana
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_elasticsearch
      - salt:      state_sls_graphite-web

state_sls_grafana_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:grafana'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['grafana']}
    - require:
      - salt:      state_sls_grafana
