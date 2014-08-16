# vi: set ft=yaml.jinja :

include:
  -  ca-certificates
  -  git
  -  golang-go

go get fleet:
  cmd.run:
    - name:        go get github.com/coreos/fleet
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       ca-certificates
      - pkg:       git
      - pkg:       golang-go
