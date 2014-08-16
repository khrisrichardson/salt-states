# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  kubernetes

/etc/default/kubernetes-controller-manager:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/default/kubernetes-controller-manager
    - user:        root
    - group:       root
    - mode:       '0644'

/usr/bin/kubernetes-controller-manager:
  file.symlink:
    - target:     /usr/local/src/github.com/GoogleCloudPlatform/kubernetes/output/go/bin/controller-manager
    - require:
      - cmd:       go build kubernetes
