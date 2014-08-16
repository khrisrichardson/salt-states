# vi: set ft=yaml.jinja :

include:
  -  ca-certificates
  -  git
  -  golang-go
  -  mercurial

go get skydns2:
  cmd.run:
    - name:        go get github.com/skynetservices/skydns2
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       ca-certificates
      - pkg:       git
      - pkg:       golang-go
      - pkg:       mercurial
