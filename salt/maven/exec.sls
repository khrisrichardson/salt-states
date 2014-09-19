mvn:
  cmd.run:
    - name:     . /etc/profile && mvn
    - require:
      - file:     /usr/bin/mvn
