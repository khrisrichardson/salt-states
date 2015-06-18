# vi: set ft=yaml.jinja :

{% set url     = 'https://api.github.com/repos/appc/spec/tags' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; print json.loads(urllib.urlopen("' + url + '").read())[0].get("name")') %}
{% set tar_url = 'https://github.com/appc/spec/releases/download/' + version + '/appc-' + version + '.tar.gz' %}

include:
  -  tar
  -  wget

/usr/share/appc-{{ version }}:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - {{ tar_url }}                                     \
                 | tar  -zxf -
                 )
    - unless:      test -d /usr/share/appc-{{ version }}
    - require:
      - pkg:       tar
      - pkg:       wget

/usr/share/appc:
  file.symlink:
    - target:     /usr/share/appc-{{ version }}
    - watch:
      - cmd:      /usr/share/appc-{{ version }}

/usr/bin/actool:
  file.symlink:
    - target:    /usr/share/appc/actool
    - require:
      - file:    /usr/share/appc
