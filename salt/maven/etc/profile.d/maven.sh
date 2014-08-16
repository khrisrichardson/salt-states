# vi: set ft=bash.jinja :
{% set minions = salt['roles.dict']('socks5') -%}
unset  MAVEN_OPTS

{% if  salt['config.get']('force')|lower == 'true'
   or salt['environ.get']('force')|lower == 'true' -%}
MAVEN_OPTS="${MAVEN_OPTS} -Dmdep.overWriteReleases=true"
MAVEN_OPTS="${MAVEN_OPTS} -Dmdep.overWriteSnapshots=true"
{% endif -%}
{% if salt['config.get']('maven3:coordinates') -%}
MAVEN_OPTS="${MAVEN_OPTS} -Dmaven3.groupId={{    salt['config.get']('maven3:coordinates').split(':')[0]                    }}"
MAVEN_OPTS="${MAVEN_OPTS} -Dmaven3.artifactId={{ salt['config.get']('maven3:coordinates').split(':')[1]                    }}"
MAVEN_OPTS="${MAVEN_OPTS} -Dmaven3.type={{       salt['config.get']('maven3:coordinates').split(':')[2]|default('jar')     }}"
MAVEN_OPTS="${MAVEN_OPTS} -Dmaven3.version={{    salt['config.get']('maven3:coordinates').split(':')[3]|default('RELEASE') }}"
{% endif -%}
{% if salt['config.get']('maven3:repository') -%}
MAVEN_OPTS="${MAVEN_OPTS} -Drepository={{        salt['config.get']('maven3:repository', 'release') }}"
{% endif -%}
{% if minions['socks5'] -%}
MAVEN_OPTS="${MAVEN_OPTS} -DsocksProxyHost={{ minions['socks5'][0] }}"
{% endif -%}

export MAVEN_OPTS
