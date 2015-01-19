# vi: set ft=yaml.jinja :

include:
  -  git
  -  golang-go
  -  mercurial

go get deis:
  cmd.run:
    - name:        go get -u -v github.com/deis/deis
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       git
      - pkg:       golang-go
      - pkg:       mercurial
