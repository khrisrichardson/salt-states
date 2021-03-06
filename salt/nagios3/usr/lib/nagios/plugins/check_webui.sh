#!/usr/bin/env bash
#
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
#
checkurl() {
  url=$1
  curl $url -o /dev/null
  echo $?
}

service=$1
host=$2

if [[ -z "$service" || -z "$host" ]]; then
  echo "UNKNOWN: Invalid arguments; Usage: check_webui.sh service_name host_name";
  exit 3;
fi

case "$service" in

jobtracker)
    jtweburl="http://$host:50030"
    if [[ `checkurl "$jtweburl"` -ne 0 ]]; then
      echo "WARNING: Jobtracker web UI not accessible : $jtweburl";
      exit 1;
    fi
    ;;
namenode)
    nnweburl="http://$host:50070"
    if [[ `checkurl "$nnweburl"` -ne 0 ]] ; then
      echo "WARNING: NameNode web UI not accessible : $nnweburl";
      exit 1;
    fi
    ;;
jobhistory)
    jhweburl="http://$host:51111/jobhistoryhome.jsp"
    if [[ `checkurl "$jhweburl"` -ne 0 ]]; then
      echo "WARNING: Jobhistory web UI not accessible : $jhweburl";
      exit 1;
    fi
    ;;
hbase)
    hbaseweburl="http://$host:60010/master-status"
    jhweburl="http://domU-12-31-39-16-DC-FB.compute-1.internal:51111/jobhistoryhome.jsp"
    if [[ `checkurl "$hbaseweburl"` -ne 0 ]]; then
      echo "WARNING: HBase Master web UI not accessible : $hbaseweburl";
      exit 1;
    fi
    ;;
*) echo "UNKNOWN: Invalid service name [$service], valid options [jobtracker|jobhistory|hbase|namenode]"
   exit 3
   ;;
esac

echo "OK: Successfully accessed $service Web UI"
exit 0;
