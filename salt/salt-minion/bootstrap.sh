#!/usr/bin/env bash

set -x

repository=https://github.com/khrisrichardson/salt-states.git
       ref=master
 minion_id=${HOSTNAME}

export DEBIAN_FRONTEND=noninteractive
export             PS4='$( date "+%s.%N ($LINENO) + " )'
export       bootstrap=true

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION:  Core logic.
#-------------------------------------------------------------------------------
main() {
    if ! test -f /usr/bin/salt-call
    then
#       pkg_setup
        salt_bootstrap "${@}"
        pygit2_setup
        salt_minion_setup
    fi
    salt_call_state_highstate
    salt_cleanup
    pkg_cleanup
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  pkg_cleanup
#   DESCRIPTION:  Clear apt cache.
#-------------------------------------------------------------------------------
pkg_cleanup() {
    if test -f /usr/bin/apt-get
    then
      (
        apt-get -y clean
        apt-get -y autoclean
        apt-get -y autoremove
      ) &
    fi
    if test -f /usr/bin/yum
    then
      (
        yum clean all
      ) &
    fi
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  pkg_setup
#   DESCRIPTION:  Configure apt to use caching proxy.
#-------------------------------------------------------------------------------
pkg_setup() {
    if [ -d   /etc/apt/apt.conf.d ]
    then
        ip=$(  ip route list                                                   \
            | awk '/^default/ {print $3}'
            )
        cat > /etc/apt/apt.conf.d/30proxy                               <<-EOF
	Acquire::http::Proxy "http://${ip}:3142";
	Acquire::http::Proxy::download.oracle.com "DIRECT";
	EOF
    fi
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  pygit2_setup
#   DESCRIPTION:  Configure pygit2.
#-------------------------------------------------------------------------------
pygit2_setup() {
    salt-call --local pkg.install software-properties-common
    add-apt-repository -y ppa:dennis/python
    salt-call --local pkg.install python-pygit2 refresh=True
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  salt_bootstrap
#   DESCRIPTION:  Download and execute salt bootstrap script.
#-------------------------------------------------------------------------------
salt_bootstrap() {
    if [[ "${@}" =~ "git" ]]
    then
        url="https://raw.githubusercontent.com"
        url+="/saltstack/salt-bootstrap/develop/bootstrap-salt.sh"
    else
        url="https://bootstrap.saltstack.com"
    fi
    if test -f /usr/bin/python3
    then
        python3                                                         <<-EOF
	import urllib.request
	urllib.request.urlretrieve("${url}", "bootstrap-salt.sh")
	EOF
    else
        python -c "import urllib; print urllib.urlopen('${url}').read()"       \
      > bootstrap-salt.sh
    fi
    bash bootstrap-salt.sh -X "${@}"                                           \
 || true
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  salt_call_state_highstate
#   DESCRIPTION:  Set environment, referenced by top.sls, and run highstate.
#-------------------------------------------------------------------------------
salt_call_state_highstate() {
    if ! grep -q environment /etc/salt/grains 2>/dev/null
    then
        if [[ "${ref}" =~ "master" ]]
        then
            environment=base
        else
            environment=${ref}
        fi
    salt-call --local grains.setval environment ${environment}
    fi
    rm -f                                        /var/log/salt/highstate
    salt-call --local state.highstate --out-file=/var/log/salt/highstate       \
 || exit ${?}
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  salt_cleanup
#   DESCRIPTION:  Remove unneeded salt files.
#-------------------------------------------------------------------------------
salt_cleanup() {
    salt_minion_cleanup
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  salt_minion_cleanup
#   DESCRIPTION:  Remove intermediate files on salt-minion.
#-------------------------------------------------------------------------------
salt_minion_cleanup() {
    which supervisorctl                  &>/dev/null                           \
    &&    supervisorctl stop salt-minion &>/dev/null
    pkill                    salt-minion &>/dev/null

    rm -rf /etc/salt/minion_id
    rm -rf /etc/salt/pki/*/*
    rm -rf /var/run/gunicorn/*                                                 \
 || true
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  salt_minion_setup
#   DESCRIPTION:  Configure salt-minion.
#-------------------------------------------------------------------------------
salt_minion_setup() {
    if [[ "${ref}" =~ "master" ]]
    then
        environment=base
    else
        environment=${ref}
    fi
    mkdir -p /etc/salt/minion.d
    cat    > /etc/salt/minion.d/environment.conf                        <<-EOF
	# vi: set ft=yaml.jinja :
	
	environment:       ${environment}
	EOF
    cat    > /etc/salt/minion.d/fileserver_backend.conf                 <<-EOF
	# vi: set ft=yaml.jinja :
	
	fileserver_backend:
	  - git

	gitfs_provider:    pygit2
	gitfs_remotes:
	  - ${repository}
	gitfs_root:        salt
	EOF
    cat    > /etc/salt/minion.d/master.conf                             <<-EOF
	# vi: set ft=yaml.jinja :
	
	file_client:       local
	startup_states:    highstate
	EOF
    # Workaround https://github.com/saltstack/salt/issues/17963.
         py="$( salt-call --local config.get salt path )/utils/jinja.py"
    pattern="if opts.get('file_client', 'remote') == 'local':"
       repl="if opts.get('file_client', 'remote') == 'local' "
      repl+="and 'roots' in opts.get('fileserver_backend', []):"

    salt-call --local file.replace ${py} pattern="${pattern}" repl="${repl}"
}

main "${@}"
