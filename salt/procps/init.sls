# vi: set ft=yaml.jinja :

{% from 'procps/map.jinja' import map with context %}

procps:
  pkg.installed:
    - order:      -1
    - name:     {{ map.get('pkg', {}).get('name') }}

{% if not salt['config.get']('virtual_subtype') == 'Docker' %}

net.core.netdev_max_backlog:
  sysctl.present:
    - value:       2500
    - require:
      - pkg:       procps

net.core.rmem_default:
  sysctl.present:
    - value:       524288
    - require:
      - pkg:       procps

net.core.rmem_max:
  sysctl.present:
    - value:       16777216
    - require:
      - pkg:       procps

net.core.wmem_default:
  sysctl.present:
    - value:       524288
    - require:
      - pkg:       procps

net.core.wmem_max:
  sysctl.present:
    - value:       16777216
    - require:
      - pkg:       procps

net.ipv4.tcp_no_metrics_save:
  sysctl.present:
    - value:       1
    - require:
      - pkg:       procps

{% endif %}
