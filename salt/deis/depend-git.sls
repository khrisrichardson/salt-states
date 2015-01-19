# vi: set ft=yaml.jinja :

include:
  -  deis
  -  git

extend:
  make -C client/ install:
    cmd.wait:
      - watch:
        - git:     https://github.com/deis/deis.git

https://github.com/deis/deis.git:
  git.latest:
    - rev:         master
    - user:        root
    - target:     /usr/local/src/github.com/deis/deis
    - require:
      - pkg:       git
