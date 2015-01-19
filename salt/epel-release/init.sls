# vi: set ft=yaml.jinja :

{% set major = salt['config.get']('osmajorrelease') %}

epel:
  pkgrepo.managed:
#   - baseurl:     http://download.fedoraproject.org/pub/epel/$releasever/$basearch
    - file:       /etc/yum.repos.d/epel.repo
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}
    - humanname:   Extra Packages for Enterprise Linux {{ major }} - $basearch
    - mirrorlist:  https://mirrors.fedoraproject.org/metalink?repo=epel-{{ major }}&arch=$basearch
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}

epel-debuginfo:
  pkgrepo.managed:
#   - baseurl:     http://download.fedoraproject.org/pub/epel/{{ major }}/$basearch/debug
    - file:       /etc/yum.repos.d/epel.repo
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}
    - humanname:   Extra Packages for Enterprise Linux {{ major }} - $basearch - Debug
    - mirrorlist:  https://mirrors.fedoraproject.org/metalink?repo=epel-debug-{{ major }}&arch=$basearch
    - enabled:     0
    - gpgcheck:    1
    - consolidate: True
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}

epel-source:
  pkgrepo.managed:
#   - baseurl:     http://download.fedoraproject.org/pub/epel/{{ major }}/SRPMS
    - file:       /etc/yum.repos.d/epel.repo
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}
    - humanname:   Extra Packages for Enterprise Linux {{ major }} - $basearch - Source
    - mirrorlist:  https://mirrors.fedoraproject.org/metalink?repo=epel-source-{{ major }}&arch=$basearch
    - enabled:     0
    - gpgcheck:    1
    - consolidate: True
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}

epel-testing:
  pkgrepo.managed:
#   - baseurl:     http://download.fedoraproject.org/pub/epel/testing/{{ major }}/$basearch
    - file:       /etc/yum.repos.d/epel-testing.repo
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}
    - humanname:   Extra Packages for Enterprise Linux {{ major }} - Testing - $basearch
    - mirrorlist:  https://mirrors.fedoraproject.org/metalink?repo=testing-epel{{ major }}&arch=$basearch
    - enabled:     0
    - gpgcheck:    1
    - consolidate: True
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}

epel-testing-debuginfo:
  pkgrepo.managed:
#   - baseurl:     http://download.fedoraproject.org/pub/epel/testing/{{ major }}/$basearch/debug
    - file:       /etc/yum.repos.d/epel-testing.repo
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}
    - humanname:   Extra Packages for Enterprise Linux {{ major }} - Testing - $basearch - Debug
    - mirrorlist:  https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel{{ major }}&arch=$basearch
    - enabled:     0
    - gpgcheck:    1
    - consolidate: True
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}

epel-testing-source:
  pkgrepo.managed:
#   - baseurl:     http://download.fedoraproject.org/pub/epel/testing/{{ major }}/SRPMS
    - file:       /etc/yum.repos.d/epel-testing.repo
    - gpgkey:      file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}
    - humanname:   Extra Packages for Enterprise Linux {{ major }} - Testing - $basearch - Source
    - mirrorlist:  https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel{{ major }}&arch=$basearch
    - enabled:     0
    - gpgcheck:    1
    - consolidate: True
    - require:
      - file:     /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}

{% if salt['config.get']('os_family') == 'RedHat' %}

/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}:
  file.managed:
    - source:      salt://{{ sls }}/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ major }}
    - user:        root
    - group:       root
    - mode:       '0644'

{% endif %}
