# vi: set ft=yaml.jinja :

include:
  -  debianutils
  -  elasticsearch

./plugin -install lmenezes/elasticsearch-kopf:
  cmd.run:
    - order:      -1
    - cwd:        /usr/share/elasticsearch/bin
    - unless:      test -d /usr/share/elasticsearch/plugins/kopf
    - require:
      - pkg:       debianutils
      - pkg:       elasticsearch
