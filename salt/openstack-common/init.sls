# vi: set ft=yaml.jinja :

{% from 'openstack-common/map.jinja' import map with context %}

include:
  -  python-apt
  -  ubuntu-cloud-keyring

openstack-common:
  pkgrepo.managed:
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
