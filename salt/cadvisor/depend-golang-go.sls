# vi: set ft=yaml.jinja :

include:
  -  ca-certificates
  -  gcc
  -  git
  -  godep
  -  golang-go
  -  gomock
  -  libc6-dev
  -  mercurial

go build cadvisor:
  cmd.run:
    - name:        go build github.com/google/cadvisor
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       ca-certificates
      - pkg:       gcc
      - pkg:       git
      - pkg:       golang-go
      - pkg:       libc6-dev
      - pkg:       mercurial
      - cmd:       go get godep
      - cmd:       go get gomock
