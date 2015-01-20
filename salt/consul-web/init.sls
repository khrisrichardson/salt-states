# vi: set ft=yaml.jinja :

{% set url     = 'https://api.github.com/repos/hashicorp/consul/tags' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; print json.loads(urllib.urlopen("' + url + '").read())[0].get("name").split("v")[1]') %}
{% set zip_url = 'https://dl.bintray.com/mitchellh/consul/' + version + '_web_ui.zip' %}

include:
  - .depend-supervisor

/usr/share/consul:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'

/usr/share/consul/dist:
  cmd.run:
    - cwd:        /usr/share/consul
    - name:      |-
                 ( wget -O - {{ zip_url }}                                     \
                 | bsdtar -xf-
                 )
    - unless:      test -d /usr/share/consul/dist
    - require:
      - pkg:       bsdtar
      - pkg:       wget
      - file:     /usr/share/consul
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - cmd:      /usr/share/consul/dist
