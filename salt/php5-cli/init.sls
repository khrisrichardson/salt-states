# vi: set ft=yaml.jinja :

{% from  'php5-cli/map.jinja'
   import php5_cli
   with   context %}

include:
  -  php5

php5-cli:
  pkg.installed:
    - name:     {{ php5_cli['pkg']['name'] }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}
