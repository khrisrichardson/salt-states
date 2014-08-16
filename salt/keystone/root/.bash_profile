{% set minions = salt['roles.dict']('keystone', out='nodename') -%}
{% if  minions['keystone'] -%}
export      OS_AUTH_URL="http://{{ minions['keystone'][0] }}:5000/v2.0/"
export      OS_PASSWORD="{{ salt['config.get']('keystone:admin_password') }}"
export   OS_TENANT_NAME="admin"
export      OS_USERNAME="admin"
export   OS_REGION_NAME="RegionOne"
export SERVICE_ENDPOINT="http://{{ minions['keystone'][0] }}:35357/v2.0"
export    SERVICE_TOKEN="{{ salt['config.get']('keystone:admin_token') }}"
{% endif -%}
