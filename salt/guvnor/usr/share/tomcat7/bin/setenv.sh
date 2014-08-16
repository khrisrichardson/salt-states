{% set roles = [] -%}
{% do  roles.append('dynaTrace-server') -%}
{% do  roles.append('socks5') -%}
{% set minions = salt['roles.dict'](roles) -%}
#-------------------------------------------------------------------------------
# TODO: tune garbage collector, memory, stack, etc.
# TODO: remove socksProxyHost workaround when services have been ported to AWS
#-------------------------------------------------------------------------------
CLASSPATH="${CLASSPATH}:/usr/share/java/log4j-1.2.jar:/usr/share/java/postgresql-jdbc4.jar"
JAVA_OPTS="${JAVA_OPTS} -Djava.awt.headless=true"
JAVA_OPTS="${JAVA_OPTS} -Djava.security.auth.login.config=${CATALINA_BASE}/conf/jaas.config"
JAVA_OPTS="${JAVA_OPTS} -verbose:gc"
JAVA_OPTS="${JAVA_OPTS} -Xloggc:/var/log/tomcat7/gc$.log"
JAVA_OPTS="${JAVA_OPTS} -Xms2048m"
JAVA_OPTS="${JAVA_OPTS} -Xmx4096m"
JAVA_OPTS="${JAVA_OPTS} -XX:+DisableExplicitGC"
JAVA_OPTS="${JAVA_OPTS} -XX:+HeapDumpOnOutOfMemoryError"
JAVA_OPTS="${JAVA_OPTS} -XX:HeapDumpPath=/var/log/tomcat7"
JAVA_OPTS="${JAVA_OPTS} -XX:MaxNewSize=1024m"
JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=1024m"
JAVA_OPTS="${JAVA_OPTS} -XX:NewSize=1024m"
JAVA_OPTS="${JAVA_OPTS} -XX:PermSize=1024m"
JAVA_OPTS="${JAVA_OPTS} -XX:+PrintGCDetails"
JAVA_OPTS="${JAVA_OPTS} -XX:+UseConcMarkSweepGC"
{% if minions['dynaTrace-server'] -%}
JAVA_OPTS="${JAVA_OPTS} -agentpath:/opt/dynatrace/agent/lib/libdtagent.so=name={{ sls }},server={{ minions['dynaTrace-server'][0] }},loglevel=warning"
{% endif -%}
{% if minions['socks5'] -%}
JAVA_OPTS="${JAVA_OPTS} -DsocksProxyHost={{ minions['socks5'][0] }}"
{% endif -%}

export CLASSPATH
export JAVA_OPTS
