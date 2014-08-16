# vi: set ft=yaml.jinja :

include:
  -  git
  -  kubernetes

extend:
  ./hack/build-go.sh:
    cmd:
      - watch:
        - git:     https://github.com/GoogleCloudPlatform/kubernetes.git

https://github.com/GoogleCloudPlatform/kubernetes.git:
  git.latest:
    - rev:         master
    - user:        root
    - target:     /usr/local/src/github.com/GoogleCloudPlatform/kubernetes
    - require:
      - pkg:       git
