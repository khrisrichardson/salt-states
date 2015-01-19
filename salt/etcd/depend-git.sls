# vi: set ft=yaml.jinja :

include:
  -  etcd
  -  git

extend:
  go build etcd:
    cmd.wait:
      - watch:
        - git:     https://github.com/coreos/etcd.git

https://github.com/coreos/etcd.git:
  git.latest:
    - rev:         master
    - force:       True
    - target:     /usr/local/src/github.com/coreos/etcd
    - require:
      - pkg:       git
