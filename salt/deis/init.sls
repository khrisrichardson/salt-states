# vi: set ft=yaml.jinja :

include:
  - .depend-git

make -C client/ install:
  cmd.wait:
    - cwd:        /usr/local/src/github.com/deis/deis

/usr/bin/deis:
  file.symlink:
    - target:     /usr/local/src/github.com/deis/deis/client/deis.py
    - require:
      - cmd:       make -C client/ install
