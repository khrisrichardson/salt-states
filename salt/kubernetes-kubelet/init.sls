# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  kubernetes

/etc/default/kubernetes-kubelet:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/default/kubernetes-kubelet
    - user:        root
    - group:       root
    - mode:       '0644'

/etc/kubernetes/manifests:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /etc/kubernetes

/usr/bin/kubernetes-kubelet:
  file.symlink:
    - target:     /usr/local/src/github.com/GoogleCloudPlatform/kubernetes/output/go/bin/kubelet
    - require:
      - cmd:       go build kubernetes
