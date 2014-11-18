# vi: set ft=yaml.jinja :

{% from  'php5-json/map.jinja'
   import php5_json
   with   context %}

include:
  -  php5

php5-json:
  pkg.installed:
    - name:     {{ php5_json['pkg']['name'] }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}
