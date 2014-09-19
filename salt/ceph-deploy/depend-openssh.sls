# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  ceph.depend-openssh

ssh-keygen -q -N '' -t rsa -b 2048 -f /home/ceph/.ssh/id_rsa:
  cmd.run:
    - user:        ceph
    - unless:      test -f /home/ceph/.ssh/id_rsa
    - require:
      - file:     /home/ceph/.ssh

/home/ceph/.ssh/config:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/home/ceph/.ssh/config
    - user:        ceph
    - group:       ceph
    - mode:       '0600'
    - require:
      - file:     /home/ceph/.ssh

cp.push /home/ceph/.ssh/id_rsa.pub:
  module.wait:
    - name:        cp.push
    - path:       /home/ceph/.ssh/id_rsa.pub
    - unless:    |-
                 ( echo    "${bootstrap}"                                      \
                 | grep -q "true"
                 )
    - watch:
      - cmd:       ssh-keygen -q -N '' -t rsa -b 2048 -f /home/ceph/.ssh/id_rsa
