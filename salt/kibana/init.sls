# vi: set ft=yaml.jinja :

{% set url         = 'https://api.github.com/repos/elasticsearch/kibana/tags' %}
{% set version     =  salt['cmd.exec_code']('python', 'import json; import urllib; print json.loads(urllib.urlopen("' + url + '").read())[0].get("name")').split('v')[1] %}
{% set tarball_url =  salt['cmd.exec_code']('python', 'import json; import urllib; print json.loads(urllib.urlopen("' + url + '").read())[0].get("tarball_url")') %}

include:
  - .depend-nginx
  -  tar
  -  wget

#/usr/share/kibana-{{ version }}:
# archive.extracted:
#   - name:            /usr/share
#   - source:        {{ tarball_url }}
#   - archive_format:   tar
#   - source_hash:      md5=e8e8d4611e223e455bd7c304dbfdb579

/usr/share/kibana-{{ version }}:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - {{ tarball_url }}                                 \
                 | tar  -zxf -
                   mv elasticsearch-kibana-* kibana-{{ version }}
                 )
    - unless:      test -d /usr/share/kibana-{{ version }}
    - require:
      - pkg:       tar
      - pkg:       wget

/usr/share/kibana:
  file.symlink:
    - target:     /usr/share/kibana-{{ version }}
    - watch:
#     - archive:  /usr/share/kibana-{{ version }}
      - cmd:      /usr/share/kibana-{{ version }}

/usr/share/kibana/app/dashboards/default.json:
  file.managed:
    - source:      salt://{{ sls }}/usr/share/kibana/app/dashboards/default.json
    - user:        root
    - group:       root
    - mode:       '0664'
    - require:
      - file:     /usr/share/kibana
