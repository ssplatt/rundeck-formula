# vim: ft=sls
# Init rundeck
{%- from "rundeck/map.jinja" import rundeck with context %}

{% if rundeck.enabled %}
include:
  {% if rundeck.mockup -%}
  - rundeck.mockup
  {%- endif %}
  - rundeck.install
  - rundeck.config
  - rundeck.service
{% else %}
'rundeck-formula disabled':
  test.succeed_without_changes
{% endif %}
