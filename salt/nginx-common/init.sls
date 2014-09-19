# vi: set ft=yaml.jinja :

nginx-common:
  pkg.installed:
    - name:     {{ salt['config.get']('nginx-common:pkg:name') }}
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
    - name:     {{ salt['config.get']('/etc/nginx/sites-enabled:file:name') }}/default{{ salt['config.get']('nginx-common:conf:extension') }}
   {% if salt['config.get']('os_family') == 'Debian' %}
    - watch:
      - pkg:       nginx-common
   {% endif %}
    - watch_in:
      - service:   nginx-common

{% if salt['config.get']('os_family') == 'Debian' %}

/var/log/nginx:
  file.directory:
    - user:     {{ salt['config.get']('nginx:user:name') }}
    - group:    {{ salt['config.get']('nginx:group:name') }}
    - mode:       '0755'
    - watch:
      - pkg:       nginx-common

{% endif %}
