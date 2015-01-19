# vi: set ft=yaml.jinja :

{% set codename = salt['config.get']('lsb_distrib_codename') %}

{% if salt['config.get']('os') == 'Ubuntu' %}

include:
  -  ubuntu.multiverse

libapache2-mod-fastcgi:
  pkg:
    - installed
    - require:
      - pkgrepo:     {{ codename }} multiverse

{% endif %}
