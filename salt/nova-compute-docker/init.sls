# vi: set ft=yaml.jinja :

include:
  -  ceilometer-agent-compute
  -  neutron-plugin-openvswitch-agent
  -  nova-compute-libvirt

/etc/nova/nova-compute.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/nova/nova-compute.conf
    - user:        nova
    - group:       nova
    - mode:       '0600'
    - require:
      - pkg:       nova-compute
    - watch_in:
      - service:   nova-compute

/etc/nova/rootwrap.d/docker.filters:
  file.managed:
    - source:      salt://{{ sls }}/etc/nova/rootwrap.d/docker.filters
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       nova-compute
