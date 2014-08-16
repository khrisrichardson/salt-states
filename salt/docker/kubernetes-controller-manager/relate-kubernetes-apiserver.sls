# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  docker.{{ psls }}
  -  docker.kubernetes-apiserver
