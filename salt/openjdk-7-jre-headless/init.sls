# vi: set ft=yaml.jinja :

{% from  'openjdk-7-jre-headless/map.jinja'
   import openjdk_7_jre_headless
   with   context %}

openjdk-7-jre-headless:
  pkg.installed:
    - name:     {{ openjdk_7_jre_headless['pkg']['name'] }}
