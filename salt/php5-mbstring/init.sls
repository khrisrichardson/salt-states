# vi: set ft=yaml.jinja :

{% from  'php5-mbstring/map.jinja'
   import php5_mbstring
   with   context %}

include:
  -  php5

php5-mbstring:
  pkg.installed:
    - name:     {{ php5_mbstring['pkg']['name'] }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}
