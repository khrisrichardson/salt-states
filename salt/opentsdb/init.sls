# vi: set ft=yaml.jinja :

{% set url     = 'https://api.github.com/repos/OpenTSDB/opentsdb/tags' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; tags = json.loads(urllib.urlopen("' + url + '").read()); print [tag.get("name") for tag in tags if "RC" not in tag.get("name")][0]').split('v')[1] %}

include:
  -  openjdk-7-jre-headless

opentsdb:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'Debian' %}
      - opentsdb:  https://github.com/OpenTSDB/opentsdb/releases/download/v{{ version }}/opentsdb-{{ version }}_all.deb
     {% elif salt['config.get']('os_family') == 'RedHat' %}
      - opentsdb:  https://github.com/OpenTSDB/opentsdb/releases/download/v{{ version }}/opentsdb-{{ version }}.noarch.rpm
     {% endif %}
  service.running:
    - enable:      True
    - watch:
      - pkg:       opentsdb

/etc/opentsdb/opentsdb.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/opentsdb/opentsdb.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       opentsdb
    - watch_in:
      - service:   opentsdb
