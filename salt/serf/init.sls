# vi: set ft=yaml.jinja :

{% set url     = 'https://api.github.com/repos/hashicorp/serf/tags' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; tags = json.loads(urllib.urlopen("' + url + '").read()); print [tag.get("name") for tag in tags if "rc" not in tag.get("name")][0]').split('v')[1] %}
{% set zip_url = 'https://dl.bintray.com/mitchellh/serf/' + version + '_linux_amd64.zip' %}

include:
  -  bsdtar
  -  wget

/usr/bin/serf:
  cmd.run:
    - cwd:        /usr/bin
    - name:      |-
                 ( wget -O - {{ zip_url }}                                     \
                 | bsdtar -xf-
                 )
    - unless:      test -f /usr/bin/serf
    - require:
      - pkg:       bsdtar
      - pkg:       wget
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - cmd:      /usr/bin/serf

/var/lib/serf:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
