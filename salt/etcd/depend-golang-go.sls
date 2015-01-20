# vi: set ft=yaml.jinja :

include:
  -  etcd.depend-git
  -  golang-go

extend:
  /usr/bin/etcd:
    file.symlink:
      - watch:
        - cmd:     go build etcd

go build etcd:
  cmd.run:
    - name:      ./build
    - cwd:        /usr/local/src/github.com/coreos/etcd
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       golang-go
