# vi: set ft=yaml.jinja :

{% set url     = 'https://bintray.com/jfrog/artifactory/artifactory/_latestVersion' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; print urllib.urlopen("' + url + '").url.split("/")[-2]') %}
{% set zip_url = 'http://dl.bintray.com/jfrog/artifactory/artifactory-' + version + '.zip' %}

include:
  -  openjdk-7-jre-headless
  -  bsdtar
  -  wget

artifactory:
  service.running:
    - enable:      True
    - require:
      - cmd:      /usr/share/artifactory/bin/installService.sh

/usr/share/artifactory-{{ version }}:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - {{ zip_url }}                                     \
                 | bsdtar -xf-
                 )
    - unless:      test -d /usr/share/artifactory-{{ version }}
    - require:
      - pkg:       bsdtar
      - pkg:       wget

/usr/share/artifactory:
  file.symlink:
    - target:     /usr/share/artifactory-{{ version }}
    - watch:
      - cmd:      /usr/share/artifactory-{{ version }}

/usr/share/artifactory/bin/installService.sh:
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0755'
    - replace:     False
    - require:
      - file:     /usr/share/artifactory
  cmd.run:
    - unless:      test -f /etc/init.d/artifactory
    - require:
      - file:     /usr/share/artifactory/bin/installService.sh
