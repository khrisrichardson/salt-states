# vi: set ft=yaml.jinja :

include:
  -  elasticsearch-graphite
  -  git

extend:
  mvn package:
    cmd:
      - watch:
        - git:     https://github.com/spinscale/elasticsearch-graphite-plugin

https://github.com/spinscale/elasticsearch-graphite-plugin:
  git.latest:
    - rev:        'master'
    - target:     /usr/local/src/github.com/spinscale/elasticsearch-plugin-graphite
    - require:
      - pkg:       git
