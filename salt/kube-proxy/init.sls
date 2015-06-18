# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  kubernetes

/etc/default/kube-proxy:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/default/kube-proxy
    - user:        root
    - group:       root
    - mode:       '0644'

/usr/bin/kube-proxy:
  file.symlink:
    - target:     /usr/local/src/github.com/GoogleCloudPlatform/kubernetes/output/go/bin/proxy
    - require:
      - cmd:       go build kubernetes
