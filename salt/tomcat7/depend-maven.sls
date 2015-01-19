# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  maven
  -  tomcat7

/root/pom.xml:
  file.managed:
    - source:      salt://{{ psls }}/root/pom.xml
