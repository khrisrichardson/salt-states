# vi: set ft=yaml.jinja :

{% set codename = salt['config.get']('lsb_distrib_codename') %}
{% set os       = salt['config.get']('os')|lower %}

{% if os == 'ubuntu' %}

include:
  -  python-apt

{{ codename }} multiverse:
  pkgrepo.managed:
    - name:        deb http://us.archive.ubuntu.com/{{ os }}/ {{ codename }} multiverse
    - file:       /etc/apt/sources.list.d/flynn.list
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}

{% endif %}
