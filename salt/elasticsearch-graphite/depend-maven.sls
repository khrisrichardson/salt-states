# vi: set ft=yaml.jinja :

{% set version = '0.2-SNAPSHOT' %}

include:
  -  elasticsearch-graphite
  -  maven

extend:
  ./plugin -install graphite -url file:///usr/local/src/github.com/spinscale/elasticsearch-plugin-graphite/target/releases/elasticsearch-plugin-graphite-{{ version }}.zip:
    cmd:
      - watch:
        - cmd:     mvn package

mvn package:
  cmd.wait:
    - cwd:        /usr/local/src/github.com/spinscale/elasticsearch-plugin-graphite
    - require:
      - file:     /usr/bin/mvn
