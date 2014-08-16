# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  kubernetes

/etc/default/kubernetes-proxy:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/default/kubernetes-proxy
    - user:        root
    - group:       root
    - mode:       '0644'

/usr/bin/kubernetes-proxy:
  file.symlink:
    - target:     /usr/local/src/github.com/GoogleCloudPlatform/kubernetes/output/go/bin/proxy
    - require:
      - cmd:       go build kubernetes
