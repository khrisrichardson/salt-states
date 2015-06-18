# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  gcc
  -  git
  -  godep
  -  golang-go
  -  mercurial

lxd:
  pkgrepo.managed:
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       D5495F657635B973
    - ppa:         ubuntu-lxc/lxd-daily
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
    - require_in:
      - pkg:       golang-go

go get prometheus:
  cmd.run:
    - name:        go get github.com/prometheus/prometheus
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       git
      - pkg:       golang-go
      - pkg:       mercurial

godep restore:
  cmd.wait:
    - cwd:        /usr/local/src/github.com/prometheus/prometheus
    - require:
      - cmd:       go get godep
    - watch:
      - cmd:       go get prometheus

go get -d:
  cmd.wait:
    - cwd:        /usr/local/src/github.com/prometheus/prometheus
    - watch:
      - cmd:       godep restore

utility/embed-static.sh:
  cmd.wait:
    - name:    |-
               ( ./utility/embed-static.sh web/static web/templates \
               |   gofmt \
               >   web/blob/files.go
               )
    - cwd:        /usr/local/src/github.com/prometheus/prometheus
    - watch:
      - cmd:       go get prometheus

go build prometheus:
  cmd.wait:
    - name:      |-
                 ( go build -ldflags "
                            -X main.buildVersion  $( cat VERSION )
                            -X main.buildRevision $( git rev-parse --short      HEAD )
                            -X main.buildBranch   $( git rev-parse --abbrev-ref HEAD )
                            -X main.buildUser     root
                            -X main.buildDate     $( date +%Y%m%d-%H:%M:%S )
                            -X main.goVersion     $GOLANG_VERSION"
                 )
    - cwd:        /usr/local/src/github.com/prometheus/prometheus
    - watch:
      - cmd:       go get prometheus

go build prometheus/tools/rule_checker:
  cmd.wait:
    - name:        go build
    - cwd:        /usr/local/src/github.com/prometheus/prometheus/tools/rule_checker
    - watch:
      - cmd:       go get prometheus

/usr/bin/prometheus:
  file.symlink:
    - target:     /usr/local/src/github.com/prometheus/prometheus/prometheus
    - require:
      - cmd:       go build prometheus
