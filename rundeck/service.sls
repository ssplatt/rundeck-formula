# vim: ft=sls
# Manage service for service rundeck
{%- from "rundeck/map.jinja" import rundeck with context %}

rundeck_service:
 service.{{ rundeck.service.state }}:
   - name: {{ rundeck.service.name }}
   - enable: {{ rundeck.service.enable }}
