{% from 'kubernetes/map.jinja' import map with context %}

include:
  -  curl

curl hyperkube:
  cmd.run:
    - name:      |-
                 ( curl -L  https://storage.googleapis.com/kubernetes-release/release/{{ map.get('version') }}/bin/linux/amd64/hyperkube
                        -o /opt/bin/hyperkube \
                        -z /opt/bin/hyperkube
                 )
    - require:
      - pkg:       curl
