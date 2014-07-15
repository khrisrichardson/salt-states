# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  docker.{{ psls }}
  -  docker.cloudera-cm5-server
