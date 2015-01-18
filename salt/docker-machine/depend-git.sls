# vi: set ft=yaml.jinja :

include:
  -  docker-machine
  -  git

extend:
  ./script/build:
    cmd.wait:
      - cwd:      /usr/local/src/github.com/docker/machine
      - watch:
        - git:     https://github.com/docker/machine.git

https://github.com/docker/machine.git:
  git.latest:
    - rev:         master
    - force:       True
    - target:     /usr/local/src/github.com/docker/machine
    - require:
      - pkg:       git
