# vi: set ft=yaml.jinja :

{% set url     = 'https://api.github.com/repos/hashicorp/terraform/tags' %}
{% set version =  salt['cmd.exec_code']('python', 'import json; import urllib; tags = json.loads(urllib.urlopen("' + url + '").read()); print [tag.get("name") for tag in tags if "rc" not in tag.get("name")][0]').split('v')[1] %}
{% set zip_url = 'https://dl.bintray.com/mitchellh/terraform/' + version + '_linux_amd64.zip' %}

include:
  -  bsdtar
  -  wget

/usr/bin/terraform:
  cmd.run:
    - cwd:        /usr/bin
    - name:      |-
                 ( wget -O - {{ zip_url }}                                     \
                 | bsdtar -xf-
                 )
    - unless:      test -f /usr/bin/terraform
    - require:
      - pkg:       bsdtar
      - pkg:       wget
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - cmd:      /usr/bin/terraform

/var/lib/terraform:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
