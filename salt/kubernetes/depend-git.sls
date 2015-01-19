# vi: set ft=yaml.jinja :

include:
  -  git
  -  kubernetes

https://github.com/GoogleCloudPlatform/kubernetes.git:
  git.latest:
    - rev:         master
    - user:        root
    - target:     /usr/local/src/github.com/GoogleCloudPlatform/kubernetes
    - require:
      - pkg:       git
