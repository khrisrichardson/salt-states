# vi: set ft=yaml.jinja :

{% set url     = 'https://github.com/coreos/fleet/releases/latest' %}
{% set version =  salt['cmd.exec_code']('python', 'import urllib; print urllib.urlopen("' + url + '").geturl().split("/")[-1]') %}
{# set version = 'v0.5.0' #}

include:
  -  tar
  -  wget

#/usr/share/fleet-{{ version }}-linux-amd64:
# archive.extracted:
#   - name:            /usr/share
#   - source:           https://github.com/coreos/fleet/releases/download/{{ version }}/fleet-{{ version }}-linux-amd64.tar.gz
#   - archive_format:   tar
#   - source_hash:      md5=35464b3c8098a74f54e95ac36e41b233

/usr/share/fleet-{{ version }}-linux-amd64:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - https://github.com/coreos/fleet/releases/download/{{ version }}/fleet-{{ version }}-linux-amd64.tar.gz \
                 | tar  -zxvf -
                 )
    - unless:      test -d /usr/share/fleet-{{ version }}-linux-amd64
    - require:
      - pkg:       tar
      - pkg:       wget

/usr/share/fleet:
  file.symlink:
    - target:     /usr/share/fleet-{{ version }}-linux-amd64
    - watch:
#     - archive:  /usr/share/fleet-{{ version }}-linux-amd64
      - cmd:      /usr/share/fleet-{{ version }}-linux-amd64
