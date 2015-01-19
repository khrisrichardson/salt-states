# vi: set ft=yaml.jinja :

include:
  -  fleet
  -  git

extend:
  go build fleet:
    cmd.wait:
      - watch:
        - git:     https://github.com/coreos/fleet.git

https://github.com/coreos/fleet.git:
  git.latest:
    - rev:         master
    - force:       True
    - target:     /usr/local/src/github.com/coreos/fleet
    - require:
      - pkg:       git
