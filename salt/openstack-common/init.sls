# vi: set ft=yaml.jinja :

{% from  'openstack-common/map.jinja'
   import openstack_common
   with   context %}

include:
  -  python-apt
  -  ubuntu-cloud-keyring

openstack-common:
  pkgrepo.managed:
    - name:     {{ openstack_common['pkgrepo']['name'] }}
    - file:     {{ openstack_common['pkgrepo']['file'] }}
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
