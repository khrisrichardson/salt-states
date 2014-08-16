# vi: set ft=yaml.jinja :

{% set version = '0.2-SNAPSHOT' %}

include:
  - .depend-git
  - .depend-maven
  -  elasticsearch

./plugin -install graphite -url file:///usr/local/src/github.com/spinscale/elasticsearch-plugin-graphite/target/releases/elasticsearch-plugin-graphite-{{ version }}.zip:
  cmd.wait:
    - order:      -1
    - cwd:        /usr/share/elasticsearch/bin
    - require:
      - pkg:       elasticsearch
    - watch_in:
      - file:     /etc/elasticsearch/elasticsearch.yml
      - service:   elasticsearch
