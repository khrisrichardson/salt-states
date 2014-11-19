# vi: set ft=yaml.jinja :

{% from 'php5-fpm/map.jinja' import map with context %}

include:
  -  php5

php5-fpm:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       php5-fpm

/etc/php5/fpm/pool.d/www.conf:
  file.absent:
    - name:     {{ map.get('/etc/php5/fpm/pool.d', {}).get('file', {}).get('name') }}/www.conf
    - watch_in:
      - service:   php5-fpm
