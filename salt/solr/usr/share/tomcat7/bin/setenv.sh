{% set roles = [] -%}
{% do  roles.append('dynaTrace-server') -%}
{% do  roles.append('socks5') -%}
{% do  roles.append('zookeeper-server') -%}
{% set minions = salt['roles.dict'](roles) -%}
#-------------------------------------------------------------------------------
# TODO: tune garbage collector, memory, stack, etc.
# TODO: remove socksProxyHost workaround when services have been ported to AWS
#-------------------------------------------------------------------------------
JAVA_OPTS="${JAVA_OPTS} -Djava.awt.headless=true"
JAVA_OPTS="${JAVA_OPTS} -Dsolr.data.dir=/mnt/solr"
JAVA_OPTS="${JAVA_OPTS} -XX:+UseConcMarkSweepGC"
{% if salt['config.get']('maven3:coordinates').split(':')[2][0] == '4' -%}
JAVA_OPTS="${JAVA_OPTS} -Djetty.port=8080"
JAVA_OPTS="${JAVA_OPTS} -DnumShards=1"
{% endif -%}
{% if minions['zookeeper-server'] -%}
JAVA_OPTS="${JAVA_OPTS} -DzkHost={{ minions['zookeeper-server']|join(',') }}"
{% endif -%}
{% if minions['dynaTrace-server'] -%}
JAVA_OPTS="${JAVA_OPTS} -agentpath:/opt/dynatrace/agent/lib/libdtagent.so=name={{ sls }},server={{ minions['dynaTrace-server'][0] }},loglevel=warning"
{% endif -%}
{% if minions['socks5'] -%}
JAVA_OPTS="${JAVA_OPTS} -DsocksProxyHost={{ minions['socks5'][0] }}"
{% endif -%}

export JAVA_OPTS
