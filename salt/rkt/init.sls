# vi: set ft=yaml.jinja :

{% set url     = 'https://api.github.com/repos/coreos/rkt/tags' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; print json.loads(urllib.urlopen("' + url + '").read())[0].get("name")') %}
{% set tar_url = 'https://github.com/coreos/rkt/releases/download/' + version + '/rkt-' + version + '.tar.gz' %}

include:
  -  tar
  -  wget

/usr/share/rkt-{{ version }}:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - {{ tar_url }}                                     \
                 | tar  -zxf -
                 )
    - unless:      test -d /usr/share/rkt-{{ version }}
    - require:
      - pkg:       tar
      - pkg:       wget

/usr/share/rkt:
  file.symlink:
    - target:     /usr/share/rkt-{{ version }}
    - watch:
      - cmd:      /usr/share/rkt-{{ version }}

/usr/bin/rkt:
  file.symlink:
    - target:    /usr/share/rkt/rkt
    - require:
      - file:    /usr/share/rkt
