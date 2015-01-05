# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  ifupdown
  -  neutron-common
  -  neutron-plugin-ml2
  -  procps

extend:
  /etc/network/interfaces:
    file:
      - text:      source /etc/network/interfaces.d/*.cfg

neutron-server:
  pkg.installed:   []
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - watch:
      - pkg:       neutron-server
#     - file:     /etc/neutron/api-paste.ini
      - file:     /etc/neutron/fwaas_driver.ini
      - file:     /etc/neutron/l3_agent.ini
      - file:     /etc/neutron/neutron.conf
#     - file:     /etc/neutron/policy.json
      - file:     /etc/neutron/vpn_agent.ini

{% if 'eth2' in salt['network.interfaces']()
   and not      salt['network.interfaces']()['eth2']['inet'][0]['address'] %}

/etc/network/interfaces.d/eth2.cfg
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/default/neutron-server
    - user:        root
    - group:       root
    - mode:       '0644'

{% endif %}

{% if not salt['config.get']('virtual_subtype') == 'Docker' %}

net.ipv4.ip_forward:
  sysctl.present:
    - value:       1
    - require:
      - pkg:       procps

{% endif %}
