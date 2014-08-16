# vi: set ft=yaml.jinja :

include:
  -  elasticsearch-newrelic
  -  git

extend:
  gradle jar:
    cmd:
      - watch:
        - git:     https://github.com/viniciusccarvalho/elasticsearch-newrelic

https://github.com/viniciusccarvalho/elasticsearch-newrelic:
   git.latest:
    - rev:         master
    - target:     /usr/local/src/github.com/viniciusccarvalho/elasticsearch-newrelic
    - require:
      - pkg:       git
