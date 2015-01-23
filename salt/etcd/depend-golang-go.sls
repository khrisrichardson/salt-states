# vi: set ft=yaml.jinja :

include:
  -  etcd.depend-git
  -  golang-go
  -  python-apt

extend:
  /usr/bin/etcd:
    file.symlink:
      - watch:
        - cmd:     go build etcd

etcd:
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

go build etcd:
  cmd.run:
    - name:      ./build
    - cwd:        /usr/local/src/github.com/coreos/etcd
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       golang-go
