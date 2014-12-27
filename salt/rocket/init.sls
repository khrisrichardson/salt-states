# vi: set ft=yaml.jinja :

{% set url     = 'https://api.github.com/repos/coreos/rocket/tags' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; print json.loads(urllib.urlopen("' + url + '").read())[0].get("name")') %}
{% set tar_url = 'https://github.com/coreos/rocket/releases/download/' + version + '/rocket-' + version + '.tar.gz' %}

include:
  -  tar
  -  wget

/usr/share/rocket-{{ version }}:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - {{ tar_url }}                                     \
                 | tar  -zxf -
                 )
    - unless:      test -d /usr/share/rocket-{{ version }}
    - require:
      - pkg:       tar
      - pkg:       wget

/usr/share/rocket:
  file.symlink:
    - target:     /usr/share/rocket-{{ version }}
    - watch:
      - cmd:      /usr/share/rocket-{{ version }}

/usr/bin/rkt:
  file.symlink:
    - target:    /usr/share/rocket/rkt
    - require:
      - file:    /usr/share/rocket
