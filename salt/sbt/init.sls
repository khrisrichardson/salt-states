# vi: set ft=yaml.jinja :

{% set family  =  salt['config.get']('os_family')|lower %}
{% set version = '0.13.7' %}

include:
  -  openjdk-7-jre-headless

sbt:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'Debian' %}
      - sbt:       https://dl.bintray.com/sbt/{{ family }}/sbt-{{ version }}.deb
     {% elif salt['config.get']('os_family') == 'RedHat' %}
      - sbt:       https://dl.bintray.com/sbt/rpm/sbt-{{ version }}.rpm
     {% endif %}
