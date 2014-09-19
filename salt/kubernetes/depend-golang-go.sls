# vi: set ft=yaml.jinja :

include:
  -  kubernetes.depend-git
  -  ca-certificates
  -  debianutils
  -  git
  -  golang-go
  -  mercurial

#go get kubernetes:
# cmd.run:
#   - name:        go get github.com/GoogleCloudPlatform/kubernetes/...
#   - env:
#     - GOPATH:   /usr/local
#   - require:
#     - pkg:       ca-certificates
#     - pkg:       git
#     - pkg:       golang-go
#     - pkg:       mercurial

go build kubernetes:
  cmd.wait:
    - name:      ./hack/build-go.sh
    - cwd:        /usr/local/src/github.com/GoogleCloudPlatform/kubernetes
    - env:
      - GOPATH:   /usr/local
    - require:
      - pkg:       debianutils
      - pkg:       golang-go
      - pkg:       mercurial
    - watch:
      - git:       https://github.com/GoogleCloudPlatform/kubernetes.git
#     - cmd:       go get kubernetes
