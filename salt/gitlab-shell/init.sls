# vi: set ft=yaml.jinja :

include:
  -  git-core
  -  ruby2_0

https://github.com/gitlabhq/gitlab-shell.git:
  git.latest:
    - rev:         v1.8.0
    - user:        git
    - force:       True
    - target:     /home/git/gitlab-shell
    - require:
      - pkg:       git-core
      - user:      git

/home/git/gitlab-shell/config.yml:
  file.managed:
    - source:      salt://{{ sls }}/home/git/gitlab-shell/config.yml
    - user:        git
    - group:       git
    - mode:       '0644'
    - require:
      - git:       https://github.com/gitlabhq/gitlab-shell.git

./bin/install:
  cmd.wait:
    - cwd:        /home/git/gitlab-shell
    - user:        git
    - require:
      - pkg:       ruby2_0
    - watch:
      - file:     /home/git/gitlab-shell/config.yml
