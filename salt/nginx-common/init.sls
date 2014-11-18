# vi: set ft=yaml.jinja :

{% from  'nginx/map.jinja'
   import nginx
   with   context %}
{% from  'nginx-common/map.jinja'
   import nginx_common
   with   context %}

nginx-common:
  pkg.installed:
    - name:     {{ nginx_common['pkg']['name'] }}
  service.running:
    - name:        nginx
    - enable:      True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - watch:
      - pkg:       nginx-common
   {% endif %}

#-------------------------------------------------------------------------------
# TODO: test whether overrides can be dealt with in /etc/nginx.d/
#-------------------------------------------------------------------------------

/etc/nginx/fastcgi_params:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/nginx/fastcgi_params
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       nginx-common
    - watch_in:
      - service:   nginx-common

#-------------------------------------------------------------------------------
# TODO: test whether overrides can be dealt with in /etc/nginx.d/
#-------------------------------------------------------------------------------

/etc/nginx/nginx.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/nginx/nginx.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       nginx-common
    - watch_in:
      - service:   nginx-common

/etc/nginx/sites-enabled/default:
  file.absent:
    - name:     {{ nginx_common['/etc/nginx/sites-enabled']['file']['name'] }}/default{{ nginx_common['conf']['extension'] }}
   {% if salt['config.get']('os_family') == 'Debian' %}
    - watch:
      - pkg:       nginx-common
   {% endif %}
    - watch_in:
      - service:   nginx-common

{% if salt['config.get']('os_family') == 'Debian' %}

/var/log/nginx:
  file.directory:
    - user:     {{ nginx['user']['name'] }}
    - group:    {{ nginx['group']['name'] }}
    - mode:       '0755'
    - watch:
      - pkg:       nginx-common

{% endif %}
