# vi: set ft=yaml.jinja :

{% set version = '0.0.1' %}

include:
  - .depend-git
  -  debianutils
  -  elasticsearch
  -  gradle

gradle jar:
  cmd.wait:
    - cwd:        /usr/local/src/github.com/viniciusccarvalho/elasticsearch-newrelic
    - require:
      - file:     /usr/bin/gradle

./plugin -install newrelic -url file:///usr/local/src/github.com/viniciusccarvalho/elasticsearch-newrelic/target/elasticsearch-newrelic-{{ version }}.jar:
  cmd.wait:
    - order:      -1
    - cwd:        /usr/share/elasticsearch/bin
    - unless:      test -d /usr/share/elasticsearch/plugins/newrelic
    - require:
      - pkg:       debianutils
      - pkg:       elasticsearch
    - watch:
      - cmd:       gradle jar
    - watch_in:
      - file:     /etc/elasticsearch/elasticsearch.yml
      - service:   elasticsearch
