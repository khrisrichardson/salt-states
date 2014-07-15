# vi: set ft=yaml.jinja :

include:
  -  golang-go
# -  mercurial

/usr/local/src/libswarm:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

go get github.com/docker/libswarm/...:
  cmd.wait:
    - cwd:        /usr/local/src/libswarm
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       golang-go
#     - pkg:       mercurial

go install github.com/docker/libswarm/swarmd:
  cmd.wait:
    - cwd:        /usr/local/src/libswarm
    - env:
      - GOPATH:   /usr/local
    - watch:
      - cmd:       go get github.com/docker/libswarm/...
