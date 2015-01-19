# vi: set ft=yaml.jinja :

include:
  - .depend-golang-go
  - .depend-supervisor

/etc/etcd:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/etc/etcd/etcd.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/etcd/etcd.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - unless:    |-
                 ( echo    "${bootstrap}"                                      \
                 | grep -q "true"
                 )
    - require:
      - file:     /etc/etcd

/etc/etcd/peer.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/etcd/peer.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - unless:    |-
                 ( echo    "${bootstrap}"                                      \
                 | grep -q "true"
                 )
    - require:
      - file:     /etc/etcd

/usr/bin/etcd:
  file.symlink:
    - target:     /usr/local/src/github.com/coreos/etcd/bin/etcd
