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

go get cadvisor:
  cmd.run:
    - name:        go get -d github.com/google/cadvisor
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

go build cadvisor:
  cmd.wait:
    - name:        godep go build github.com/google/cadvisor
    - watch:
      - cmd:       go get cadvisor
