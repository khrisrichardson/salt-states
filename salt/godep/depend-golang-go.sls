# vi: set ft=yaml.jinja :

include:
  -  ca-certificates
  -  git
  -  golang-go

go get godep:
  cmd.run:
    - name:        go get github.com/tools/godep
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       ca-certificates
      - pkg:       git
      - pkg:       golang-go
