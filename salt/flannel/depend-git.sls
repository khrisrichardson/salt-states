# vi: set ft=yaml.jinja :

include:
  -  flannel
  -  git

extend:
  go build flannel:
    cmd.wait:
      - watch:
        - git:     https://github.com/coreos/flannel.git

https://github.com/coreos/flannel.git:
  git.latest:
    - rev:         master
    - force:       True
    - target:     /usr/local/src/github.com/coreos/flannel
    - require:
      - pkg:       git
