# vi: set ft=yaml.jinja :

{% set version     = '0.8.1.1' %}
{% set tarball_url = 'http://www.us.apache.org/dist/kafka/' + version + '/kafka_2.10-' + version + '.tgz' %}

include:
# - .depend-git
# - .depend-sbt
  - .depend-supervisor
  -  tar
  -  wget

/usr/share/kafka_2.10-{{ version }}:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - {{ tarball_url }}                                 \
                 | tar  -zxf -
                 )
    - unless:      test -d /usr/share/kafka_2.10-{{ version }}
    - require:
      - pkg:       tar
      - pkg:       wget

/usr/share/kafka:
  file.symlink:
    - target:     /usr/share/kafka_2.10-{{ version }}
    - watch:
      - cmd:      /usr/share/kafka_2.10-{{ version }}

/usr/share/kafka/config:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0755'
    - require:
      - file:     /usr/share/kafka

/usr/share/kafka/config/log4j.properties:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/usr/share/kafka/config/log4j.properties
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /usr/share/kafka/config

/usr/share/kafka/config/server.properties:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/usr/share/kafka/config/server.properties
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /usr/share/kafka/config
