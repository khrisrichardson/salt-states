# vi: set ft=yaml.jinja :

include:
  -  git
  -  golang-go

go get swarm:
  cmd.run:
    - name:        go get -u github.com/docker/swarm
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       git
      - pkg:       golang-go
