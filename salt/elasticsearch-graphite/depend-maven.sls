# vi: set ft=yaml.jinja :

{% set version = '0.2-SNAPSHOT' %}

include:
  -  elasticsearch-graphite
  -  maven

extend:
  ./plugin -install graphite -url file:///usr/local/src/github.com/spinscale/elasticsearch-graphite-plugin/target/releases/elasticsearch-plugin-graphite-{{ version }}.zip:
    cmd:
      - watch:
        - cmd:     mvn package

mvn package:
  cmd.wait:
    - name:        mvn package -Dmaven.test.skip=true
    - cwd:        /usr/local/src/github.com/spinscale/elasticsearch-graphite-plugin
    - require:
      - file:     /usr/bin/mvn
