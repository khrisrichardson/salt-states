# vi: set ft=yaml.jinja :

{% from 'ntp/map.jinja' import map with context %}

{% if      salt['config.get']('virtual') == 'VMware'
   or     (salt['config.get']('virtual') == 'physical'
   and not salt['config.get']('virtual_subtype')) %}

ntp:
  pkg.installed:
    - order:      -1
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - watch:
      - pkg:       ntp

/etc/ntp.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/ntp.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       ntp
    - watch_in:
      - service:   ntp

{% else %}

ntp:
  pkg.removed:     []
  service.dead:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      False
    - require_in:
      - pkg:       ntp

{% endif %}
