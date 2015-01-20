# vi: set ft=yaml.jinja :

{% set url     = 'https://api.github.com/repos/hashicorp/consul/tags' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; print json.loads(urllib.urlopen("' + url + '").read())[0].get("name").split("v")[1]') %}
{% set zip_url = 'https://dl.bintray.com/mitchellh/consul/' + version + '_linux_amd64.zip' %}

include:
  -  bsdtar
  -  wget

/usr/bin/consul:
  cmd.run:
    - cwd:        /usr/bin
    - name:      |-
                 ( wget -O - {{ zip_url }}                                     \
                 | bsdtar -xf-
                 )
    - unless:      test -f /usr/bin/consul
    - require:
      - pkg:       bsdtar
      - pkg:       wget
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - cmd:      /usr/bin/consul

/var/lib/consul:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
