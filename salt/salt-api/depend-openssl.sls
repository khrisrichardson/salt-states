# vi: set ft=yaml.jinja :

{% set ST = salt['config.get']('openssl:subject:ST') %}
{% set L  = salt['config.get']('openssl:subject:L') %}
{% set O  = salt['config.get']('openssl:subject:O') %}

{% if  ST
   and L
   and O %}

include:
  -  python-openssl
  -  salt-api

{% if  not salt['file.file_exists']('/etc/pki/tls/certs/salt-api.crt')
   and not salt['file.file_exists']('/etc/pki/tls/certs/salt-api.key') %}

/etc/pki/tls/certs/salt-api.crt:
  module.run:
    - name:        tls.create_self_signed_cert
    - days:        1825
    - CN:          salt-api
    - ST:       {{ ST }}
    - L:        {{ L }}
    - O:       '{{ O }}'
    - OU:          Domain Control Validated
    - require:
      - pkg:       python-openssl

{% endif %}
{% endif %}
