# vi: set ft=yaml.jinja :

include:
  - .depend-logrotate
  - .depend-nginx
  -  build-essential
  -  checkinstall
  -  curl
  -  git-core
  -  gitlab-shell
  -  libcurl4-openssl-dev
  -  libffi-dev
  -  libgdbm-dev
  -  libicu-dev
  -  libncurses5-dev
  -  libpq-dev
  -  libxml2-dev
  -  libxslt1-dev
  -  libyaml-dev
  -  postfix
  -  python-docutils
  -  redis-server
  -  ruby2_0
  -  ruby2_0-dev
  -  ruby-bundler

extend:
  bundler:
    gem:
      - require:
        - pkg:     ruby2_0

https://github.com/gitlabhq/gitlabhq.git:
  git.latest:
    - rev:         6-5-stable
    - user:        git
    - force:       True
    - target:     /home/git/gitlab
    - require:
      - pkg:       git-core
      - user:      git

/home/git/gitlab/config/database.yml:
  file.managed:
    - source:      salt://{{ sls }}/home/git/gitlab/config/database.yml
    - user:        git
    - group:       git
    - mode:       '0640'
    - require:
      - git:       https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/config/gitlab.yml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/home/git/gitlab/config/gitlab.yml
    - user:        git
    - group:       git
    - mode:       '0644'
    - require:
      - git:       https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/config/initializers/rack_attack.rb:
  file.managed:
    - source:      salt://{{ sls }}/home/git/gitlab/config/initializers/rack_attack.rb
    - user:        git
    - group:       git
    - mode:       '0644'
    - require:
      - git:       https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/config/unicorn.rb:
  file.managed:
    - source:      salt://{{ sls }}/home/git/gitlab/config/unicorn.rb
    - user:        git
    - group:       git
    - mode:       '0644'
    - require:
      - git:       https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/log:
  file.directory:
    - user:        git
    - group:       git
    - mode:       '0755'
    - require:
      - git:       https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/public/uploads:
  file.directory:
    - user:        git
    - group:       git
    - mode:       '0755'
    - require:
      - git:       https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/tmp:
  file.directory:
    - user:        git
    - group:       git
    - mode:       '0755'
    - require:
      - git:       https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/tmp/pids:
  file.directory:
    - user:        git
    - group:       git
    - mode:       '0755'
    - require:
      - file:     /home/git/gitlab/tmp

/home/git/gitlab/tmp/sockets:
  file.directory:
    - user:        git
    - group:       git
    - mode:       '0755'
    - require:
      - file:     /home/git/gitlab/tmp

/home/git/gitlab-satellites:
  file.directory:
    - user:        git
    - group:       git
    - mode:       '0755'
    - require:
      - user:      git

bundle install --deployment --without development test mysql aws:
  cmd.wait:
    - cwd:        /home/git/gitlab
    - user:        git
    - unless:      bundle check
    - require:
      - gem:       bundler
    - watch:
      - file:     /home/git/gitlab/config/database.yml

echo yes | bundle exec rake gitlab:setup RAILS_ENV=production:
  cmd.wait:
    - cwd:        /home/git/gitlab
    - user:        git
    - unless:      bundle check
    - require:
      - gem:       bundler
      - user:      git
    - watch:
      - cmd:       bundle install --deployment --without development test mysql aws

/etc/init.d/gitlab:
  file.managed:
    - source:      salt://{{ sls }}/etc/init.d/gitlab
    - user:        root
    - group:       root
    - mode:       '0755'

gitlab:
  service.running:
    - enable:      True
    - require:
      - cmd:       echo yes | bundle exec rake gitlab:setup RAILS_ENV=production
      - file:     /etc/init.d/gitlab

bundle exec rake assets:precompile RAILS_ENV=production:
  cmd.wait:
    - cwd:        /home/git/gitlab
    - user:        git
    - require:
      - gem:       bundler
      - user:      git
    - watch:
      - service:   gitlab
