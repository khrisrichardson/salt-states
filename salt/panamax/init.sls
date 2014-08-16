# vi: set ft=yaml.jinja :

{% set version = '0.1.2' %}

panamax:
  archive.extracted:
    - name:       /opt
    - source:      http://download.panamax.io/installer/pmx-installer-{{ version }}.zip
    - source_hash: md5=6870e0ca8fa581d2a5f73c8692f10880
    - archive_format:   zip
