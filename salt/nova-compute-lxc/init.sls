# vi: set ft=yaml.jinja :

include:
  -  ceilometer-agent-compute
  -  neutron-plugin-openvswitch-agent
  -  nova-compute-libvirt

nova-compute-lxc:
  pkg.installed:   []

/etc/nova/nova-compute.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/nova/nova-compute.conf
    - user:        nova
    - group:       nova
    - mode:       '0600'
    - require:
      - pkg:       nova-compute-lxc
    - watch_in:
      - service:   nova-compute
