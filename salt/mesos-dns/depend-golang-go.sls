# vi: set ft=yaml.jinja :

include:
  -  git
  -  golang-go

go get dns:
  cmd.run:
    - name:        go get github.com/miekg/dns
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       git
      - pkg:       golang-go

go get mesos-dns:
  cmd.run:
    - name:        go get github.com/mesosphere/mesos-dns
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       git
      - pkg:       golang-go

go build mesos-dns:
  cmd.wait:
    - name:        go build -o mesos-dns main.go
    - cwd:        /usr/local/src/github.com/mesosphere/mesos-dns
    - env:
      - GOPATH:   /usr/local
    - watch:
      - cmd:       go get dns
      - cmd:       go get mesos-dns

/usr/bin/mesos-dns:
  file.symlink:
    - target:     /usr/local/src/github.com/mesosphere/mesos-dns/mesos-dns
    - require:
      - cmd:       go build mesos-dns
