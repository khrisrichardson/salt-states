# vi: set ft=yaml.jinja :

{% from  'php5-curl/map.jinja'
   import php5_curl
   with   context %}

include:
  -  php5

php5-curl:
  pkg.installed:
    - name:     {{ php5_curl['pkg']['name'] }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}
