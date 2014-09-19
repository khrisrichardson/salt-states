# vi: set ft=yaml.jinja :

{% set url     = 'https://github.com/coreos/etcd/releases/latest' %}
{% set version =  salt['cmd.exec_code']('python', 'import urllib; print urllib.urlopen("' + url + '").geturl().split("/")[-1]') %}
{# set version = 'v0.4.3' #}

include:
  -  tar
  -  wget

#/usr/share/etcd-{{ version }}-linux-amd64:
# archive.extracted:
#   - name:            /usr/share
#   - source:           https://github.com/coreos/etcd/releases/download/{{ version }}/etcd-{{ version }}-linux-amd64.tar.gz
#   - archive_format:   tar
#   - source_hash:      md5=cd80c86b2f361478d7027281303d93c5

/usr/share/etcd-{{ version }}-linux-amd64:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - https://github.com/coreos/etcd/releases/download/{{ version }}/etcd-{{ version }}-linux-amd64.tar.gz \
                 | tar  -zxvf -
                 )
    - unless:      test -d /usr/share/etcd-{{ version }}-linux-amd64
    - require:
      - pkg:       tar
      - pkg:       wget

/usr/share/etcd:
  file.symlink:
    - target:     /usr/share/etcd-{{ version }}-linux-amd64
    - watch:
#     - archive:  /usr/share/etcd-{{ version }}-linux-amd64
      - cmd:      /usr/share/etcd-{{ version }}-linux-amd64
