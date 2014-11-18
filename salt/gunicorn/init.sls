# vi: set ft=yaml.jinja :

{% from  'gunicorn/map.jinja'
   import gunicorn
   with   context %}

gunicorn:
  pkg.installed:
    - name:     {{ gunicorn['pkg']['name'] }}
{% if salt['config.get']('os_family') == 'Debian' %}
  service.running:
    - enable:      True
    - sig:       '/usr/bin/gunicorn'
    - watch:
      - pkg:       gunicorn
{% endif %}

/var/log/gunicorn:
  file.directory:
    - user:        root
    - group:       adm
    - mode:       '0750'
    - require_in:
      - service:   gunicorn

/var/run/gunicorn:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '0775'
    - require_in:
      - service:   gunicorn
