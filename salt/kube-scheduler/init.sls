# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  kubernetes

/etc/default/kube-scheduler:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/default/kube-scheduler
    - user:        root
    - group:       root
    - mode:       '0644'

/usr/bin/kube-scheduler:
  file.symlink:
    - target:     /usr/local/src/github.com/GoogleCloudPlatform/kubernetes/output/go/bin/scheduler
    - require:
      - cmd:       go build kubernetes
