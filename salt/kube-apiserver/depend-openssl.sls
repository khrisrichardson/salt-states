# vi: set ft=yaml.jinja :

{% set ST = salt['config.get']('openssl:subject:ST') %}
{% set L  = salt['config.get']('openssl:subject:L') %}
{% set O  = salt['config.get']('openssl:subject:O') %}

{% if  ST
   and L
   and O %}

include:
  -  python-openssl
  -  kube-apiserver

{% if  not salt['file.file_exists']('/etc/pki/tls/certs/kube-apiserver.crt')
   and not salt['file.file_exists']('/etc/pki/tls/certs/kube-apiserver.key') %}

/etc/pki/tls/certs/kube-apiserver.crt:
  module.run:
    - name:        tls.create_self_signed_cert
    - days:        1825
    - CN:          kube-apiserver
    - ST:       {{ ST }}
    - L:        {{ L }}
    - O:       '{{ O }}'
    - OU:          Domain Control Validated
    - require:
      - pkg:       python-openssl

{% endif %}
{% endif %}
