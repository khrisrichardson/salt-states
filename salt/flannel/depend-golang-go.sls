# vi: set ft=yaml.jinja :

include:
  -  ca-certificates
  -  git
  -  golang-go
  -  linux-libc-dev

go get flannel:
  cmd.run:
    - name:        go get github.com/coreos/flannel
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       ca-certificates
      - pkg:       git
      - pkg:       golang-go
      - pkg:       linux-libc-dev
