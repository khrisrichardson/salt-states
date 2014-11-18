# vi: set ft=yaml.jinja :

{% from  'php5-fpm/map.jinja'
   import php5_fpm
   with   context %}

include:
  -  php5

php5-fpm:
  pkg.installed:
    - name:     {{ php5_fpm['pkg']['name'] }}
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   ius
   {% endif %}
  service.running:
    - name:     {{ php5_fpm['service']['name'] }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       php5-fpm

/etc/php5/fpm/pool.d/www.conf:
  file.absent:
    - name:     {{ php5_fpm['/etc/php5/fpm/pool.d']['file']['name'] }}/www.conf
    - watch_in:
      - service:   php5-fpm
