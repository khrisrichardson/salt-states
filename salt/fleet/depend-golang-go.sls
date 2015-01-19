# vi: set ft=yaml.jinja :

include:
  -  ca-certificates
  -  git
  -  golang-go

go get fleet:
  cmd.run:
    - name:        go get -d github.com/coreos/fleet
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       ca-certificates
      - pkg:       git
      - pkg:       golang-go

./build:
  cmd.wait:
    - cwd:        /usr/local/src/github.com/coreos/fleet
    - watch:
      - cmd:       go get fleet
