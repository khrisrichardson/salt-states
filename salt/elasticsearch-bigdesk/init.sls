# vi: set ft=yaml.jinja :

include:
  -  debianutils
  -  elasticsearch

./plugin -install lukas-vlcek/bigdesk:
  cmd.run:
    - order:      -1
    - cwd:        /usr/share/elasticsearch/bin
    - unless:      test -d /usr/share/elasticsearch/plugins/bigdesk
    - require:
      - pkg:       debianutils
      - pkg:       elasticsearch
