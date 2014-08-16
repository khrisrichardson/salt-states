# vi: set ft=yaml.jinja :

include:
  -  ca-certificates
  -  git
  -  golang-go

go get gomock:
  cmd.run:
    - name:        go get code.google.com/p/gomock/gomock
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       ca-certificates
      - pkg:       git
      - pkg:       golang-go
