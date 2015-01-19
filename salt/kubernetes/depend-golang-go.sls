# vi: set ft=yaml.jinja :

include:
  -  kubernetes.depend-git
  -  ca-certificates
  -  debianutils
  -  git
  -  golang-go
  -  mercurial

go build kubernetes:
  cmd.wait:
    - name:        make release
    - cwd:        /usr/local/src/github.com/GoogleCloudPlatform/kubernetes
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       debianutils
      - pkg:       golang-go
      - pkg:       mercurial
    - watch:
      - git:       https://github.com/GoogleCloudPlatform/kubernetes.git
