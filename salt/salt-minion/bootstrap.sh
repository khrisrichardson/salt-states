#!/usr/bin/env bash

set -x

repository=https://github.com/khrisrichardson/salt-states.git
       ref=master

export DEBIAN_FRONTEND=noninteractive
export             PS4='$( date "+%s.%N ($LINENO) + " )'
export       bootstrap=true

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION:  Core logic.
#-------------------------------------------------------------------------------
main() {
    pkg_setup
    if ! test -f /usr/bin/salt-call
    then
        salt_bootstrap "${@}"
        salt_setup
        pygit2_setup
    fi
    salt_highstate
    salt_clean
    pkg_clean
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  pkg_clean
#   DESCRIPTION:  Clear local package repository cache.
#-------------------------------------------------------------------------------
pkg_clean() {
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
        if nc -nz ${ip} 3142
        then
            cat > /etc/apt/apt.conf.d/30proxy                           <<-EOF
	Acquire::http::Proxy "http://${ip}:3142";
	Acquire::http::Proxy::download.oracle.com "DIRECT";
	EOF
        fi
    fi
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  pygit2_setup
#   DESCRIPTION:  Configure pygit2.
#-------------------------------------------------------------------------------
pygit2_setup() {
    salt-call pkg.install software-properties-common
    salt-call pkg.mod_repo ppa:dennis/python                                   \
	          keyserver=hkp://keyserver.ubuntu.com:80                      \
			  keyid=F3FA6A64F50B4114
    salt-call pkg.install python-pygit2 refresh=True
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
#          NAME:  salt_highstate
#   DESCRIPTION:  Set environment, referenced by top.sls, and run highstate.
#-------------------------------------------------------------------------------
salt_highstate() {
    if ! grep -q environment /etc/salt/grains 2>/dev/null
    then
        if [[ "${ref}" =~ "master" ]]
        then
            environment=base
        else
            environment=${ref}
        fi
    salt-call grains.setval environment ${environment}
    fi
    rm -f                                /var/log/salt/highstate
    salt-call state.highstate --out-file=/var/log/salt/highstate               \
 || exit ${?}
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  salt_clean
#   DESCRIPTION:  Remove intermediate salt files.
#-------------------------------------------------------------------------------
salt_clean() {
    which supervisorctl                  &>/dev/null                           \
    &&    supervisorctl stop salt-minion &>/dev/null
    pkill                    salt-minion &>/dev/null

    rm -rf /etc/salt/minion_id
    rm -rf /etc/salt/pki/*/*
    rm -rf /var/run/gunicorn/*                                                 \
 || true
}

#----  FUNCTION  ---------------------------------------------------------------
#          NAME:  salt_setup
#   DESCRIPTION:  Configure salt-minion.
#-------------------------------------------------------------------------------
salt_setup() {
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
    cat    > /etc/salt/minion.d/salt-master.conf                        <<-EOF
	# vi: set ft=yaml.jinja :
	
	file_client:       local
	startup_states:    highstate
	EOF
}

main "${@}"
