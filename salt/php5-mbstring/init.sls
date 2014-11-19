# vi: set ft=yaml.jinja :

{% from 'php5-mbstring/map.jinja' import map with context %}

include:
  -  php5

php5-mbstring:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}
