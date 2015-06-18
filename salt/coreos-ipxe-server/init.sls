# vi: set ft=yaml.jinja :

{% set url     = 'https://github.com/kelseyhightower/coreos-ipxe-server/releases/latest' %}
{% set version =  salt['cmd.exec_code']('python', 'import urllib; print urllib.urlopen("' + url + '").geturl().split("/")[-1]') %}

include:
  - .depend-supervisor
  -  curl

curl coreos-ipxe-server:
  cmd.run:
    - name:      |-
                 ( curl -L  https://github.com/kelseyhightower/coreos-ipxe-server/releases/download/{{ version }}/coreos-ipxe-server-{{ version.split('v')[1] }}-linux-amd64 \
                        -o /opt/coreos-ipxe-server/bin/coreos-ipxe-server \
                        -z /opt/coreos-ipxe-server/bin/coreos-ipxe-server
                 )
    - require:
      - pkg:       curl
      - file:     /opt/coreos-ipxe-server/bin

/opt/coreos-ipxe-server:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/opt/coreos-ipxe-server/bin:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /opt/coreos-ipxe-server

/opt/coreos-ipxe-server/bin/coreos-ipxe-server:
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - cmd:       curl coreos-ipxe-server

/opt/coreos-ipxe-server/configs:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /opt/coreos-ipxe-server

/opt/coreos-ipxe-server/images:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /opt/coreos-ipxe-server

/opt/coreos-ipxe-server/profiles:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /opt/coreos-ipxe-server

/opt/coreos-ipxe-server/sshkeys:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /opt/coreos-ipxe-server
