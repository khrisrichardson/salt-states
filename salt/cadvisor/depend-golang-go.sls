# vi: set ft=yaml.jinja :

include:
  -  ca-certificates
  -  gcc
  -  git
  -  golang-go
  -  gomock
  -  libc6-dev

go get cadvisor:
  cmd.run:
    - name:        go get github.com/google/cadvisor
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       ca-certificates
      - pkg:       gcc
      - pkg:       git
      - pkg:       golang-go
      - pkg:       libc6-dev
      - cmd:       go get gomock
