# vi: set ft=yaml.jinja :

{% set version = '0.2-SNAPSHOT' %}

include:
  - .depend-git
  - .depend-maven
  -  debianutils
  -  elasticsearch

./plugin -install graphite -url file:///usr/local/src/github.com/spinscale/elasticsearch-graphite-plugin/target/releases/elasticsearch-plugin-graphite-{{ version }}.zip:
  cmd.wait:
    - order:      -1
    - cwd:        /usr/share/elasticsearch/bin
    - unless:      test -d /usr/share/elasticsearch/plugins/graphite
    - require:
      - pkg:       debianutils
      - pkg:       elasticsearch
    - watch_in:
      - file:     /etc/elasticsearch/elasticsearch.yml
      - service:   elasticsearch
