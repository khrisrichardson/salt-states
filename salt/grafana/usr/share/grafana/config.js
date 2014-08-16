{% set roles = [] -%}
{% do  roles.append('elasticsearch') -%}
{% do  roles.append('graphite-web') -%}
{% do  roles.append('influxdb') -%}
{% set minions = salt['roles.dict'](roles) -%}
/** @scratch /configuration/config.js/1
 * == Configuration
 * config.js is where you will find the core Grafana configuration. This file contains parameter that
 * must be set before kibana is run for the first time.
 */
define(['settings'],
function (Settings) {
  "use strict";

  return new Settings({

    {% if   minions['elasticsearch'] -%}

    elasticsearch: "http://{{ minions['elasticsearch'][0] }}:9200",
    grafana_index: "grafana-dash",

    {% endif -%}

    {% if   minions['influxdb'] -%}

    datasources: {
    {% for  minion in minions['influxdb'] -%}
        influxdb_{{ loop.index }}: {
         {% if loop.first -%}
            default:   true,
         {% endif -%}
            type:     'influxdb',
            url:      'http://{{ minion }}:8086/db/graphite',
            username: 'root',
            password: 'root'
        }{% if not loop.last %},{% endif %}
    {% endfor -%}
    },

    {% elif minions['graphite-web'] -%}
    {% if   minions['graphite-web']|count < 2 -%}

    graphiteUrl:   "http://{{ minions['graphite-web'][0] }}",

    {% else -%}

    datasources: {
    {% for  minion in minions['graphite-web'] -%}
        graphite_{{ loop.index }}: {
         {% if loop.first -%}
            default:   true,
         {% endif -%}
            type:     'graphite',
            url:      'http://{{ minion }}'
        }{% if not loop.last %},{% endif %}
    {% endfor -%}
    },

    {% endif -%}
    {% endif -%}

    default_route: '/dashboard/file/default.json',
    timezoneOffset: null,
    panel_names: [
      'text',
      'graphite'
    ]
  });
});
