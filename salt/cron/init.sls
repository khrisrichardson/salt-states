# vi: set ft=yaml.jinja :

{% from  'cron/map.jinja'
   import cron
   with   context %}

cron:
  pkg.installed:
    - order:      -1
    - name:     {{ cron['pkg']['name'] }}
  service.running:
    - name:     {{ cron['service']['name'] }}
    - enable:      True
    - watch:
      - pkg:       cron
