# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}
{% set nodename    = salt['config.get']('nodename') %}

netbase:
  pkg.installed:
    - name:     {{ salt['config.get']('netbase:pkg:name') }}

127.0.0.1:
  host.absent:
    - name:     {{ nodename }}
    - ip:          127.0.0.1

127.0.1.1:
  host.absent:
    - name:     {{ nodename }}
    - ip:          127.0.1.1

{% if salt['config.get']('virtual_subtype') == 'Docker' %}
{% for minion, items in salt['mine.get']('environment:' + environment, 'grains.item', expr_form='grain')|dictsort %}

{{ minion }}:
  host.present:
    - ip:       {{ items['fqdn_ip4'][0] }}
    - names:
      - {{ minion }}
      - {{ minion.split('.')[0] }}

{% endfor %}
{% endif %}
