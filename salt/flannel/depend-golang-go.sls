# vi: set ft=yaml.jinja :

include:
  -  flannel.depend-git
  -  golang-go
  -  linux-libc-dev

extend:
  /usr/bin/flanneld:
    file.symlink:
      - watch:
        - cmd:     go build flannel

go build flannel:
  cmd.wait:
    - name:      ./build
    - cwd:        /usr/local/src/github.com/coreos/flannel
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       golang-go
      - pkg:       linux-libc-dev
