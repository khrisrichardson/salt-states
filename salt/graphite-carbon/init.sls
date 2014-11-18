# vi: set ft=yaml.jinja :

{% from  'graphite-carbon/map.jinja'
   import graphite_carbon
   with   context %}

graphite-carbon:
  pkg.installed:
    - name:     {{ graphite_carbon['pkg']['name'] }}

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
    - name:     {{ graphite_carbon['/var/lib/carbon']['file']['name'] }}/rrd
    - user:     {{ graphite_carbon['user']['name'] }}
    - group:    {{ graphite_carbon['group']['name'] }}
    - mode:       '0755'
    - watch:
      - pkg:       graphite-carbon
