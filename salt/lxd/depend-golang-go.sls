# vi: set ft=yaml.jinja :

include:
  -  gcc
  -  git
  -  golang-go
  -  lxc-dev
  -  make
  -  mercurial
  -  pkg-config

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

go get lxd:
  cmd.run:
    - name:        go get -v -d github.com/lxc/lxd/...
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       git
      - pkg:       golang-go
      - pkg:       mercurial

go build lxd:
  cmd.wait:
    - name:        make
    - require:
      - pkg:       gcc
      - pkg:       lxc-dev
      - pkg:       make
      - pkg:       pkg-config
    - watch:
      - cmd:       go get lxd
