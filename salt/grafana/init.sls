# vi: set ft=yaml.jinja :

{% set environment =  salt['grains.get']('environment') %}
{% set url         = 'https://raw.githubusercontent.com/grafana/grafana/master/latest.json' %}
{% set version     =  salt['cmd.exec_code']('python', 'import json; import urllib; print json.loads(urllib.urlopen("' + url + '").read())["version"]') %}

include:
  - .depend-nginx
  -  tar
  -  wget

#/usr/share/grafana-{{ version }}:
# archive.extracted:
#   - name:            /usr/share
#   - source:           http://grafanarel.s3.amazonaws.com/grafana-{{ version }}.tar.gz
#   - archive_format:   tar
#   - source_hash:      md5=0953edba5a243069b142ae76f4a4c6af

/usr/share/grafana-{{ version }}:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - http://grafanarel.s3.amazonaws.com/grafana-{{ version }}.tar.gz \
                 | tar  -zxvf -
                 )
    - unless:      test -d /usr/share/grafana-{{ version }}
    - require:
      - pkg:       tar
      - pkg:       wget

/usr/share/grafana:
  file.symlink:
    - target:     /usr/share/grafana-{{ version }}
    - watch:
#     - archive:  /usr/share/grafana-{{ version }}
      - cmd:      /usr/share/grafana-{{ version }}

/usr/share/grafana/config.js:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/usr/share/grafana/config.js
    - user:        root
    - group:       root
    - mode:       '0664'
    - watch:
      - file:     /usr/share/grafana

/usr/share/grafana/app/dashboards/default.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/usr/share/grafana/app/dashboards/default.json
    - user:        root
    - group:       root
    - mode:       '0664'
    - watch:
      - file:     /usr/share/grafana

{% for minion in salt['mine.get']('environment:' + environment, 'grains.item', expr_form='grain')|sort %}
{% set host = minion.split('.')[0] %}

/usr/share/grafana/app/dashboards/{{ host }}.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/usr/share/grafana/app/dashboards/template.json
    - context:
        minion: {{ minion }}
    - user:        root
    - group:       root
    - mode:       '0664'
    - unless:    |-
                 ( echo    "${bootstrap}"                                      \
                 | grep -q "true"
                 )
    - watch:
      - file:     /usr/share/grafana

{% endfor %}
