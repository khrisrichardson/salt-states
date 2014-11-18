# vi: set ft=yaml.jinja :

{% from  'php5-mcrypt/map.jinja'
   import php5_mcrypt
   with   context %}

include:
  -  php5

php5-mcrypt:
  pkg.installed:
    - name:     {{ php5_mcrypt['pkg']['name'] }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}

{% if salt['config.get']('os_family') == 'Debian' %}

php5enmod mcrypt:
  cmd.run:
    - unless:      test -h /etc/php5/fpm/conf.d/20-mcrypt.ini
    - require:
      - pkg:       php5-mcrypt

{% endif %}
