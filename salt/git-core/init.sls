# vi: set ft=yaml.jinja :

include:
  -  bash
  -  python-apt

git-core:
  pkgrepo.managed:
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       A1715D88E1DF1F24
    - ppa:         git-core/ppa
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
  pkg.installed:
    - require:
      - pkgrepo:   git-core

git:
  user.present:
    - fullname:    GitLab
    - home:       /home/git
    - shell:      /bin/bash
    - createhome:  True
    - require:
      - pkg:       bash

git config --global core.autocrlf input:
  cmd.wait:
    - user:        git
    - watch:
      - pkg:       git-core

git config --global user.email 'gitlab@localhost':
  cmd.wait:
    - user:        git
    - watch:
      - pkg:       git-core

git config --global user.name 'gitlab':
  cmd.wait:
    - user:        git
    - watch:
      - pkg:       git-core

