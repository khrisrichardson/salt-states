# vi: set ft=yaml.jinja :

include:
  -  fleet.depend-git
  -  golang-go

extend:
  /usr/bin/fleetd:
    file.symlink:
      - watch:
        - cmd:     go build fleet

go build fleet:
  cmd.wait:
    - name:      ./build
    - cwd:        /usr/local/src/github.com/coreos/fleet
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       golang-go
