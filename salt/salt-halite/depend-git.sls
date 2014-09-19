# vi: set ft=yaml.jinja :

{% set lib = salt['cmd.run']('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"') %}

include:
  -  git
  -  salt-halite

https://github.com/saltstack/halite:
  git.latest:
    - rev:         master
    - target:   {{ lib }}/halite
    - require:
      - pkg:       git
