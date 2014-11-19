# vi: set ft=yaml.jinja :

{% from 'graphite-carbon/map.jinja' import map with context %}

graphite-carbon:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}

{% if salt['config.get']('os_family') == 'RedHat' %}

carbon-aggregator:
  service.running:
    - enable:      True
    - watch:
      - pkg:       graphite-carbon

{% endif %}

carbon-cache:
  service.running:
    - enable:      True
#   - reload:      True
    - watch:
      - pkg:       graphite-carbon

/etc/carbon/storage-aggregation.conf:
  file.managed:
    - user:        root
    - group:       root
    - mode:       '0644'
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - watch_in:
      - service:   carbon-aggregator
   {% endif %}

{% if salt['config.get']('os_family') == 'Debian' %}

/etc/default/graphite-carbon:
  file.replace:
    - pattern:     CARBON_CACHE_ENABLED=false
    - repl:        CARBON_CACHE_ENABLED=true
    - watch:
      - pkg:       graphite-carbon
    - watch_in:
      - service:   carbon-cache

{% endif %}

/var/lib/carbon/rrd:
  file.directory:
    - name:     {{ map.get('/var/lib/carbon', {}).get('file', {}).get('name') }}/rrd
    - user:     {{ map.get('user', {}).get('name') }}
    - group:    {{ map.get('group', {}).get('name') }}
    - mode:       '0755'
    - watch:
      - pkg:       graphite-carbon
