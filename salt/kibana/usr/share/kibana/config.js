{% set minions = salt['roles.dict']('elasticsearch') -%}
/**
 * These is the app's configuration, If you need to configure
 * the default dashboard, please see dashboards/default
 */
define(['settings'],
function (Settings) {


  return new Settings({

    {% if minions['elasticsearch'] -%}

    elasticsearch: "http://{{ minions['elasticsearch'][0] }}:9200",

    {% endif -%}

    kibana_index: "kibana-int",
    panel_names: [
      'histogram',
      'map',
      'pie',
      'table',
      'filtering',
      'timepicker',
      'text',
      'fields',
      'hits',
      'dashcontrol',
      'column',
      'derivequeries',
      'trends',
      'bettermap',
      'query',
      'terms',
      'sparklines'
    ]
  });
});
