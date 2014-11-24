# vi: set ft=yaml.jinja :

{% set version = '0.13.7' %}

include:
  -  openjdk-7-jre-headless

sbt:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - sbt:       https://dl.bintray.com/sbt/rpm/sbt-{{ version }}.rpm
     {% elif salt['config.get']('os_family') == 'Debian' %}
      - sbt:       https://dl.bintray.com/sbt/debian/sbt-{{ version }}.deb
     {% endif %}
