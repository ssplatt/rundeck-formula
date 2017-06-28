# vim: ft=sls
# How to install rundeck
{%- from "rundeck/map.jinja" import rundeck with context %}

rundeck_dependency_pkgs:
  pkg.installed:
    - pkgs: {{ rundeck.dep_pkgs }}
    {% if rundeck.dep_fromrepo is defined -%}
    - fromrepo: {{ rundeck.dep_fromrepo }}
    {%- endif %}

{% if rundeck.pro.enabled %}
rundeck_download_pro_package:
  file.managed:
    - name: /root/{{ rundeck.pro.pkg }}
    - source: {{ rundeck.pro.url }}/{{ rundeck.pro.pkg }}
    - source_hash: {{ rundeck.pro.hash }}
    - user: root
    - group: root
    - mode: 644
  
rundeck_install_pro_package:
  pkg.installed:
    - sources:
      - rundeckpro-team: /root/{{ rundeck.pro.pkg }}
  
{% else %}
rundeck_pkg:
  pkg.installed:
    - name: {{ rundeck.pkg }}
{% endif %}

{% if rundeck.plugin.saltstep.enabled %}
rundeck_saltstep_plugin:
  file.managed:
    - name: /var/lib/rundeck/libext/{{ rundeck.plugin.saltstep.pkg }}
    - source: {{ rundeck.plugin.saltstep.url }}/{{ rundeck.plugin.saltstep.pkg }}
    - source_hash: {{ rundeck.plugin.saltstep.hash }}
    - user: root
    - group: root
    - mode: 644
{% endif %}

{% if rundeck.plugin.saltgenresource.enabled %}
rundeck_saltgenresource_plugin:
  file.managed:
    - name: /var/lib/rundeck/libext/{{ rundeck.plugin.saltgenresource.pkg }}
    - source: {{ rundeck.plugin.saltgenresource.url }}/{{ rundeck.plugin.saltgenresource.pkg }}
    - source_hash: {{ rundeck.plugin.saltgenresource.hash }}
    - user: root
    - group: root
    - mode: 644
{% endif %}
