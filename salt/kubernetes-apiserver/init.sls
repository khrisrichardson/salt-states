# vi: set ft=yaml.jinja :

include:
  - .depend-nginx
  - .depend-openssl
  - .depend-supervisor
  -  kubernetes

/etc/default/kubernetes-apiserver:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/default/kubernetes-apiserver
    - user:        root
    - group:       root
    - mode:       '0644'

/usr/bin/kubernetes-apiserver:
  file.symlink:
    - target:     /usr/local/src/github.com/GoogleCloudPlatform/kubernetes/output/go/bin/apiserver
    - require:
      - cmd:       go build kubernetes
