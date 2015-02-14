# vi: set ft=yaml.jinja :

include:
  -  git
  -  golang-go
  -  mercurial

go get deis:
  cmd.run:
    - name:        go get -d github.com/deis/deis
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       git
      - pkg:       golang-go
      - pkg:       mercurial

go build deis:
  cmd.wait:
    - name:        make -C client/ install
    - cwd:        /usr/local/src/github.com/deis/deis
    - watch:
      - cmd:       go get deis

/usr/bin/deis:
  file.symlink:
    - target:     /usr/local/src/github.com/deis/deis/client/deis.py
    - require:
      - cmd:       go build deis
