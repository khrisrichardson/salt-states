# vi: set ft=yaml.jinja :

{% from  'php5-pdo/map.jinja'
   import php5_pdo
   with   context %}

include:
  -  php5

php5-pdo:
  pkg.installed:
    - name:     {{ php5_pdo['pkg']['name'] }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}
