# vi: set ft=yaml.jinja :

{% set major   =  salt['config.get']('osmajorrelease') %}
{% set version = 'icehouse' %}

{% if salt['config.get']('os_family') == 'RedHat' %}

/etc/pki/rpm-gpg/RPM-GPG-KEY-RDO-{{ version|capitalize }}:
  file.managed:
    - source:      salt://{{ sls }}/etc/pki/rpm-gpg/RPM-GPG-KEY-RDO-{{ version|capitalize }}
    - user:        root
    - group:       root
    - mode:       '0644'

openstack-{{ version }}:
  pkgrepo.managed:
    - baseurl:     http://repos.fedorapeople.org/repos/openstack/openstack-{{ version }}/epel-{{ major }}/
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-RDO-{{ version|capitalize }}
    - humanname:   OpenStack {{ version|capitalize }} Repository
    - enabled:     1
    - gpgcheck:    1
    - priority:    98
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-RDO-{{ version|capitalize }}

{% endif %}
