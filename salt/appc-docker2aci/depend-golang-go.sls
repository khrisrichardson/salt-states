# vi: set ft=yaml.jinja :

include:
  -  gcc
  -  git
  -  golang-go

go get docker2aci:
  cmd.run:
    - name:        go get github.com/appc/docker2aci
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       gcc
      - pkg:       git
      - pkg:       golang-go
