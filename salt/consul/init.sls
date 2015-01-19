# vi: set ft=yaml.jinja :

{% set url     = 'https://api.github.com/repos/hashicorp/consul/tags' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; print json.loads(urllib.urlopen("' + url + '").read())[0].get("name")') %}
{% set zip_url = 'https://github.com/hashicorp/consul/archive/' + version + '.zip' %}

include:
  -  bsdtar
  -  wget

/usr/share/consul-{{ version }}:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - {{ zip_url }}                                     \
                 | bsdtar -xf-
                 )
    - unless:      test -d /usr/share/consul-{{ version }}
    - require:
      - pkg:       bsdtar
      - pkg:       wget

/usr/share/consul:
  file.symlink:
    - target:     /usr/share/consul-{{ version }}
    - watch:
      - cmd:      /usr/share/consul-{{ version }}

/usr/bin/consul:
  file.symlink:
    - target:     /usr/share/consul/consul
    - watch:
      - cmd:      /usr/share/consul

/var/lib/consul:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
