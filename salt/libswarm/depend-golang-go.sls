# vi: set ft=yaml.jinja :

include:
  -  ca-certificates
  -  git
  -  golang-go

go get libswarm:
  cmd.run:
    - name:        go get github.com/docker/libswarm/...
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       ca-certificates
      - pkg:       git
      - pkg:       golang-go
