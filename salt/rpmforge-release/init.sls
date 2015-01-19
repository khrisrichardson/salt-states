# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'RedHat' %}

/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag:
  file.managed:
    - source:      salt://{{ sls }}/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag
    - user:        root
    - group:       root
    - mode:       '0644'

rpmforge:
  pkgrepo.managed:
    - file:       /etc/yum.repos.d/rpmforge.repo
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag
    - humanname:   RHEL $releasever - RPMforge.net - dag
    - mirrorlist:  http://mirrorlist.repoforge.org/el6/mirrors-rpmforge
    - enabled:     0
    - gpgcheck:    1
    - protect:     0
    - consolidate: True
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag

rpmforge-extras:
  pkgrepo.managed:
    - file:       /etc/yum.repos.d/rpmforge-extras.repo
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag
    - humanname:   RHEL $releasever - RPMforge.net - extras
    - mirrorlist:  http://mirrorlist.repoforge.org/el6/mirrors-rpmforge-extras
    - enabled:     0
    - gpgcheck:    1
    - protect:     0
    - consolidate: True
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag

rpmforge-testing:
  pkgrepo.managed:
    - file:       /etc/yum.repos.d/rpmforge-testing.repo
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag
    - humanname:   RHEL $releasever - RPMforge.net - testing
    - mirrorlist:  http://mirrorlist.repoforge.org/el6/mirrors-rpmforge-testing
    - enabled:     0
    - gpgcheck:    1
    - protect:     0
    - consolidate: True
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag

{% endif %}
